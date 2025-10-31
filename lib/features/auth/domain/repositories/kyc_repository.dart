import '../entities/kyc.dart';

/// Repository interface for KYC (Know Your Customer) operations
/// Defines all KYC-related data operations that can be implemented by various data sources
abstract class KYCRepository {
  /// Get KYC data for a specific user
  Future<KYCData?> getKYCData(String userId);
  
  /// Create new KYC record for user
  Future<KYCData> createKYCData({
    required String userId,
    required KYCLevel level,
  });
  
  /// Update KYC data
  Future<KYCData> updateKYCData(KYCData kycData);
  
  /// Submit KYC data for review
  Future<KYCData> submitForReview(String kycId);
  
  /// Upload document for KYC verification
  Future<KYCDocument> uploadDocument({
    required String kycId,
    required String fileName,
    required List<int> fileBytes,
    required DocumentType type,
    String? description,
  });
  
  /// Delete uploaded document
  Future<void> deleteDocument(String documentId);
  
  /// Get all documents for a KYC record
  Future<List<KYCDocument>> getDocuments(String kycId);
  
  /// Update personal information
  Future<void> updatePersonalInfo({
    required String kycId,
    required PersonalInfo personalInfo,
  });
  
  /// Update address information
  Future<void> updateAddressInfo({
    required String kycId,
    required AddressInfo addressInfo,
  });
  
  /// Update identity document
  Future<void> updateIdentityDocument({
    required String kycId,
    required IdentityDocument identityDocument,
  });
  
  /// Update proof of address
  Future<void> updateProofOfAddress({
    required String kycId,
    required ProofOfAddress proofOfAddress,
  });
  
  /// Update financial information
  Future<void> updateFinancialInfo({
    required String kycId,
    required FinancialInfo financialInfo,
  });
  
  /// Update business information (for organizations)
  Future<void> updateBusinessInfo({
    required String kycId,
    required BusinessInfo businessInfo,
  });
  
  /// Start verification step
  Future<KYCVerificationStep> startVerificationStep({
    required String kycId,
    required KYCStepType stepType,
  });
  
  /// Complete verification step
  Future<KYCVerificationStep> completeVerificationStep({
    required String kycId,
    required String stepId,
    Map<String, dynamic>? metadata,
  });
  
  /// Fail verification step
  Future<KYCVerificationStep> failVerificationStep({
    required String kycId,
    required String stepId,
    String? reason,
  });
  
  /// Get verification steps for KYC record
  Future<List<KYCVerificationStep>> getVerificationSteps(String kycId);
  
  /// Perform risk assessment
  Future<RiskAssessment> performRiskAssessment(String kycId);
  
  /// Get KYC statistics for user dashboard
  Future<Map<String, dynamic>> getKYCStats(String userId);
  
  /// Check if KYC level upgrade is available
  Future<bool> canUpgradeLevel({
    required String kycId,
    required KYCLevel targetLevel,
  });
  
  /// Upgrade KYC level
  Future<KYCData> upgradeKYCLevel({
    required String kycId,
    required KYCLevel newLevel,
  });
  
  /// Get KYC requirements for specific level
  Future<List<KYCStepType>> getRequiredSteps(KYCLevel level);
  
  /// Validate document against requirements
  Future<Map<String, dynamic>> validateDocument({
    required String documentUrl,
    required DocumentType type,
  });
  
  /// Get KYC verification progress
  Future<double> getVerificationProgress(String kycId);
  
  /// Check if user meets requirements for specific actions
  Future<bool> meetsRequirements({
    required String userId,
    required String action, // 'invest', 'withdraw', 'transfer', etc.
  });
}