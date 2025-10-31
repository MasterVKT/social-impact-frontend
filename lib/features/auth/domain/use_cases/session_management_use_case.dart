import '../entities/auth_state.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

/// Use case for session management operations
/// Handles user sessions, sign out, and session security
class SessionManagementUseCase {
  final AuthRepository _authRepository;
  
  const SessionManagementUseCase(this._authRepository);
  
  /// Sign out current user
  Future<AuthResult> signOut() async {
    try {
      await _authRepository.signOut();
      return const AuthResult.success(
        // Create empty user for successful sign out result
        User(
          uid: '',
          email: '',
          displayName: 'Signed out',
        ),
      );
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Failed to sign out: ${e.toString()}',
          type: AuthFailureType.unknown,
        ),
      );
    }
  }
  
  /// Get current session information
  Future<AuthSession?> getCurrentSession() async {
    try {
      return await _authRepository.getCurrentSession();
    } catch (e) {
      return null;
    }
  }
  
  /// Refresh authentication token
  Future<AuthResult> refreshToken() async {
    if (!_authRepository.isAuthenticated) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'No active session to refresh',
          type: AuthFailureType.permissionDenied,
        ),
      );
    }
    
    try {
      return await _authRepository.refreshToken();
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Failed to refresh token: ${e.toString()}',
          type: AuthFailureType.unknown,
        ),
      );
    }
  }
  
  /// Check if current session is valid
  Future<bool> isSessionValid() async {
    if (!_authRepository.isAuthenticated) {
      return false;
    }
    
    try {
      final session = await getCurrentSession();
      if (session == null) return false;
      
      // Check if session is expired
      final now = DateTime.now();
      if (now.isAfter(session.expiresAt)) {
        return false;
      }
      
      // Check if session is active
      return session.isActive;
    } catch (e) {
      return false;
    }
  }
  
  /// Get session status with details
  Future<Map<String, dynamic>> getSessionStatus() async {
    final user = _authRepository.currentUser;
    final isAuthenticated = _authRepository.isAuthenticated;
    
    if (!isAuthenticated || user == null) {
      return {
        'isAuthenticated': false,
        'isValid': false,
        'user': null,
        'session': null,
        'message': 'No active session',
      };
    }
    
    final session = await getCurrentSession();
    final isValid = await isSessionValid();
    
    return {
      'isAuthenticated': isAuthenticated,
      'isValid': isValid,
      'user': {
        'uid': user.uid,
        'email': user.email,
        'displayName': user.displayName,
        'isEmailVerified': user.isEmailVerified,
        'role': user.role.name,
        'status': user.status.name,
        'kycStatus': user.kycStatus.name,
      },
      'session': session != null ? {
        'sessionId': session.sessionId,
        'createdAt': session.createdAt.toIso8601String(),
        'expiresAt': session.expiresAt.toIso8601String(),
        'isActive': session.isActive,
        'deviceInfo': {
          'deviceId': session.deviceId,
          'deviceName': session.deviceName,
          'ipAddress': session.ipAddress,
        },
      } : null,
      'message': isValid 
          ? 'Session is active and valid'
          : isAuthenticated 
              ? 'Session expired or invalid'
              : 'No active session',
    };
  }
  
  /// Validate session security
  Future<Map<String, dynamic>> validateSessionSecurity() async {
    if (!_authRepository.isAuthenticated) {
      return {
        'isSecure': false,
        'issues': ['No active session'],
        'recommendations': ['Please sign in to continue'],
      };
    }
    
    final issues = <String>[];
    final recommendations = <String>[];
    
    try {
      final user = _authRepository.currentUser!;
      final session = await getCurrentSession();
      
      // Check email verification
      if (!user.isEmailVerified) {
        issues.add('Email not verified');
        recommendations.add('Verify your email address for enhanced security');
      }
      
      // Check session validity
      final isValid = await isSessionValid();
      if (!isValid) {
        issues.add('Session expired or invalid');
        recommendations.add('Please sign in again');
      }
      
      // Check account status
      if (user.status != UserStatus.active) {
        issues.add('Account status: ${user.status.name}');
        recommendations.add('Contact support if you believe this is an error');
      }
      
      // Check session age
      if (session != null) {
        final sessionAge = DateTime.now().difference(session.createdAt);
        if (sessionAge.inDays > 30) {
          issues.add('Session is older than 30 days');
          recommendations.add('Consider signing out and signing back in for security');
        }
      }
      
      // Check KYC status for sensitive operations
      if (user.role == UserRole.investor && user.kycStatus != KYCStatus.verified) {
        issues.add('KYC verification incomplete');
        recommendations.add('Complete KYC verification to access all features');
      }
      
      final isSecure = issues.isEmpty;
      
      return {
        'isSecure': isSecure,
        'issues': issues,
        'recommendations': recommendations,
        'securityLevel': _calculateSecurityLevel(user, session, issues.length),
      };
    } catch (e) {
      return {
        'isSecure': false,
        'issues': ['Failed to validate session security'],
        'recommendations': ['Please try signing out and signing back in'],
      };
    }
  }
  
  /// Calculate security level based on user and session data
  String _calculateSecurityLevel(User user, AuthSession? session, int issueCount) {
    if (issueCount >= 3) return 'Low';
    if (issueCount >= 2) return 'Medium';
    
    int securityScore = 0;
    
    // Email verification
    if (user.isEmailVerified) securityScore += 2;
    
    // Account status
    if (user.status == UserStatus.active) securityScore += 2;
    
    // KYC verification
    if (user.kycStatus == KYCStatus.verified) securityScore += 2;
    
    // Multiple auth providers
    if (user.linkedProviders.length > 1) securityScore += 1;
    
    // Session validity
    if (session != null && session.isActive) securityScore += 1;
    
    if (securityScore >= 7) return 'High';
    if (securityScore >= 4) return 'Medium';
    return 'Low';
  }
  
  /// Force sign out with cleanup
  Future<void> forceSignOut() async {
    try {
      await _authRepository.signOut();
      // Additional cleanup could be performed here
      // such as clearing local storage, cache, etc.
    } catch (e) {
      // Even if sign out fails, we should clear local state
      // This is a safety measure for security
    }
  }
}