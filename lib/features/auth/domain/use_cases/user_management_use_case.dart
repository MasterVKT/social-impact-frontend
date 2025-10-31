import '../entities/auth_state.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

/// Use case for user profile and account management operations
/// Handles user data updates, KYC verification, and account administration
class UserManagementUseCase {
  final AuthRepository _authRepository;
  
  const UserManagementUseCase(this._authRepository);
  
  /// Update user profile information
  Future<AuthResult> updateProfile({
    String? displayName,
    String? photoURL,
    UserProfile? profile,
  }) async {
    // Check if user is authenticated
    if (!_authRepository.isAuthenticated) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'You must be signed in to update your profile',
          type: AuthFailureType.permissionDenied,
        ),
      );
    }
    
    // Validate profile data if provided
    if (profile != null) {
      final validation = _validateProfile(profile);
      if (validation != null) {
        return AuthResult.failure(validation);
      }
    }
    
    // Validate display name if provided
    if (displayName != null && displayName.trim().isEmpty) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'Display name cannot be empty',
          type: AuthFailureType.invalidCredentials,
        ),
      );
    }
    
    try {
      return await _authRepository.updateProfile(
        displayName: displayName?.trim(),
        photoURL: photoURL,
        profile: profile,
      );
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Failed to update profile: ${e.toString()}',
          type: AuthFailureType.unknown,
        ),
      );
    }
  }
  
  /// Update user preferences
  Future<AuthResult> updatePreferences({
    required UserPreferences preferences,
  }) async {
    // Check if user is authenticated
    if (!_authRepository.isAuthenticated) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'You must be signed in to update preferences',
          type: AuthFailureType.permissionDenied,
        ),
      );
    }
    
    try {
      return await _authRepository.updatePreferences(
        preferences: preferences,
      );
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Failed to update preferences: ${e.toString()}',
          type: AuthFailureType.unknown,
        ),
      );
    }
  }
  
  /// Start KYC verification process
  Future<AuthResult> startKYCVerification({
    required Map<String, dynamic> documents,
  }) async {
    // Check if user is authenticated
    if (!_authRepository.isAuthenticated) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'You must be signed in to start KYC verification',
          type: AuthFailureType.permissionDenied,
        ),
      );
    }
    
    // Validate KYC documents
    final validation = _validateKYCDocuments(documents);
    if (validation != null) {
      return AuthResult.failure(validation);
    }
    
    try {
      return await _authRepository.startKYCVerification(
        documents: documents,
      );
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Failed to start KYC verification: ${e.toString()}',
          type: AuthFailureType.unknown,
        ),
      );
    }
  }
  
  /// Get current KYC status
  Future<KYCStatus> getKYCStatus() async {
    try {
      return await _authRepository.getKYCStatus();
    } catch (e) {
      return KYCStatus.pending; // Default fallback
    }
  }
  
  /// Check if user can perform investor actions
  bool canUserInvest() {
    final user = _authRepository.currentUser;
    return user?.canInvest ?? false;
  }
  
  /// Link authentication provider to account
  Future<AuthResult> linkAuthProvider({
    required AuthProvider provider,
    required Map<String, dynamic> credentials,
  }) async {
    // Check if user is authenticated
    if (!_authRepository.isAuthenticated) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'You must be signed in to link an authentication provider',
          type: AuthFailureType.permissionDenied,
        ),
      );
    }
    
    try {
      return await _authRepository.linkProvider(
        provider: provider,
        credentials: credentials,
      );
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Failed to link provider: ${e.toString()}',
          type: AuthFailureType.providerError,
        ),
      );
    }
  }
  
  /// Unlink authentication provider from account
  Future<AuthResult> unlinkAuthProvider({
    required AuthProvider provider,
  }) async {
    // Check if user is authenticated
    if (!_authRepository.isAuthenticated) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'You must be signed in to unlink an authentication provider',
          type: AuthFailureType.permissionDenied,
        ),
      );
    }
    
    try {
      // Get linked providers first
      final linkedProviders = await _authRepository.getLinkedProviders();
      
      // Ensure user has at least one remaining auth method
      if (linkedProviders.length <= 1) {
        return const AuthResult.failure(
          AuthFailure(
            message: 'You must have at least one authentication method linked to your account',
            type: AuthFailureType.permissionDenied,
          ),
        );
      }
      
      return await _authRepository.unlinkProvider(provider: provider);
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Failed to unlink provider: ${e.toString()}',
          type: AuthFailureType.providerError,
        ),
      );
    }
  }
  
  /// Delete user account
  Future<AuthResult> deleteAccount() async {
    // Check if user is authenticated
    if (!_authRepository.isAuthenticated) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'You must be signed in to delete your account',
          type: AuthFailureType.permissionDenied,
        ),
      );
    }
    
    try {
      return await _authRepository.deleteAccount();
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Failed to delete account: ${e.toString()}',
          type: AuthFailureType.unknown,
        ),
      );
    }
  }
  
  /// Get user profile completion percentage
  double getProfileCompletionPercentage() {
    final user = _authRepository.currentUser;
    return user?.profileCompletionPercentage ?? 0.0;
  }
  
  /// Validate user profile data
  AuthFailure? _validateProfile(UserProfile profile) {
    // Validate names
    if (profile.firstName?.isNotEmpty == true && profile.firstName!.length < 2) {
      return const AuthFailure(
        message: 'First name must be at least 2 characters',
        type: AuthFailureType.invalidCredentials,
      );
    }
    
    if (profile.lastName?.isNotEmpty == true && profile.lastName!.length < 2) {
      return const AuthFailure(
        message: 'Last name must be at least 2 characters',
        type: AuthFailureType.invalidCredentials,
      );
    }
    
    // Validate bio length
    if (profile.bio?.isNotEmpty == true && profile.bio!.length > 500) {
      return const AuthFailure(
        message: 'Bio must be less than 500 characters',
        type: AuthFailureType.invalidCredentials,
      );
    }
    
    // Validate website URL
    if (profile.website?.isNotEmpty == true && !_isValidUrl(profile.website!)) {
      return const AuthFailure(
        message: 'Please enter a valid website URL',
        type: AuthFailureType.invalidCredentials,
      );
    }
    
    // Validate date of birth
    if (profile.dateOfBirth != null) {
      final now = DateTime.now();
      final age = now.difference(profile.dateOfBirth!).inDays / 365.25;
      
      if (age < 13) {
        return const AuthFailure(
          message: 'You must be at least 13 years old to use this platform',
          type: AuthFailureType.permissionDenied,
        );
      }
      
      if (age > 150) {
        return const AuthFailure(
          message: 'Please enter a valid date of birth',
          type: AuthFailureType.invalidCredentials,
        );
      }
    }
    
    return null;
  }
  
  /// Validate KYC documents
  AuthFailure? _validateKYCDocuments(Map<String, dynamic> documents) {
    if (documents.isEmpty) {
      return const AuthFailure(
        message: 'KYC documents are required',
        type: AuthFailureType.kycRequired,
      );
    }
    
    // Check for required document types
    final requiredDocTypes = ['identity', 'address'];
    for (final docType in requiredDocTypes) {
      if (!documents.containsKey(docType)) {
        return AuthFailure(
          message: 'Missing required document: $docType',
          type: AuthFailureType.kycRequired,
        );
      }
    }
    
    return null;
  }
  
  /// Validate URL format
  bool _isValidUrl(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.hasScheme && (uri.scheme == 'http' || uri.scheme == 'https');
    } catch (e) {
      return false;
    }
  }
}