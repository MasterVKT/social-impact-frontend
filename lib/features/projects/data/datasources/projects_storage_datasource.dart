import 'dart:io';
import 'package:flutter/foundation.dart';
import '../../../../core/services/storage/firebase_storage_service.dart';

/// Storage data source for project images
class ProjectsStorageDataSource {
  final FirebaseStorageService _storageService;

  ProjectsStorageDataSource(this._storageService);

  /// Upload cover image for a project
  Future<String> uploadCoverImage(File image, String projectId) async {
    try {
      // Compress image first
      final compressed = await _storageService.compressImage(image);

      // Upload to storage
      final downloadUrl = await _storageService.uploadFile(
        compressed,
        'projects/$projectId/images/cover.jpg',
      );

      debugPrint('✅ Cover image uploaded for project: $projectId');

      // Clean up compressed file
      try {
        await compressed.delete();
      } catch (e) {
        // Ignore cleanup errors
      }

      return downloadUrl;
    } catch (e) {
      debugPrint('❌ Error uploading cover image: $e');
      rethrow;
    }
  }

  /// Upload cover image with progress callback
  Future<String> uploadCoverImageWithProgress(
    File image,
    String projectId,
    Function(double progress) onProgress,
  ) async {
    try {
      // Compress image first
      final compressed = await _storageService.compressImage(image);

      // Upload with progress
      final downloadUrl = await _storageService.uploadFileWithProgress(
        compressed,
        'projects/$projectId/images/cover.jpg',
        onProgress,
      );

      debugPrint('✅ Cover image uploaded with progress for project: $projectId');

      // Clean up compressed file
      try {
        await compressed.delete();
      } catch (e) {
        // Ignore cleanup errors
      }

      return downloadUrl;
    } catch (e) {
      debugPrint('❌ Error uploading cover image with progress: $e');
      rethrow;
    }
  }

  /// Upload additional images for a project
  Future<List<String>> uploadAdditionalImages(
    List<File> images,
    String projectId,
  ) async {
    try {
      final downloadUrls = <String>[];

      for (var i = 0; i < images.length; i++) {
        // Compress image
        final compressed = await _storageService.compressImage(images[i]);

        // Upload to storage
        final downloadUrl = await _storageService.uploadFile(
          compressed,
          'projects/$projectId/images/additional_$i.jpg',
        );

        downloadUrls.add(downloadUrl);

        // Clean up compressed file
        try {
          await compressed.delete();
        } catch (e) {
          // Ignore cleanup errors
        }
      }

      debugPrint('✅ ${downloadUrls.length} additional images uploaded for project: $projectId');
      return downloadUrls;
    } catch (e) {
      debugPrint('❌ Error uploading additional images: $e');
      rethrow;
    }
  }

  /// Upload additional images with progress callback
  Future<List<String>> uploadAdditionalImagesWithProgress(
    List<File> images,
    String projectId,
    Function(int index, double progress) onProgress,
  ) async {
    try {
      final downloadUrls = <String>[];

      for (var i = 0; i < images.length; i++) {
        // Compress image
        final compressed = await _storageService.compressImage(images[i]);

        // Upload with progress
        final downloadUrl = await _storageService.uploadFileWithProgress(
          compressed,
          'projects/$projectId/images/additional_$i.jpg',
          (progress) => onProgress(i, progress),
        );

        downloadUrls.add(downloadUrl);

        // Clean up compressed file
        try {
          await compressed.delete();
        } catch (e) {
          // Ignore cleanup errors
        }
      }

      debugPrint('✅ ${downloadUrls.length} additional images uploaded with progress for project: $projectId');
      return downloadUrls;
    } catch (e) {
      debugPrint('❌ Error uploading additional images with progress: $e');
      rethrow;
    }
  }

  /// Delete all images for a project
  Future<void> deleteProjectImages(String projectId) async {
    try {
      // Delete cover image
      await _storageService.deleteFile('projects/$projectId/images/cover.jpg');

      // Delete additional images (try 0-2, max 3 images)
      for (var i = 0; i < 3; i++) {
        try {
          await _storageService.deleteFile(
            'projects/$projectId/images/additional_$i.jpg',
          );
        } catch (e) {
          // Image might not exist, continue
        }
      }

      debugPrint('✅ All images deleted for project: $projectId');
    } catch (e) {
      debugPrint('❌ Error deleting project images: $e');
      // Don't rethrow - it's okay if deletion fails
    }
  }

  /// Get cover image URL (if it exists)
  Future<String?> getCoverImageUrl(String projectId) async {
    try {
      return await _storageService.getDownloadUrl(
        'projects/$projectId/images/cover.jpg',
      );
    } catch (e) {
      debugPrint('⚠️ Cover image not found for project: $projectId');
      return null;
    }
  }
}
