import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as path;

/// Firebase Storage service for file uploads and downloads
/// Handles images, documents, and videos with compression and progress tracking
class FirebaseStorageService {
  static final FirebaseStorageService _instance = FirebaseStorageService._internal();
  factory FirebaseStorageService() => _instance;
  FirebaseStorageService._internal();

  static FirebaseStorageService get instance => _instance;

  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// Upload a file to Firebase Storage
  /// Returns the download URL of the uploaded file
  Future<String> uploadFile(File file, String storagePath) async {
    try {
      final ref = _storage.ref().child(storagePath);
      await ref.putFile(file);
      final downloadUrl = await ref.getDownloadURL();

      debugPrint('✅ File uploaded: $storagePath');
      return downloadUrl;
    } catch (e) {
      debugPrint('❌ Upload error: $e');
      rethrow;
    }
  }

  /// Upload file with progress callback
  Future<String> uploadFileWithProgress(
    File file,
    String storagePath,
    Function(double progress) onProgress,
  ) async {
    try {
      final ref = _storage.ref().child(storagePath);
      final uploadTask = ref.putFile(file);

      // Listen to upload progress
      uploadTask.snapshotEvents.listen((snapshot) {
        final progress = snapshot.bytesTransferred / snapshot.totalBytes;
        onProgress(progress);
        debugPrint('Upload progress: ${(progress * 100).toStringAsFixed(0)}%');
      });

      // Wait for completion
      await uploadTask;
      final downloadUrl = await ref.getDownloadURL();

      debugPrint('✅ File uploaded with progress: $storagePath');
      return downloadUrl;
    } catch (e) {
      debugPrint('❌ Upload with progress error: $e');
      rethrow;
    }
  }

  /// Get download URL for a file
  Future<String> getDownloadUrl(String storagePath) async {
    try {
      final ref = _storage.ref().child(storagePath);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      debugPrint('❌ Error getting download URL: $e');
      rethrow;
    }
  }

  /// Delete a file from storage
  Future<void> deleteFile(String storagePath) async {
    try {
      final ref = _storage.ref().child(storagePath);
      await ref.delete();
      debugPrint('✅ File deleted: $storagePath');
    } catch (e) {
      debugPrint('❌ Delete error: $e');
      rethrow;
    }
  }

  /// Upload multiple files
  Future<List<String>> uploadMultipleFiles(
    List<File> files,
    String basePath,
  ) async {
    final urls = <String>[];

    for (var i = 0; i < files.length; i++) {
      final file = files[i];
      final extension = path.extension(file.path);
      final storagePath = '$basePath/${i}_${DateTime.now().millisecondsSinceEpoch}$extension';

      final url = await uploadFile(file, storagePath);
      urls.add(url);
    }

    debugPrint('✅ Multiple files uploaded: ${urls.length}');
    return urls;
  }

  /// Compress an image before upload
  /// Target max dimension: 1920px
  /// Target quality: 85%
  Future<File> compressImage(File imageFile) async {
    try {
      // Read image
      final bytes = await imageFile.readAsBytes();
      img.Image? image = img.decodeImage(bytes);

      if (image == null) {
        throw Exception('Failed to decode image');
      }

      // Resize if too large
      const maxDimension = 1920;
      if (image.width > maxDimension || image.height > maxDimension) {
        if (image.width > image.height) {
          image = img.copyResize(image, width: maxDimension);
        } else {
          image = img.copyResize(image, height: maxDimension);
        }
      }

      // Compress to JPEG with 85% quality
      final compressedBytes = img.encodeJpg(image, quality: 85);

      // Write compressed file
      final compressedFile = File('${imageFile.path}_compressed.jpg');
      await compressedFile.writeAsBytes(compressedBytes);

      final originalSize = bytes.length / 1024; // KB
      final compressedSize = compressedBytes.length / 1024; // KB
      final reduction = ((1 - (compressedSize / originalSize)) * 100).toStringAsFixed(0);

      debugPrint('✅ Image compressed: ${originalSize.toStringAsFixed(0)}KB → ${compressedSize.toStringAsFixed(0)}KB ($reduction% reduction)');

      return compressedFile;
    } catch (e) {
      debugPrint('❌ Compression error: $e');
      // Return original file if compression fails
      return imageFile;
    }
  }

  /// List files in a directory
  Future<List<String>> listFiles(String directoryPath) async {
    try {
      final ref = _storage.ref().child(directoryPath);
      final result = await ref.listAll();

      final urls = <String>[];
      for (final item in result.items) {
        final url = await item.getDownloadURL();
        urls.add(url);
      }

      debugPrint('✅ Listed ${urls.length} files in: $directoryPath');
      return urls;
    } catch (e) {
      debugPrint('❌ List files error: $e');
      return [];
    }
  }

  /// Get file metadata
  Future<FullMetadata?> getFileMetadata(String storagePath) async {
    try {
      final ref = _storage.ref().child(storagePath);
      final metadata = await ref.getMetadata();
      return metadata;
    } catch (e) {
      debugPrint('❌ Get metadata error: $e');
      return null;
    }
  }

  /// Update file metadata
  Future<void> updateFileMetadata(
    String storagePath,
    Map<String, String> customMetadata,
  ) async {
    try {
      final ref = _storage.ref().child(storagePath);
      await ref.updateMetadata(
        SettableMetadata(customMetadata: customMetadata),
      );
      debugPrint('✅ Metadata updated: $storagePath');
    } catch (e) {
      debugPrint('❌ Update metadata error: $e');
      rethrow;
    }
  }
}
