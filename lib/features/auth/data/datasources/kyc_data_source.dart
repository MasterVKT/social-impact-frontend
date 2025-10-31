import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../../domain/entities/kyc.dart';
import '../../../../core/services/storage/adaptive_storage_service.dart';

/// Firebase data source for KYC (Know Your Customer) operations
/// Handles all KYC-related Firebase Firestore operations and file uploads
class KYCDataSource {
  final FirebaseFirestore _firestore;
  final AdaptiveStorageService _storage;
  
  // Collections
  static const String _kycCollection = 'kyc_data';
  static const String _documentsCollection = 'kyc_documents';
  static const String _verificationStepsCollection = 'verification_steps';
  static const String _riskAssessmentsCollection = 'risk_assessments';
  
  // Local storage keys
  static const String _kycCacheKey = 'kyc_cache';
  static const String _documentsCacheKey = 'kyc_documents_cache';
  
  KYCDataSource({
    FirebaseFirestore? firestore,
    AdaptiveStorageService? storage,
  }) : _firestore = firestore ?? FirebaseFirestore.instance,
       _storage = storage ?? AdaptiveStorageService.instance;
  
  /// Get KYC data for a specific user
  Future<KYCData?> getKYCData(String userId) async {
    try {
      // Try to get from cache first
      final cachedData = await _storage.getJson(
        key: '${_kycCacheKey}_$userId',
        secure: true,
      );
      
      if (cachedData != null) {
        final expiryTimestamp = cachedData['expiry'] as int?;
        if (expiryTimestamp != null && 
            DateTime.now().millisecondsSinceEpoch < expiryTimestamp) {
          if (kDebugMode) {
            print('KYCDataSource: Loading KYC data from cache for user $userId');
          }
          return KYCData.fromJson(cachedData['data'] as Map<String, dynamic>);
        }
      }
      
      // Get from Firestore
      final querySnapshot = await _firestore
          .collection(_kycCollection)
          .where('userId', isEqualTo: userId)
          .limit(1)
          .get();
      
      if (querySnapshot.docs.isEmpty) {
        return null;
      }
      
      final doc = querySnapshot.docs.first;
      final kycData = KYCData.fromJson({
        'id': doc.id,
        ...doc.data(),
      });
      
      // Cache the result for 1 hour
      await _cacheKYCData(userId, kycData);
      
      return kycData;
    } catch (e) {
      if (kDebugMode) {
        print('KYCDataSource: Error getting KYC data for user $userId: $e');
      }
      rethrow;
    }
  }
  
  /// Create new KYC record for user
  Future<KYCData> createKYCData({
    required String userId,
    required KYCLevel level,
  }) async {
    try {
      final now = DateTime.now();
      final kycData = KYCData(
        id: '', // Will be set by Firestore
        userId: userId,
        status: KYCStatus.pending,
        level: level,
        createdAt: now,
        updatedAt: now,
        personalInfo: _createEmptyPersonalInfo(),
        addressInfo: _createEmptyAddressInfo(),
        documents: [],
      );
      
      final docRef = await _firestore.collection(_kycCollection).add({
        ...kycData.toJson(),
        'createdAt': FieldValue.serverTimestamp(),
      });
      
      final createdKYC = kycData.copyWith(id: docRef.id);
      
      // Clear cache to force refresh
      await _clearKYCCache(userId);
      
      if (kDebugMode) {
        print('KYCDataSource: Created KYC record ${docRef.id} for user $userId');
      }
      
      return createdKYC;
    } catch (e) {
      if (kDebugMode) {
        print('KYCDataSource: Error creating KYC data for user $userId: $e');
      }
      rethrow;
    }
  }
  
  /// Update KYC data
  Future<KYCData> updateKYCData(KYCData kycData) async {
    try {
      await _firestore.collection(_kycCollection).doc(kycData.id).update({
        ...kycData.toJson(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
      
      // Clear cache to force refresh
      await _clearKYCCache(kycData.userId);
      
      if (kDebugMode) {
        print('KYCDataSource: Updated KYC record ${kycData.id}');
      }
      
      return kycData;
    } catch (e) {
      if (kDebugMode) {
        print('KYCDataSource: Error updating KYC data ${kycData.id}: $e');
      }
      rethrow;
    }
  }
  
  /// Submit KYC data for review
  Future<KYCData> submitForReview(String kycId) async {
    try {
      final now = DateTime.now();
      
      await _firestore.collection(_kycCollection).doc(kycId).update({
        'status': KYCStatus.inReview.name,
        'submittedAt': FieldValue.serverTimestamp(),
      });
      
      // Get updated KYC data
      final doc = await _firestore.collection(_kycCollection).doc(kycId).get();
      if (!doc.exists) {
        throw Exception('KYC record not found');
      }
      
      final kycData = KYCData.fromJson({
        'id': doc.id,
        ...doc.data()!,
      });
      
      if (kDebugMode) {
        print('KYCDataSource: Submitted KYC record $kycId for review');
      }
      
      return kycData;
    } catch (e) {
      if (kDebugMode) {
        print('KYCDataSource: Error submitting KYC data $kycId: $e');
      }
      rethrow;
    }
  }
  
  /// Upload document for KYC verification
  Future<KYCDocument> uploadDocument({
    required String kycId,
    required String fileName,
    required List<int> fileBytes,
    required DocumentType type,
    String? description,
  }) async {
    try {
      // In a real app, you would upload to Firebase Storage or similar
      // For now, we'll simulate by storing base64 in Firestore
      final base64Data = base64Encode(fileBytes);
      
      final document = KYCDocument(
        id: '', // Will be set by Firestore
        type: type,
        fileName: fileName,
        filePath: 'uploads/kyc/$kycId/$fileName', // Simulated path
        fileUrl: 'data:application/octet-stream;base64,$base64Data', // Simulated URL
        uploadedAt: DateTime.now(),
        verificationNotes: description,
        isVerified: false,
      );
      
      final docRef = await _firestore.collection(_documentsCollection).add({
        ...document.toJson(),
        'kycId': kycId,
        'uploadedAt': FieldValue.serverTimestamp(),
      });
      
      final uploadedDocument = document.copyWith(id: docRef.id);
      
      // Update KYC record with document reference
      await _firestore.collection(_kycCollection).doc(kycId).update({
        'documents': FieldValue.arrayUnion([uploadedDocument.toJson()]),
        'updatedAt': FieldValue.serverTimestamp(),
      });
      
      if (kDebugMode) {
        print('KYCDataSource: Uploaded document ${docRef.id} for KYC $kycId');
      }
      
      return uploadedDocument;
    } catch (e) {
      if (kDebugMode) {
        print('KYCDataSource: Error uploading document for KYC $kycId: $e');
      }
      rethrow;
    }
  }
  
  /// Delete uploaded document
  Future<void> deleteDocument(String documentId) async {
    try {
      await _firestore.collection(_documentsCollection).doc(documentId).delete();
      
      if (kDebugMode) {
        print('KYCDataSource: Deleted document $documentId');
      }
    } catch (e) {
      if (kDebugMode) {
        print('KYCDataSource: Error deleting document $documentId: $e');
      }
      rethrow;
    }
  }
  
  /// Get all documents for a KYC record
  Future<List<KYCDocument>> getDocuments(String kycId) async {
    try {
      final querySnapshot = await _firestore
          .collection(_documentsCollection)
          .where('kycId', isEqualTo: kycId)
          .orderBy('uploadedAt', descending: true)
          .get();
      
      return querySnapshot.docs.map((doc) {
        return KYCDocument.fromJson({
          'id': doc.id,
          ...doc.data(),
        });
      }).toList();
    } catch (e) {
      if (kDebugMode) {
        print('KYCDataSource: Error getting documents for KYC $kycId: $e');
      }
      rethrow;
    }
  }
  
  /// Start verification step
  Future<KYCVerificationStep> startVerificationStep({
    required String kycId,
    required KYCStepType stepType,
  }) async {
    try {
      final step = KYCVerificationStep(
        id: _generateStepId(stepType),
        stepId: _generateStepId(stepType),
        name: _getStepName(stepType),
        type: stepType,
        status: KYCStepStatus.inProgress,
        title: _getStepName(stepType),
        description: _getStepDescription(stepType),
      );
      
      // Update KYC record with new step
      await _firestore.collection(_kycCollection).doc(kycId).update({
        'verificationSteps': FieldValue.arrayUnion([step.toJson()]),
        'updatedAt': FieldValue.serverTimestamp(),
      });
      
      if (kDebugMode) {
        print('KYCDataSource: Started verification step ${step.stepId} for KYC $kycId');
      }
      
      return step;
    } catch (e) {
      if (kDebugMode) {
        print('KYCDataSource: Error starting verification step for KYC $kycId: $e');
      }
      rethrow;
    }
  }
  
  /// Complete verification step
  Future<KYCVerificationStep> completeVerificationStep({
    required String kycId,
    required String stepId,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      // Get current KYC data
      final kycDoc = await _firestore.collection(_kycCollection).doc(kycId).get();
      if (!kycDoc.exists) {
        throw Exception('KYC record not found');
      }
      
      final kycData = kycDoc.data()!;
      final steps = (kycData['verificationSteps'] as List<dynamic>? ?? [])
          .map((step) => KYCVerificationStep.fromJson(step as Map<String, dynamic>))
          .toList();
      
      // Find and update the step
      final stepIndex = steps.indexWhere((step) => step.stepId == stepId);
      if (stepIndex == -1) {
        throw Exception('Verification step not found');
      }
      
      final updatedStep = steps[stepIndex].copyWith(
        status: KYCStepStatus.completed,
        completedAt: DateTime.now(),
        metadata: metadata ?? {},
      );
      
      steps[stepIndex] = updatedStep;
      
      // Update KYC record
      await _firestore.collection(_kycCollection).doc(kycId).update({
        'verificationSteps': steps.map((step) => step.toJson()).toList(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
      
      if (kDebugMode) {
        print('KYCDataSource: Completed verification step $stepId for KYC $kycId');
      }
      
      return updatedStep;
    } catch (e) {
      if (kDebugMode) {
        print('KYCDataSource: Error completing verification step $stepId: $e');
      }
      rethrow;
    }
  }
  
  /// Perform risk assessment
  Future<RiskAssessment> performRiskAssessment(String kycId) async {
    try {
      // Get KYC data for assessment
      final kycDoc = await _firestore.collection(_kycCollection).doc(kycId).get();
      if (!kycDoc.exists) {
        throw Exception('KYC record not found');
      }
      
      final kycData = KYCData.fromJson({
        'id': kycDoc.id,
        ...kycDoc.data()!,
      });
      
      // Perform risk assessment logic
      final riskAssessment = _calculateRiskAssessment(kycData);
      
      // Store risk assessment
      await _firestore.collection(_riskAssessmentsCollection).add({
        ...riskAssessment.toJson(),
        'kycId': kycId,
        'assessedAt': FieldValue.serverTimestamp(),
      });
      
      // Update KYC record with risk assessment
      await _firestore.collection(_kycCollection).doc(kycId).update({
        'riskAssessment': riskAssessment.toJson(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
      
      if (kDebugMode) {
        print('KYCDataSource: Completed risk assessment for KYC $kycId');
      }
      
      return riskAssessment;
    } catch (e) {
      if (kDebugMode) {
        print('KYCDataSource: Error performing risk assessment for KYC $kycId: $e');
      }
      rethrow;
    }
  }
  
  /// Get KYC statistics
  Future<Map<String, dynamic>> getKYCStats(String userId) async {
    try {
      final kycData = await getKYCData(userId);
      if (kycData == null) {
        return {
          'hasKYC': false,
          'level': null,
          'status': null,
          'progress': 0.0,
          'completedSteps': 0,
          'totalSteps': 0,
        };
      }
      
      return {
        'hasKYC': true,
        'level': kycData.level.name,
        'status': kycData.status.name,
        'progress': kycData.completionPercentage,
        'completedSteps': kycData.verificationSteps
            .where((step) => step.status == KYCStepStatus.completed)
            .length,
        'totalSteps': kycData.verificationSteps.length,
        'isVerified': kycData.isVerified,
        'isPendingReview': kycData.isPendingReview,
        'isExpired': kycData.isExpired,
      };
    } catch (e) {
      if (kDebugMode) {
        print('KYCDataSource: Error getting KYC stats for user $userId: $e');
      }
      rethrow;
    }
  }
  
  /// Cache KYC data locally
  Future<void> _cacheKYCData(String userId, KYCData kycData) async {
    try {
      const cacheHours = 1;
      final expiryTimestamp = DateTime.now()
          .add(const Duration(hours: cacheHours))
          .millisecondsSinceEpoch;
      
      await _storage.setJson(
        key: '${_kycCacheKey}_$userId',
        value: {
          'data': kycData.toJson(),
          'expiry': expiryTimestamp,
        },
        secure: true,
      );
    } catch (e) {
      if (kDebugMode) {
        print('KYCDataSource: Error caching KYC data: $e');
      }
      // Don't throw - caching failure shouldn't break functionality
    }
  }
  
  /// Clear KYC cache for user
  Future<void> _clearKYCCache(String userId) async {
    try {
      await _storage.remove(key: '${_kycCacheKey}_$userId', secure: true);
    } catch (e) {
      if (kDebugMode) {
        print('KYCDataSource: Error clearing KYC cache: $e');
      }
      // Don't throw - cache clearing failure shouldn't break functionality
    }
  }
  
  /// Generate initial verification steps based on KYC level
  List<KYCVerificationStep> _generateInitialSteps(KYCLevel level) {
    final steps = <KYCVerificationStep>[];
    
    // Basic steps for all levels
    steps.add(KYCVerificationStep(
      id: 'personal_info_${DateTime.now().millisecondsSinceEpoch}',
      stepId: 'personal_info',
      name: 'Personal Information',
      type: KYCStepType.documentUpload,
      status: KYCStepStatus.pending,
      title: 'Personal Information',
      description: 'Provide your personal information',
    ));
    
    steps.add(KYCVerificationStep(
      id: 'identity_verification_${DateTime.now().millisecondsSinceEpoch}',
      stepId: 'identity_verification',
      name: 'Identity Verification',
      type: KYCStepType.identityVerification,
      status: KYCStepStatus.pending,
      title: 'Identity Verification',
      description: 'Upload identity document',
    ));
    
    steps.add(KYCVerificationStep(
      id: 'address_verification_${DateTime.now().millisecondsSinceEpoch}',
      stepId: 'address_verification',
      name: 'Address Verification',
      type: KYCStepType.addressVerification,
      status: KYCStepStatus.pending,
      title: 'Address Verification',
      description: 'Upload proof of address',
    ));
    
    // Enhanced and institutional specific steps
    if (level == KYCLevel.enhanced || level == KYCLevel.institutional) {
      steps.add(KYCVerificationStep(
        id: 'financial_verification_${DateTime.now().millisecondsSinceEpoch}',
        stepId: 'financial_verification',
        name: 'Financial Verification',
        type: KYCStepType.financialVerification,
        status: KYCStepStatus.pending,
        title: 'Financial Verification',
        description: 'Provide financial information',
      ));
    }
    
    // Institutional specific steps
    if (level == KYCLevel.institutional) {
      steps.add(KYCVerificationStep(
        id: 'business_verification_${DateTime.now().millisecondsSinceEpoch}',
        stepId: 'business_verification',
        name: 'Business Verification',
        type: KYCStepType.businessVerification,
        status: KYCStepStatus.pending,
        title: 'Business Verification',
        description: 'Provide business information and documentation',
      ));
    }
    
    // Final steps for all levels
    steps.add(KYCVerificationStep(
      id: 'risk_assessment_${DateTime.now().millisecondsSinceEpoch}',
      stepId: 'risk_assessment',
      name: 'Risk Assessment',
      type: KYCStepType.riskAssessment,
      status: KYCStepStatus.pending,
      title: 'Risk Assessment',
      description: 'Automated risk assessment',
    ));
    
    steps.add(KYCVerificationStep(
      id: 'manual_review_${DateTime.now().millisecondsSinceEpoch}',
      stepId: 'manual_review',
      name: 'Manual Review',
      type: KYCStepType.manualReview,
      status: KYCStepStatus.pending,
      title: 'Manual Review',
      description: 'Manual review by compliance team',
    ));
    
    return steps;
  }
  
  /// Calculate risk assessment based on KYC data
  RiskAssessment _calculateRiskAssessment(KYCData kycData) {
    final riskFactors = <RiskFactor>[];
    double totalScore = 0.0;
    
    // Country risk factor
    final countryRisk = _getCountryRisk(kycData.personalInfo.countryOfResidence);
    if (countryRisk != null) {
      riskFactors.add(countryRisk);
      totalScore += countryRisk.weight;
    }
    
    // Age risk factor
    final age = DateTime.now().difference(kycData.personalInfo.dateOfBirth).inDays / 365;
    final ageRisk = _getAgeRisk(age);
    riskFactors.add(ageRisk);
    totalScore += ageRisk.weight;
      
    // Financial risk factor
    if (kycData.financialInfo != null) {
      final financialRisk = _getFinancialRisk(kycData.financialInfo!);
      riskFactors.add(financialRisk);
      totalScore += financialRisk.weight;
    }
    
    // Determine overall risk level
    final riskLevel = _determineRiskLevel(totalScore);
    
    return RiskAssessment(
      riskLevel: riskLevel,
      riskScore: totalScore,
      assessedAt: DateTime.now(),
      assessedBy: 'system',
      riskFactors: riskFactors,
      notes: 'Automated risk assessment completed',
      nextReviewDate: DateTime.now().add(const Duration(days: 365)),
    );
  }
  
  /// Get country-specific risk factor
  RiskFactor? _getCountryRisk(String? country) {
    if (country == null) return null;
    
    // Simplified country risk assessment
    final highRiskCountries = ['AF', 'KP', 'IR', 'SY'];
    final lowRiskCountries = ['US', 'GB', 'DE', 'CA', 'AU'];
    
    if (highRiskCountries.contains(country)) {
      return const RiskFactor(
        factor: 'Country Risk',
        level: RiskLevel.high,
        weight: 0.4,
        description: 'High-risk jurisdiction',
      );
    } else if (lowRiskCountries.contains(country)) {
      return const RiskFactor(
        factor: 'Country Risk',
        level: RiskLevel.low,
        weight: 0.1,
        description: 'Low-risk jurisdiction',
      );
    } else {
      return const RiskFactor(
        factor: 'Country Risk',
        level: RiskLevel.medium,
        weight: 0.2,
        description: 'Medium-risk jurisdiction',
      );
    }
  }
  
  /// Get age-based risk factor
  RiskFactor _getAgeRisk(double age) {
    if (age < 25) {
      return const RiskFactor(
        factor: 'Age Risk',
        level: RiskLevel.medium,
        weight: 0.2,
        description: 'Young investor profile',
      );
    } else if (age > 65) {
      return const RiskFactor(
        factor: 'Age Risk',
        level: RiskLevel.medium,
        weight: 0.15,
        description: 'Senior investor profile',
      );
    } else {
      return const RiskFactor(
        factor: 'Age Risk',
        level: RiskLevel.low,
        weight: 0.05,
        description: 'Standard age profile',
      );
    }
  }
  
  /// Get financial risk factor
  RiskFactor _getFinancialRisk(FinancialInfo financialInfo) {
    if (financialInfo.sourceOfWealth == WealthSource.other ||
        financialInfo.annualIncome == IncomeRange.under25k) {
      return const RiskFactor(
        factor: 'Financial Risk',
        level: RiskLevel.medium,
        weight: 0.25,
        description: 'Requires additional scrutiny',
      );
    } else {
      return const RiskFactor(
        factor: 'Financial Risk',
        level: RiskLevel.low,
        weight: 0.1,
        description: 'Standard financial profile',
      );
    }
  }
  
  /// Determine overall risk level from score
  RiskLevel _determineRiskLevel(double score) {
    if (score >= 0.6) return RiskLevel.high;
    if (score >= 0.3) return RiskLevel.medium;
    return RiskLevel.low;
  }
  
  /// Helper methods
  String _generateStepId(KYCStepType stepType) {
    return '${stepType.name}_${DateTime.now().millisecondsSinceEpoch}';
  }
  
  String _getStepName(KYCStepType stepType) {
    switch (stepType) {
      case KYCStepType.personalInformation:
        return 'Personal Information';
      case KYCStepType.documentUpload:
        return 'Document Upload';
      case KYCStepType.identityVerification:
        return 'Identity Verification';
      case KYCStepType.addressVerification:
        return 'Address Verification';
      case KYCStepType.documentVerification:
        return 'Document Verification';
      case KYCStepType.biometricVerification:
        return 'Biometric Verification';
      case KYCStepType.financialVerification:
        return 'Financial Verification';
      case KYCStepType.businessVerification:
        return 'Business Verification';
      case KYCStepType.riskAssessment:
        return 'Risk Assessment';
      case KYCStepType.manualReview:
        return 'Manual Review';
    }
  }
  
  String _getStepDescription(KYCStepType stepType) {
    switch (stepType) {
      case KYCStepType.personalInformation:
        return 'Provide your personal information';
      case KYCStepType.documentUpload:
        return 'Upload required documents for verification';
      case KYCStepType.identityVerification:
        return 'Verify your identity with official documents';
      case KYCStepType.addressVerification:
        return 'Verify your address with proof of residence';
      case KYCStepType.documentVerification:
        return 'Document verification process';
      case KYCStepType.biometricVerification:
        return 'Biometric verification process';
      case KYCStepType.financialVerification:
        return 'Provide financial information and documentation';
      case KYCStepType.businessVerification:
        return 'Verify business information and registration';
      case KYCStepType.riskAssessment:
        return 'Automated risk assessment based on provided information';
      case KYCStepType.manualReview:
        return 'Manual review by compliance team';
    }
  }
  
  bool _isDocumentRequired(DocumentType type) {
    switch (type) {
      case DocumentType.passport:
      case DocumentType.driverLicense:
      case DocumentType.nationalId:
      case DocumentType.identityFront:
      case DocumentType.identityBack:
      case DocumentType.proofOfAddress:
        return true;
      case DocumentType.utilityBill:
      case DocumentType.selfie:
      case DocumentType.bankStatement:
      case DocumentType.businessRegistration:
      case DocumentType.taxDocument:
      case DocumentType.authorizationLetter:
        return false;
    }
  }
  
  /// Create empty personal info for new KYC records
  PersonalInfo _createEmptyPersonalInfo() {
    return PersonalInfo(
      firstName: '',
      lastName: '',
      dateOfBirth: DateTime.now().subtract(const Duration(days: 365 * 18)), // Default to 18 years ago
      nationality: '',
      phoneNumber: '',
      email: '',
    );
  }
  
  /// Create empty address info for new KYC records
  AddressInfo _createEmptyAddressInfo() {
    return const AddressInfo(
      street: '',
      city: '',
      state: '',
      postalCode: '',
      country: '',
    );
  }
}