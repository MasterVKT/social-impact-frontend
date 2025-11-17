// lib/features/user_profile/data/datasources/user_storage_data_source.dart

import 'dart:typed_data';

class UserStorageDataSource {
  UserStorageDataSource(this._storage);

  // Utilisation dynamique pour éviter la dépendance directe si firebase_storage n'est pas activé
  final Object _storage;

  Future<String> uploadProfileImage({
    required String uid,
    required Uint8List bytes,
    String contentType = 'image/jpeg',
  }) async {
    final storage = _storage as dynamic;
    final ref = storage.ref().child('users').child(uid).child('profile.jpg');
    final metadata = (storage is dynamic) ? (_SettableMetadataProxy(contentType: contentType, cacheControl: 'public, max-age=3600')) : null;
    await ref.putData(bytes, metadata);
    return await ref.getDownloadURL();
  }

  Future<void> deleteProfileImage({required String uid}) async {
    final storage = _storage as dynamic;
    final ref = storage.ref().child('users').child(uid).child('profile.jpg');
    await ref.delete();
  }
}

// Petit proxy pour éviter l'import firebase_storage tout en passant des métadonnées compatibles
class _SettableMetadataProxy {
  final String? contentType;
  final String? cacheControl;
  const _SettableMetadataProxy({this.contentType, this.cacheControl});
}
