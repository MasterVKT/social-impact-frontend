import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/project_model.dart';
import '../../domain/entities/project.dart';

/// Firestore data source for projects
class ProjectsFirestoreDataSource {
  final FirebaseFirestore _firestore;

  ProjectsFirestoreDataSource(this._firestore);

  /// Collection reference
  CollectionReference get _projectsCollection =>
      _firestore.collection('projects');

  /// Create a new project
  Future<String> createProject(ProjectModel project) async {
    try {
      final docRef = await _projectsCollection.add(project.toJson());
      debugPrint('✅ Project created with ID: ${docRef.id}');
      return docRef.id;
    } catch (e) {
      debugPrint('❌ Error creating project: $e');
      rethrow;
    }
  }

  /// Update an existing project
  Future<void> updateProject(String id, Map<String, dynamic> data) async {
    try {
      data['updatedAt'] = FieldValue.serverTimestamp();
      await _projectsCollection.doc(id).update(data);
      debugPrint('✅ Project updated: $id');
    } catch (e) {
      debugPrint('❌ Error updating project: $e');
      rethrow;
    }
  }

  /// Update project status
  Future<void> updateProjectStatus(String id, ProjectStatus status) async {
    try {
      await _projectsCollection.doc(id).update({
        'status': status.name,
        'updatedAt': FieldValue.serverTimestamp(),
      });
      debugPrint('✅ Project status updated: $id → ${status.name}');
    } catch (e) {
      debugPrint('❌ Error updating project status: $e');
      rethrow;
    }
  }

  /// Update project funding
  Future<void> updateProjectFunding(String id, double newFunding) async {
    try {
      await _projectsCollection.doc(id).update({
        'currentFunding': newFunding,
        'updatedAt': FieldValue.serverTimestamp(),
      });
      debugPrint('✅ Project funding updated: $id → €$newFunding');
    } catch (e) {
      debugPrint('❌ Error updating project funding: $e');
      rethrow;
    }
  }

  /// Get a single project by ID
  Future<ProjectModel?> getProject(String id) async {
    try {
      final doc = await _projectsCollection.doc(id).get();

      if (!doc.exists) {
        debugPrint('⚠️ Project not found: $id');
        return null;
      }

      final data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;

      return ProjectModel.fromJson(data);
    } catch (e) {
      debugPrint('❌ Error getting project: $e');
      rethrow;
    }
  }

  /// Get projects stream with filters
  Stream<List<ProjectModel>> getProjectsStream({
    ProjectCategory? category,
    ProjectStatus? status,
    String? creatorId,
    int? limit,
  }) {
    try {
      Query query = _projectsCollection;

      // Apply filters
      if (category != null) {
        query = query.where('category', isEqualTo: category.name);
      }

      if (status != null) {
        query = query.where('status', isEqualTo: status.name);
      }

      if (creatorId != null) {
        query = query.where('creatorId', isEqualTo: creatorId);
      }

      // Order by creation date (newest first)
      query = query.orderBy('createdAt', descending: true);

      // Apply limit
      if (limit != null) {
        query = query.limit(limit);
      }

      return query.snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          data['id'] = doc.id;
          return ProjectModel.fromJson(data);
        }).toList();
      });
    } catch (e) {
      debugPrint('❌ Error getting projects stream: $e');
      rethrow;
    }
  }

  /// Get projects for a specific creator
  Stream<List<ProjectModel>> getCreatorProjects(String creatorId) {
    return getProjectsStream(creatorId: creatorId);
  }

  /// Get active projects (fundingActive status)
  Stream<List<ProjectModel>> getActiveProjects({int? limit}) {
    return getProjectsStream(
      status: ProjectStatus.fundingActive,
      limit: limit,
    );
  }

  /// Get projects by category
  Stream<List<ProjectModel>> getProjectsByCategory(
    ProjectCategory category, {
    int? limit,
  }) {
    return getProjectsStream(
      category: category,
      status: ProjectStatus.fundingActive,
      limit: limit,
    );
  }

  /// Search projects by name or description
  Future<List<ProjectModel>> searchProjects(String query) async {
    try {
      // Note: This is a simple implementation
      // For better search, consider using Algolia or similar
      final snapshot = await _projectsCollection
          .where('status', isEqualTo: ProjectStatus.fundingActive.name)
          .get();

      final projects = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return ProjectModel.fromJson(data);
      }).toList();

      // Filter by query (case-insensitive)
      final searchQuery = query.toLowerCase();
      return projects.where((project) {
        return project.name.toLowerCase().contains(searchQuery) ||
            project.description.toLowerCase().contains(searchQuery);
      }).toList();
    } catch (e) {
      debugPrint('❌ Error searching projects: $e');
      return [];
    }
  }

  /// Delete a project
  Future<void> deleteProject(String id) async {
    try {
      await _projectsCollection.doc(id).delete();
      debugPrint('✅ Project deleted: $id');
    } catch (e) {
      debugPrint('❌ Error deleting project: $e');
      rethrow;
    }
  }

  /// Get project statistics for a creator
  Future<Map<String, dynamic>> getCreatorStats(String creatorId) async {
    try {
      final snapshot = await _projectsCollection
          .where('creatorId', isEqualTo: creatorId)
          .get();

      final projects = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return ProjectModel.fromJson({...data, 'id': doc.id});
      }).toList();

      // Calculate statistics
      final totalProjects = projects.length;
      final activeProjects = projects
          .where((p) => p.status == ProjectStatus.fundingActive)
          .length;
      final completedProjects = projects
          .where((p) => p.status == ProjectStatus.completed)
          .length;
      final totalFundingRaised = projects.fold<double>(
        0.0,
        (sum, project) => sum + project.currentFunding,
      );

      return {
        'totalProjects': totalProjects,
        'activeProjects': activeProjects,
        'completedProjects': completedProjects,
        'totalFundingRaised': totalFundingRaised,
      };
    } catch (e) {
      debugPrint('❌ Error getting creator stats: $e');
      return {
        'totalProjects': 0,
        'activeProjects': 0,
        'completedProjects': 0,
        'totalFundingRaised': 0.0,
      };
    }
  }
}
