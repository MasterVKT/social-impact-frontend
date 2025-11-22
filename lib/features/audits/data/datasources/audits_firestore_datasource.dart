import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/audit_model.dart';
import '../../domain/entities/audit.dart';

class AuditsFirestoreDataSource {
  final FirebaseFirestore _firestore;

  AuditsFirestoreDataSource(this._firestore);

  CollectionReference get _auditsCollection => _firestore.collection('audits');
  CollectionReference get _reportsCollection => _firestore.collection('audit_reports');

  Future<String> createAudit(AuditModel audit) async {
    final docRef = await _auditsCollection.add({
      ...audit.toJson(),
      'createdAt': FieldValue.serverTimestamp(),
      'assignedAt': FieldValue.serverTimestamp(),
    });
    debugPrint('✅ Audit created: ${docRef.id}');
    return docRef.id;
  }

  Future<AuditModel?> getAudit(String id) async {
    final doc = await _auditsCollection.doc(id).get();
    if (!doc.exists) return null;
    final data = doc.data() as Map<String, dynamic>;
    data['id'] = doc.id;
    return AuditModel.fromJson(data);
  }

  Stream<List<AuditModel>> getProjectAudits(String projectId) {
    return _auditsCollection
        .where('projectId', isEqualTo: projectId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => AuditModel.fromJson({...doc.data() as Map<String, dynamic>, 'id': doc.id}))
            .toList());
  }

  Stream<List<AuditModel>> getAuditorAudits(String auditorId) {
    return _auditsCollection
        .where('assignedTo', isEqualTo: auditorId)
        .orderBy('dueDate')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => AuditModel.fromJson({...doc.data() as Map<String, dynamic>, 'id': doc.id}))
            .toList());
  }

  Future<void> updateAuditStatus(String id, AuditStatus status) async {
    await _auditsCollection.doc(id).update({
      'status': status.name,
      'updatedAt': FieldValue.serverTimestamp(),
      if (status == AuditStatus.completed) 'completedAt': FieldValue.serverTimestamp(),
    });
    debugPrint('✅ Audit status updated: $id → ${status.name}');
  }

  Future<void> updateCriterionScore({
    required String auditId,
    required String criterionId,
    required double score,
    String? notes,
  }) async {
    final audit = await getAudit(auditId);
    if (audit == null) throw Exception('Audit not found');

    final updatedCriteria = audit.criteria.map((c) {
      if (c.id == criterionId) {
        return c.toJson()..addAll({'score': score, if (notes != null) 'notes': notes});
      }
      return c.toJson();
    }).toList();

    await _auditsCollection.doc(auditId).update({
      'criteria': updatedCriteria,
      'updatedAt': FieldValue.serverTimestamp(),
    });
    debugPrint('✅ Criterion scored: $criterionId → $score');
  }

  Future<String> createAuditReport(AuditReportModel report) async {
    final docRef = await _reportsCollection.add({
      ...report.toJson(),
      'submittedAt': FieldValue.serverTimestamp(),
      'createdAt': FieldValue.serverTimestamp(),
    });
    debugPrint('✅ Audit report created: ${docRef.id}');
    return docRef.id;
  }

  Future<AuditReportModel?> getAuditReport(String auditId) async {
    final snapshot = await _reportsCollection
        .where('auditId', isEqualTo: auditId)
        .limit(1)
        .get();
    if (snapshot.docs.isEmpty) return null;
    final doc = snapshot.docs.first;
    return AuditReportModel.fromJson({...doc.data() as Map<String, dynamic>, 'id': doc.id});
  }

  Stream<List<AuditModel>> getAuditsByStatus(AuditStatus status) {
    return _auditsCollection
        .where('status', isEqualTo: status.name)
        .orderBy('dueDate')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => AuditModel.fromJson({...doc.data() as Map<String, dynamic>, 'id': doc.id}))
            .toList());
  }

  Future<void> deleteAudit(String id) async {
    await _auditsCollection.doc(id).delete();
    debugPrint('✅ Audit deleted: $id');
  }
}
