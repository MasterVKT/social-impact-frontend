import 'dart:io';
import 'package:flutter/foundation.dart';
import '../../../../core/services/storage/firebase_storage_service.dart';

/// Storage data source for milestone evidence files
class MilestonesStorageDataSource {
  final FirebaseStorageService _storageService;

  MilestonesStorageDataSource(this._storageService);

  /// Upload evidence files
  Future<List<String>> uploadEvidenceFiles(
    List<File> files,
    String projectId,
    String milestoneId,
  ) async {
    try {
      final downloadUrls = <String>[];

      for (var i = 0; i < files.length; i++) {
        final downloadUrl = await _storageService.uploadFile(
          files[i],
          'projects/$projectId/milestones/$milestoneId/files/file_$i.pdf',
        );

        downloadUrls.add(downloadUrl);
      }

      debugPrint(
        '✅ ${downloadUrls.length} evidence files uploaded for milestone: $milestoneId',
      );
      return downloadUrls;
    } catch (e) {
      debugPrint('❌ Error uploading evidence files: $e');
      rethrow;
    }
  }

  /// Upload evidence images
  Future<List<String>> uploadEvidenceImages(
    List<File> images,
    String projectId,
    String milestoneId,
  ) async {
    try {
      final downloadUrls = <String>[];

      for (var i = 0; i < images.length; i++) {
        // Compress image
        final compressed = await _storageService.compressImage(images[i]);

        // Upload to storage
        final downloadUrl = await _storageService.uploadFile(
          compressed,
          'projects/$projectId/milestones/$milestoneId/images/image_$i.jpg',
        );

        downloadUrls.add(downloadUrl);

        // Clean up compressed file
        try {
          await compressed.delete();
        } catch (e) {
          // Ignore cleanup errors
        }
      }

      debugPrint(
        '✅ ${downloadUrls.length} evidence images uploaded for milestone: $milestoneId',
      );
      return downloadUrls;
    } catch (e) {
      debugPrint('❌ Error uploading evidence images: $e');
      rethrow;
    }
  }

  /// Upload evidence files with progress
  Future<List<String>> uploadEvidenceFilesWithProgress(
    List<File> files,
    String projectId,
    String milestoneId,
    Function(int index, double progress) onProgress,
  ) async {
    try {
      final downloadUrls = <String>[];

      for (var i = 0; i < files.length; i++) {
        final downloadUrl = await _storageService.uploadFileWithProgress(
          files[i],
          'projects/$projectId/milestones/$milestoneId/files/file_$i.pdf',
          (progress) => onProgress(i, progress),
        );

        downloadUrls.add(downloadUrl);
      }

      debugPrint(
        '✅ ${downloadUrls.length} evidence files uploaded with progress for milestone: $milestoneId',
      );
      return downloadUrls;
    } catch (e) {
      debugPrint('❌ Error uploading evidence files with progress: $e');
      rethrow;
    }
  }

  /// Upload evidence images with progress
  Future<List<String>> uploadEvidenceImagesWithProgress(
    List<File> images,
    String projectId,
    String milestoneId,
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
          'projects/$projectId/milestones/$milestoneId/images/image_$i.jpg',
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

      debugPrint(
        '✅ ${downloadUrls.length} evidence images uploaded with progress for milestone: $milestoneId',
      );
      return downloadUrls;
    } catch (e) {
      debugPrint('❌ Error uploading evidence images with progress: $e');
      rethrow;
    }
  }

  /// Delete all evidence files for a milestone
  Future<void> deleteEvidenceFiles(
    String projectId,
    String milestoneId,
  ) async {
    try {
      // Delete files (try 0-4, max 5 files)
      for (var i = 0; i < 5; i++) {
        try {
          await _storageService.deleteFile(
            'projects/$projectId/milestones/$milestoneId/files/file_$i.pdf',
          );
        } catch (e) {
          // File might not exist, continue
        }
      }

      // Delete images (try 0-4, max 5 images)
      for (var i = 0; i < 5; i++) {
        try {
          await _storageService.deleteFile(
            'projects/$projectId/milestones/$milestoneId/images/image_$i.jpg',
          );
        } catch (e) {
          // Image might not exist, continue
        }
      }

      debugPrint('✅ All evidence files deleted for milestone: $milestoneId');
    } catch (e) {
      debugPrint('❌ Error deleting evidence files: $e');
      // Don't rethrow - it's okay if deletion fails
    }
  }
}
