import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/milestone_evidence_model.dart';
import '../../domain/entities/milestone_evidence.dart';
import '../../../projects/data/models/project_model.dart';
import '../../../projects/domain/entities/project.dart';

/// Firestore data source for milestones
class MilestonesFirestoreDataSource {
  final FirebaseFirestore _firestore;

  MilestonesFirestoreDataSource(this._firestore);

  /// Collection references
  CollectionReference get _projectsCollection =>
      _firestore.collection('projects');

  CollectionReference get _evidenceCollection =>
      _firestore.collection('milestone_evidence');

  /// Get milestone by ID
  Future<ProjectMilestone?> getMilestone(
    String projectId,
    String milestoneId,
  ) async {
    try {
      final projectDoc = await _projectsCollection.doc(projectId).get();

      if (!projectDoc.exists) {
        debugPrint('⚠️ Project not found: $projectId');
        return null;
      }

      final projectData = projectDoc.data() as Map<String, dynamic>;
      projectData['id'] = projectDoc.id;

      final project = ProjectModel.fromJson(projectData);

      // Find milestone in project
      final milestone = project.milestones.firstWhere(
        (m) => m.id == milestoneId,
        orElse: () => throw Exception('Milestone not found'),
      );

      return milestone.toEntity();
    } catch (e) {
      debugPrint('❌ Error getting milestone: $e');
      return null;
    }
  }

  /// Get milestones for a project
  Stream<List<ProjectMilestone>> getProjectMilestones(String projectId) {
    try {
      return _projectsCollection.doc(projectId).snapshots().map((snapshot) {
        if (!snapshot.exists) {
          return [];
        }

        final data = snapshot.data() as Map<String, dynamic>;
        data['id'] = snapshot.id;

        final project = ProjectModel.fromJson(data);
        return project.milestones.map((m) => m.toEntity()).toList();
      });
    } catch (e) {
      debugPrint('❌ Error getting project milestones: $e');
      return Stream.value([]);
    }
  }

  /// Update milestone status
  Future<void> updateMilestoneStatus(
    String projectId,
    String milestoneId,
    MilestoneStatus status,
  ) async {
    try {
      final projectDoc = await _projectsCollection.doc(projectId).get();

      if (!projectDoc.exists) {
        throw Exception('Project not found');
      }

      final projectData = projectDoc.data() as Map<String, dynamic>;
      final milestones = (projectData['milestones'] as List<dynamic>)
          .map((m) => Map<String, dynamic>.from(m as Map))
          .toList();

      // Find and update milestone
      final milestoneIndex = milestones.indexWhere(
        (m) => m['id'] == milestoneId,
      );

      if (milestoneIndex == -1) {
        throw Exception('Milestone not found');
      }

      milestones[milestoneIndex]['status'] = status.name;

      // If completed, set completion date
      if (status == MilestoneStatus.completed) {
        milestones[milestoneIndex]['completedDate'] =
            FieldValue.serverTimestamp();
      }

      // Update project
      await _projectsCollection.doc(projectId).update({
        'milestones': milestones,
        'updatedAt': FieldValue.serverTimestamp(),
      });

      debugPrint('✅ Milestone status updated: $milestoneId → ${status.name}');
    } catch (e) {
      debugPrint('❌ Error updating milestone status: $e');
      rethrow;
    }
  }

  /// Create evidence document
  Future<String> createEvidence(MilestoneEvidenceModel evidence) async {
    try {
      final docRef = await _evidenceCollection.add({
        ...evidence.toJson(),
        'createdAt': FieldValue.serverTimestamp(),
        'submittedAt': FieldValue.serverTimestamp(),
      });

      debugPrint('✅ Evidence created with ID: ${docRef.id}');
      return docRef.id;
    } catch (e) {
      debugPrint('❌ Error creating evidence: $e');
      rethrow;
    }
  }

  /// Get evidence for a milestone
  Future<MilestoneEvidenceModel?> getEvidence(String milestoneId) async {
    try {
      final snapshot = await _evidenceCollection
          .where('milestoneId', isEqualTo: milestoneId)
          .limit(1)
          .get();

      if (snapshot.docs.isEmpty) {
        return null;
      }

      final doc = snapshot.docs.first;
      final data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;

      return MilestoneEvidenceModel.fromJson(data);
    } catch (e) {
      debugPrint('❌ Error getting evidence: $e');
      return null;
    }
  }

  /// Update evidence
  Future<void> updateEvidence(
    String evidenceId,
    Map<String, dynamic> updates,
  ) async {
    try {
      await _evidenceCollection.doc(evidenceId).update({
        ...updates,
        'updatedAt': FieldValue.serverTimestamp(),
      });

      debugPrint('✅ Evidence updated: $evidenceId');
    } catch (e) {
      debugPrint('❌ Error updating evidence: $e');
      rethrow;
    }
  }

  /// Review evidence
  Future<void> reviewEvidence({
    required String evidenceId,
    required String reviewerId,
    required EvidenceStatus status,
    String? reviewerNotes,
  }) async {
    try {
      await _evidenceCollection.doc(evidenceId).update({
        'status': status.name,
        'reviewerId': reviewerId,
        'reviewerNotes': reviewerNotes,
        'reviewedAt': FieldValue.serverTimestamp(),
      });

      debugPrint('✅ Evidence reviewed: $evidenceId → ${status.name}');
    } catch (e) {
      debugPrint('❌ Error reviewing evidence: $e');
      rethrow;
    }
  }

  /// Delete evidence
  Future<void> deleteEvidence(String evidenceId) async {
    try {
      await _evidenceCollection.doc(evidenceId).delete();
      debugPrint('✅ Evidence deleted: $evidenceId');
    } catch (e) {
      debugPrint('❌ Error deleting evidence: $e');
      rethrow;
    }
  }

  /// Get milestones by status
  Stream<List<ProjectMilestone>> getMilestonesByStatus(
    String projectId,
    MilestoneStatus status,
  ) {
    try {
      return _projectsCollection.doc(projectId).snapshots().map((snapshot) {
        if (!snapshot.exists) {
          return [];
        }

        final data = snapshot.data() as Map<String, dynamic>;
        data['id'] = snapshot.id;

        final project = ProjectModel.fromJson(data);
        return project.milestones
            .where((m) => m.status == status)
            .map((m) => m.toEntity())
            .toList();
      });
    } catch (e) {
      debugPrint('❌ Error getting milestones by status: $e');
      return Stream.value([]);
    }
  }
}
