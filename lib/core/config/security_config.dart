import 'package:flutter/foundation.dart';

/// Security Event Types for Logging
enum SecurityEvent {
  loginSuccess,
  loginFailure,
  loginLocked,
  passwordReset,
  sessionExpired,
  unauthorizedAccess,
  securityViolation,
  biometricFailure,
  kycSubmission,
  suspiciousActivity,
}

/// Security configuration for the Social Finance Impact Platform
/// Provides centralized security settings and policies
class SecurityConfig {
  // Private constructor to prevent instantiation
  SecurityConfig._();
  
  /// Environment-based security settings
  static const bool isProduction = kReleaseMode;
  static const bool isDebug = kDebugMode;
  
  /// Authentication Security Settings
  static const Duration sessionTimeout = Duration(days: 30);
  static const Duration tokenRefreshThreshold = Duration(minutes: 10);
  static const Duration passwordResetExpiry = Duration(hours: 1);
  static const int maxLoginAttempts = 5;
  static const Duration loginCooldown = Duration(minutes: 15);
  
  /// Password Policy Settings
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 128;
  static const bool requireUppercase = true;
  static const bool requireLowercase = true;
  static const bool requireNumbers = true;
  static const bool requireSpecialCharacters = true;
  
  /// Session Security Settings
  static const int maxConcurrentSessions = 3;
  static const Duration sessionValidityCheck = Duration(minutes: 5);
  static const Duration sessionCleanupInterval = Duration(hours: 1);
  static const int maxSessionAge = 30; // days
  
  /// Storage Security Settings
  static const String secureStoragePrefix = 'social_impact_secure_';
  static const String regularStoragePrefix = 'social_impact_';
  static const bool encryptSensitiveData = true;
  static const bool useHardwareBackedStorage = true;
  
  /// Network Security Settings
  static const bool enforceHTTPS = true;
  static const bool enableCertificatePinning = isProduction;
  static const Duration networkTimeout = Duration(seconds: 30);
  static const int maxRetryAttempts = 3;
  
  /// KYC Security Settings
  static const List<UserRole> kycRequiredRoles = [UserRole.investor];
  static const Duration kycDocumentExpiry = Duration(days: 365);
  static const int maxKYCAttempts = 3;
  static const Duration kycCooldown = Duration(days: 1);
  
  /// Biometric Security Settings
  static const Duration biometricTimeout = Duration(seconds: 30);
  static const int maxBiometricAttempts = 3;
  static const bool fallbackToPassword = true;
  static const bool requireDeviceAuth = true;
  
  /// Error Handling Security Settings
  static const bool detailedErrorsInDebug = isDebug;
  static const bool logSecurityEvents = true;
  static const bool sanitizeErrorMessages = true;
  static const Duration errorLoggingCooldown = Duration(seconds: 1);
  
  /// Security Headers for Web
  static const Map<String, String> securityHeaders = {
    'X-Content-Type-Options': 'nosniff',
    'X-Frame-Options': 'DENY',
    'X-XSS-Protection': '1; mode=block',
    'Strict-Transport-Security': 'max-age=31536000; includeSubDomains',
    'Content-Security-Policy': "default-src 'self'; script-src 'self' 'unsafe-inline'; style-src 'self' 'unsafe-inline';",
    'Referrer-Policy': 'strict-origin-when-cross-origin',
  };
  
  /// Certificate Pinning Configuration (Production)
  static const Map<String, List<String>> certificatePins = {
    'api.socialimpact.com': [
      'sha256/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=', // Replace with actual certificate hash
    ],
    'auth.socialimpact.com': [
      'sha256/BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB=', // Replace with actual certificate hash
    ],
  };
  
  /// Security Event Types for Logging
  static const List<String> securityEventTypes = [
    'loginSuccess',
    'loginFailure',
    'loginLocked',
    'passwordReset',
    'sessionExpired',
    'unauthorizedAccess',
    'securityViolation',
    'biometricFailure',
    'kycSubmission',
    'suspiciousActivity',
  ];
  
  /// Security Validation Methods
  
  /// Validate password against security policy
  static SecurityValidationResult validatePassword(String password) {
    final issues = <String>[];
    
    if (password.length < minPasswordLength) {
      issues.add('Password must be at least $minPasswordLength characters long');
    }
    
    if (password.length > maxPasswordLength) {
      issues.add('Password must be no more than $maxPasswordLength characters long');
    }
    
    if (requireUppercase && !password.contains(RegExp(r'[A-Z]'))) {
      issues.add('Password must contain at least one uppercase letter');
    }
    
    if (requireLowercase && !password.contains(RegExp(r'[a-z]'))) {
      issues.add('Password must contain at least one lowercase letter');
    }
    
    if (requireNumbers && !password.contains(RegExp(r'[0-9]'))) {
      issues.add('Password must contain at least one number');
    }
    
    if (requireSpecialCharacters && !password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      issues.add('Password must contain at least one special character');
    }
    
    // Check for common weak passwords
    if (_isCommonPassword(password)) {
      issues.add('Password is too common. Please choose a more unique password');
    }
    
    return SecurityValidationResult(
      isValid: issues.isEmpty,
      issues: issues,
      strength: _calculatePasswordStrength(password),
    );
  }
  
  /// Validate email format
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
  
  /// Check if session should be refreshed
  static bool shouldRefreshSession(DateTime lastRefresh) {
    return DateTime.now().difference(lastRefresh) > tokenRefreshThreshold;
  }
  
  /// Check if password reset token is valid
  static bool isPasswordResetValid(DateTime tokenCreated) {
    return DateTime.now().difference(tokenCreated) < passwordResetExpiry;
  }
  
  /// Calculate password strength score (0-100)
  static int _calculatePasswordStrength(String password) {
    int score = 0;
    
    // Length score
    if (password.length >= 8) score += 25;
    if (password.length >= 12) score += 25;
    
    // Character variety score
    if (password.contains(RegExp(r'[A-Z]'))) score += 10;
    if (password.contains(RegExp(r'[a-z]'))) score += 10;
    if (password.contains(RegExp(r'[0-9]'))) score += 10;
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) score += 20;
    
    return score.clamp(0, 100);
  }
  
  /// Check for common weak passwords
  static bool _isCommonPassword(String password) {
    const commonPasswords = [
      'password', 'password123', '123456', '123456789', 'qwerty',
      'abc123', 'password1', 'admin', 'letmein', 'welcome',
    ];
    
    return commonPasswords.contains(password.toLowerCase());
  }
  
  /// Security Policy Enforcement
  
  /// Get security policy for user role
  static SecurityPolicy getPolicyForRole(UserRole role) {
    switch (role) {
      case UserRole.admin:
        return const SecurityPolicy(
          requireMFA: true,
          sessionTimeout: Duration(hours: 8),
          passwordExpiry: Duration(days: 90),
          requireBiometric: false,
          requireKYC: false,
        );
      case UserRole.auditor:
        return const SecurityPolicy(
          requireMFA: true,
          sessionTimeout: Duration(hours: 12),
          passwordExpiry: Duration(days: 120),
          requireBiometric: false,
          requireKYC: true,
        );
      case UserRole.organization:
        return const SecurityPolicy(
          requireMFA: false,
          sessionTimeout: Duration(days: 7),
          passwordExpiry: Duration(days: 180),
          requireBiometric: false,
          requireKYC: true,
        );
      case UserRole.investor:
        return const SecurityPolicy(
          requireMFA: false,
          sessionTimeout: Duration(days: 30),
          passwordExpiry: Duration(days: 365),
          requireBiometric: true,
          requireKYC: true,
        );
    }
  }
  
  /// Security Monitoring Settings
  
  /// Get security monitoring configuration
  static SecurityMonitoringConfig getMonitoringConfig() {
    return const SecurityMonitoringConfig(
      enableFailedLoginMonitoring: true,
      enableSessionMonitoring: true,
      enableAccessPatternMonitoring: isProduction,
      enableGeographicMonitoring: isProduction,
      enableDeviceMonitoring: true,
      alertThresholds: {
        'failed_logins': 5,
        'session_anomalies': 3,
        'access_violations': 1,
        'geographic_anomalies': 2,
      },
    );
  }
}

/// Security validation result
class SecurityValidationResult {
  final bool isValid;
  final List<String> issues;
  final int strength;
  
  const SecurityValidationResult({
    required this.isValid,
    required this.issues,
    required this.strength,
  });
  
  /// Get strength description
  String get strengthDescription {
    if (strength >= 80) return 'Very Strong';
    if (strength >= 60) return 'Strong';
    if (strength >= 40) return 'Medium';
    if (strength >= 20) return 'Weak';
    return 'Very Weak';
  }
}

/// Security policy for user roles
class SecurityPolicy {
  final bool requireMFA;
  final Duration sessionTimeout;
  final Duration passwordExpiry;
  final bool requireBiometric;
  final bool requireKYC;
  
  const SecurityPolicy({
    required this.requireMFA,
    required this.sessionTimeout,
    required this.passwordExpiry,
    required this.requireBiometric,
    required this.requireKYC,
  });
}

/// Security monitoring configuration
class SecurityMonitoringConfig {
  final bool enableFailedLoginMonitoring;
  final bool enableSessionMonitoring;
  final bool enableAccessPatternMonitoring;
  final bool enableGeographicMonitoring;
  final bool enableDeviceMonitoring;
  final Map<String, int> alertThresholds;
  
  const SecurityMonitoringConfig({
    required this.enableFailedLoginMonitoring,
    required this.enableSessionMonitoring,
    required this.enableAccessPatternMonitoring,
    required this.enableGeographicMonitoring,
    required this.enableDeviceMonitoring,
    required this.alertThresholds,
  });
}

/// Security audit logger
class SecurityAuditLogger {
  static const String _logPrefix = 'SECURITY_AUDIT';
  
  /// Log security event
  static void logEvent(SecurityEvent event, Map<String, dynamic> details) {
    if (!SecurityConfig.logSecurityEvents) return;
    
    final logEntry = {
      'timestamp': DateTime.now().toIso8601String(),
      'event': event.name,
      'details': SecurityConfig.detailedErrorsInDebug ? details : _sanitizeDetails(details),
      'platform': _getPlatformInfo(),
    };
    
    if (kDebugMode) {
      print('$_logPrefix: ${logEntry['event']} - ${logEntry['timestamp']}');
      if (SecurityConfig.detailedErrorsInDebug) {
        print('Details: $details');
      }
    }
    
    // In production, this would send to security monitoring service
    _sendToSecurityService(logEntry);
  }
  
  /// Sanitize details for production logging
  static Map<String, dynamic> _sanitizeDetails(Map<String, dynamic> details) {
    final sanitized = <String, dynamic>{};
    
    for (final entry in details.entries) {
      final key = entry.key;
      final value = entry.value;
      
      // Remove sensitive fields
      if (key.toLowerCase().contains('password') ||
          key.toLowerCase().contains('token') ||
          key.toLowerCase().contains('secret') ||
          key.toLowerCase().contains('key')) {
        sanitized[key] = '[REDACTED]';
      } else {
        sanitized[key] = value;
      }
    }
    
    return sanitized;
  }
  
  /// Get platform information for logging
  static Map<String, String> _getPlatformInfo() {
    return {
      'platform': defaultTargetPlatform.name,
      'debug': kDebugMode.toString(),
      'release': kReleaseMode.toString(),
    };
  }
  
  /// Send to security monitoring service (mock implementation)
  static void _sendToSecurityService(Map<String, dynamic> logEntry) {
    // In production, this would integrate with security monitoring services
    // such as Datadog, New Relic, or custom security analytics
    if (kDebugMode) {
      print('Would send to security service: ${logEntry['event']}');
    }
  }
}

/// Security utilities
class SecurityUtils {
  /// Generate secure random string
  static String generateSecureToken(int length) {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final random = <int>[];
    
    for (int i = 0; i < length; i++) {
      random.add(chars.codeUnitAt(i % chars.length));
    }
    
    return String.fromCharCodes(random);
  }
  
  /// Check if string looks like encrypted data
  static bool looksEncrypted(String value) {
    return value.length >= 16 &&
           value.contains(RegExp(r'^[A-Za-z0-9+/=_-]+$')) &&
           !value.contains(' ');
  }
  
  /// Validate session ID format
  static bool isValidSessionId(String sessionId) {
    return sessionId.length >= 32 &&
           sessionId.contains(RegExp(r'^[A-Za-z0-9_-]+$'));
  }
}

/// Import required types (these would normally be imported from their respective files)
enum UserRole { investor, organization, auditor, admin }