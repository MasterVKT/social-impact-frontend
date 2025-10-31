import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/utils/platform_detector.dart';
import '../../domain/entities/auth_state.dart';
import '../../domain/entities/user.dart' as domain;
import '../services/google_sign_in_service.dart';
import '../services/apple_sign_in_service.dart';
import '../services/biometric_auth_service.dart';

/// Firebase authentication data source with multi-platform support
/// Provides platform-adaptive authentication implementation using Firebase Auth
class FirebaseAuthDataSource {
  final firebase.FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  
  // Platform-specific controllers
  StreamController<AuthState>? _authStateController;
  
  FirebaseAuthDataSource({
    firebase.FirebaseAuth? auth,
    FirebaseFirestore? firestore,
  })  : _auth = auth ?? firebase.FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance {
    _initializeAuthStateStream();
    _initializeGoogleSignIn();
  }
  
  /// Initialize authentication state stream
  void _initializeAuthStateStream() {
    _authStateController = StreamController<AuthState>.broadcast();
    
    // Listen to Firebase Auth state changes
    _auth.authStateChanges().listen((firebase.User? user) async {
      if (user != null) {
        try {
          // Get additional user data from Firestore
          final userData = await _getUserData(user.uid);
          final domainUser = await _mapFirebaseUserToDomainUser(user, userData);
          _authStateController?.add(AuthState.authenticated(domainUser));
        } catch (e) {
          _authStateController?.add(AuthState.error('Failed to load user data: ${e.toString()}'));
        }
      } else {
        _authStateController?.add(const AuthState.unauthenticated());
      }
    });
  }
  
  /// Initialize Google Sign-In service
  void _initializeGoogleSignIn() {
    // Initialize Google Sign-In service asynchronously
    GoogleSignInService.initialize().catchError((e) {
      if (kDebugMode) {
        print('Google Sign-In initialization error: $e');
      }
    });
    
    // Initialize Apple Sign-In service asynchronously
    AppleSignInService.initialize().catchError((e) {
      if (kDebugMode) {
        print('Apple Sign-In initialization error: $e');
      }
    });
    
    // Initialize Biometric Auth service asynchronously
    BiometricAuthService.initialize().catchError((e) {
      if (kDebugMode) {
        print('Biometric Auth initialization error: $e');
      }
    });
  }
  
  /// Stream of authentication state changes
  Stream<AuthState> get authStateChanges {
    return _authStateController?.stream ?? const Stream.empty();
  }
  
  /// Get current authenticated user
  domain.User? get currentUser {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser == null) return null;
    
    // This is a synchronous method, so we return a basic user
    // Full user data should be obtained through authStateChanges stream
    return domain.User(
      uid: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      displayName: firebaseUser.displayName,
      photoURL: firebaseUser.photoURL,
      isEmailVerified: firebaseUser.emailVerified,
      lastSignInAt: firebaseUser.metadata.lastSignInTime,
      createdAt: firebaseUser.metadata.creationTime,
    );
  }
  
  /// Check if user is currently authenticated
  bool get isAuthenticated => _auth.currentUser != null;
  
  // Email/Password Authentication
  
  /// Sign in with email and password
  Future<AuthResult> signInWithEmailAndPassword({
    required String email,
    required String password,
    bool rememberMe = false,
  }) async {
    try {
      // Set persistence based on rememberMe flag
      if (PlatformDetector.isWeb) {
        await _auth.setPersistence(
          rememberMe 
            ? firebase.Persistence.LOCAL 
            : firebase.Persistence.SESSION
        );
      }
      
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      if (credential.user != null) {
        final userData = await _getUserData(credential.user!.uid);
        final domainUser = await _mapFirebaseUserToDomainUser(credential.user!, userData);
        
        // Update last sign in timestamp
        await _updateUserData(credential.user!.uid, {
          'lastSignInAt': FieldValue.serverTimestamp(),
        });
        
        return AuthResult.success(domainUser);
      } else {
        return const AuthResult.failure(
          AuthFailure(
            message: 'Sign in failed - no user returned',
            type: AuthFailureType.unknown,
          ),
        );
      }
    } on firebase.FirebaseAuthException catch (e) {
      return AuthResult.failure(_mapFirebaseErrorToAuthFailure(e));
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Unexpected error during sign in: ${e.toString()}',
          type: AuthFailureType.unknown,
        ),
      );
    }
  }
  
  /// Register with email and password
  Future<AuthResult> registerWithEmailAndPassword({
    required RegistrationData registrationData,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: registrationData.email,
        password: registrationData.password,
      );
      
      if (credential.user != null) {
        final user = credential.user!;
        
        // Update Firebase Auth profile
        await user.updateDisplayName(registrationData.displayName);
        
        // Create user document in Firestore
        await _createUserDocument(user, registrationData);
        
        // Send email verification
        if (!user.emailVerified) {
          await user.sendEmailVerification();
        }
        
        final userData = await _getUserData(user.uid);
        final domainUser = await _mapFirebaseUserToDomainUser(user, userData);
        
        return AuthResult.success(domainUser);
      } else {
        return const AuthResult.failure(
          AuthFailure(
            message: 'Registration failed - no user returned',
            type: AuthFailureType.unknown,
          ),
        );
      }
    } on firebase.FirebaseAuthException catch (e) {
      return AuthResult.failure(_mapFirebaseErrorToAuthFailure(e));
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Unexpected error during registration: ${e.toString()}',
          type: AuthFailureType.unknown,
        ),
      );
    }
  }
  
  // Social Authentication
  
  /// Sign in with Google (adaptive for web and mobile)
  Future<AuthResult> signInWithGoogle() async {
    try {
      firebase.UserCredential? credential;
      
      if (PlatformDetector.isWeb) {
        // Web implementation
        firebase.GoogleAuthProvider googleProvider = firebase.GoogleAuthProvider();
        googleProvider.addScope('email');
        googleProvider.addScope('profile');
        
        credential = await _auth.signInWithPopup(googleProvider);
      } else if (PlatformDetector.isMobile) {
        // Mobile implementation - native flow using service
        try {
          // Trigger the authentication flow
          final GoogleSignInAccount? googleUser = await GoogleSignInService.signIn();
          
          if (googleUser == null) {
            // User cancelled the sign-in process
            return const AuthResult.failure(
              AuthFailure(
                message: 'Google Sign-In was cancelled by the user',
                type: AuthFailureType.cancelledByUser,
              ),
            );
          }
          
          // Obtain the auth details from the request
          final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
          
          // Create Firebase credential using service
          final firebase.OAuthCredential firebaseCredential = 
              GoogleSignInService.createFirebaseCredential(googleAuth);
          
          // Sign in to Firebase with the Google credential
          credential = await _auth.signInWithCredential(firebaseCredential);
        } catch (e) {
          // Use service to map Google Sign-In errors
          return AuthResult.failure(GoogleSignInService.mapGoogleSignInError(e));
        }
      } else {
        return const AuthResult.failure(
          AuthFailure(
            message: 'Google Sign-In not supported on this platform',
            type: AuthFailureType.providerError,
          ),
        );
      }
      
      if (credential.user != null) {
        final user = credential.user!;
        
        // Check if user exists in Firestore, create if not
        final userData = await _getUserData(user.uid);
        if (userData == null) {
          await _createUserDocumentFromSocial(user, domain.AuthProvider.google);
        } else {
          // Update last sign in
          await _updateUserData(user.uid, {
            'lastSignInAt': FieldValue.serverTimestamp(),
          });
        }
        
        final finalUserData = await _getUserData(user.uid);
        final domainUser = await _mapFirebaseUserToDomainUser(user, finalUserData);
        
        return AuthResult.success(domainUser);
      } else {
        return const AuthResult.failure(
          AuthFailure(
            message: 'Google sign in was cancelled',
            type: AuthFailureType.cancelledByUser,
          ),
        );
      }
    } on firebase.FirebaseAuthException catch (e) {
      return AuthResult.failure(_mapFirebaseErrorToAuthFailure(e));
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Google sign in failed: ${e.toString()}',
          type: AuthFailureType.providerError,
        ),
      );
    }
  }
  
  /// Sign in with Apple (iOS only)
  Future<AuthResult> signInWithApple() async {
    if (!AppleSignInService.isSupported) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'Apple Sign-In is only available on iOS devices',
          type: AuthFailureType.providerError,
        ),
      );
    }
    
    try {
      // Check if Apple Sign-In is available on the device
      final isAvailable = await AppleSignInService.isAvailable();
      if (!isAvailable) {
        return const AuthResult.failure(
          AuthFailure(
            message: 'Apple Sign-In is not available on this device. Please use iOS 13.0 or later.',
            type: AuthFailureType.providerError,
          ),
        );
      }
      
      // Perform Apple Sign-In
      final appleCredential = await AppleSignInService.signIn();
      
      if (appleCredential == null) {
        return const AuthResult.failure(
          AuthFailure(
            message: 'Apple Sign-In was cancelled',
            type: AuthFailureType.cancelledByUser,
          ),
        );
      }
      
      // Create Firebase credential
      final firebaseCredential = AppleSignInService.createFirebaseCredential(appleCredential);
      
      // Sign in to Firebase
      final credential = await _auth.signInWithCredential(firebaseCredential);
      
      if (credential.user != null) {
        final user = credential.user!;
        
        // Extract user info from Apple credential
        final appleUserInfo = AppleSignInService.extractUserInfo(appleCredential);
        
        // Check if user exists in Firestore, create if not
        final userData = await _getUserData(user.uid);
        if (userData == null) {
          await _createUserDocumentFromApple(user, appleCredential, appleUserInfo);
        } else {
          // Update last sign in and any missing user info
          await _updateUserDataFromApple(user.uid, appleUserInfo);
        }
        
        final finalUserData = await _getUserData(user.uid);
        final domainUser = await _mapFirebaseUserToDomainUser(user, finalUserData);
        
        return AuthResult.success(domainUser);
      } else {
        return const AuthResult.failure(
          AuthFailure(
            message: 'Apple Sign-In completed but Firebase authentication failed',
            type: AuthFailureType.providerError,
          ),
        );
      }
    } catch (e) {
      // Use Apple Sign-In service to map errors
      return AuthResult.failure(AppleSignInService.mapAppleSignInError(e));
    }
  }
  
  // Password Management
  
  /// Send password reset email
  Future<AuthResult> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      
      return AuthResult.success(
        domain.User(
          uid: '',
          email: email,
          displayName: 'Password reset sent',
        ),
      );
    } on firebase.FirebaseAuthException catch (e) {
      return AuthResult.failure(_mapFirebaseErrorToAuthFailure(e));
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Failed to send password reset email: ${e.toString()}',
          type: AuthFailureType.unknown,
        ),
      );
    }
  }
  
  /// Change user password
  Future<AuthResult> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final user = _auth.currentUser;
    if (user == null) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'No authenticated user found',
          type: AuthFailureType.permissionDenied,
        ),
      );
    }
    
    try {
      // Re-authenticate user with current password
      final credential = firebase.EmailAuthProvider.credential(
        email: user.email!,
        password: currentPassword,
      );
      await user.reauthenticateWithCredential(credential);
      
      // Update password
      await user.updatePassword(newPassword);
      
      final userData = await _getUserData(user.uid);
      final domainUser = await _mapFirebaseUserToDomainUser(user, userData);
      
      return AuthResult.success(domainUser);
    } on firebase.FirebaseAuthException catch (e) {
      return AuthResult.failure(_mapFirebaseErrorToAuthFailure(e));
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Failed to change password: ${e.toString()}',
          type: AuthFailureType.unknown,
        ),
      );
    }
  }
  
  // Email Verification
  
  /// Send email verification
  Future<AuthResult> sendEmailVerification() async {
    final user = _auth.currentUser;
    if (user == null) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'No authenticated user found',
          type: AuthFailureType.permissionDenied,
        ),
      );
    }
    
    try {
      await user.sendEmailVerification();
      
      final userData = await _getUserData(user.uid);
      final domainUser = await _mapFirebaseUserToDomainUser(user, userData);
      
      return AuthResult.success(domainUser);
    } on firebase.FirebaseAuthException catch (e) {
      return AuthResult.failure(_mapFirebaseErrorToAuthFailure(e));
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Failed to send email verification: ${e.toString()}',
          type: AuthFailureType.unknown,
        ),
      );
    }
  }
  
  /// Check if current user's email is verified
  Future<bool> isEmailVerified() async {
    final user = _auth.currentUser;
    if (user == null) return false;
    
    // Reload user to get latest email verification status
    await user.reload();
    return user.emailVerified;
  }
  
  // Session Management
  
  /// Sign out current user
  Future<void> signOut() async {
    try {
      // Sign out from Firebase
      await _auth.signOut();
      
      // Also sign out from Google if user was signed in with Google
      if (await GoogleSignInService.isSignedIn()) {
        await GoogleSignInService.signOut();
      }
    } catch (e) {
      // Log error but don't throw - sign out should always succeed locally
      if (kDebugMode) {
        print('Error during sign out: $e');
      }
    }
  }
  
  /// Delete user account
  Future<AuthResult> deleteAccount() async {
    final user = _auth.currentUser;
    if (user == null) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'No authenticated user found',
          type: AuthFailureType.permissionDenied,
        ),
      );
    }
    
    try {
      // Delete user document from Firestore
      await _firestore.collection('users').doc(user.uid).delete();
      
      // Delete Firebase Auth user
      await user.delete();
      
      return AuthResult.success(
        domain.User(
          uid: user.uid,
          email: user.email ?? '',
          displayName: 'Account deleted',
        ),
      );
    } on firebase.FirebaseAuthException catch (e) {
      return AuthResult.failure(_mapFirebaseErrorToAuthFailure(e));
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Failed to delete account: ${e.toString()}',
          type: AuthFailureType.unknown,
        ),
      );
    }
  }
  
  // User Profile Management
  
  /// Update user profile
  Future<AuthResult> updateProfile({
    String? displayName,
    String? photoURL,
    domain.UserProfile? profile,
  }) async {
    final user = _auth.currentUser;
    if (user == null) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'No authenticated user found',
          type: AuthFailureType.permissionDenied,
        ),
      );
    }
    
    try {
      // Update Firebase Auth profile
      if (displayName != null) {
        await user.updateDisplayName(displayName);
      }
      if (photoURL != null) {
        await user.updatePhotoURL(photoURL);
      }
      
      // Update Firestore user document
      final updateData = <String, dynamic>{};
      if (displayName != null) updateData['displayName'] = displayName;
      if (photoURL != null) updateData['photoURL'] = photoURL;
      if (profile != null) updateData['profile'] = profile.toJson();
      updateData['updatedAt'] = FieldValue.serverTimestamp();
      
      await _updateUserData(user.uid, updateData);
      
      // Reload user and return updated domain user
      await user.reload();
      final userData = await _getUserData(user.uid);
      final domainUser = await _mapFirebaseUserToDomainUser(_auth.currentUser!, userData);
      
      return AuthResult.success(domainUser);
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Failed to update profile: ${e.toString()}',
          type: AuthFailureType.unknown,
        ),
      );
    }
  }
  
  // Helper Methods
  
  /// Get user data from Firestore
  Future<Map<String, dynamic>?> _getUserData(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      return doc.exists ? doc.data() : null;
    } catch (e) {
      if (kDebugMode) {
        print('Error getting user data: $e');
      }
      return null;
    }
  }
  
  /// Update user data in Firestore
  Future<void> _updateUserData(String uid, Map<String, dynamic> data) async {
    try {
      await _firestore.collection('users').doc(uid).update(data);
    } catch (e) {
      if (kDebugMode) {
        print('Error updating user data: $e');
      }
      // Don't throw - this is a best effort update
    }
  }
  
  /// Create user document in Firestore for new registration
  Future<void> _createUserDocument(firebase.User user, RegistrationData data) async {
    try {
      final userData = {
        'uid': user.uid,
        'email': user.email,
        'displayName': data.displayName,
        'role': data.role.name,
        'status': 'active',
        'kycStatus': 'pending',
        'isEmailVerified': user.emailVerified,
        'linkedProviders': ['email'],
        'profile': {
          'firstName': data.firstName,
          'lastName': data.lastName,
        },
        'preferences': {
          'emailNotifications': true,
          'pushNotifications': true,
          'marketingEmails': data.acceptMarketing,
          'language': 'en',
          'currency': 'USD',
          'themeMode': 'system',
          'biometricEnabled': false,
          'rememberMe': true,
        },
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      };
      
      await _firestore.collection('users').doc(user.uid).set(userData);
    } catch (e) {
      if (kDebugMode) {
        print('Error creating user document: $e');
      }
      // Don't throw - Firebase Auth user was created successfully
    }
  }
  
  /// Create user document for social authentication
  Future<void> _createUserDocumentFromSocial(firebase.User user, domain.AuthProvider provider) async {
    try {
      final userData = {
        'uid': user.uid,
        'email': user.email,
        'displayName': user.displayName,
        'photoURL': user.photoURL,
        'role': 'investor',
        'status': 'active',
        'kycStatus': 'pending',
        'isEmailVerified': user.emailVerified,
        'linkedProviders': [provider.name],
        'profile': {},
        'preferences': {
          'emailNotifications': true,
          'pushNotifications': true,
          'marketingEmails': false,
          'language': 'en',
          'currency': 'USD',
          'themeMode': 'system',
          'biometricEnabled': false,
          'rememberMe': true,
        },
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      };
      
      await _firestore.collection('users').doc(user.uid).set(userData);
    } catch (e) {
      if (kDebugMode) {
        print('Error creating social user document: $e');
      }
    }
  }
  
  /// Create user document for Apple Sign-In authentication
  Future<void> _createUserDocumentFromApple(
    firebase.User user,
    dynamic appleCredential,
    Map<String, String?> appleUserInfo,
  ) async {
    try {
      final userData = {
        'uid': user.uid,
        'email': user.email ?? appleUserInfo['email'],
        'displayName': user.displayName ?? appleUserInfo['displayName'],
        'photoURL': user.photoURL,
        'role': 'investor',
        'status': 'active',
        'kycStatus': 'pending',
        'isEmailVerified': user.emailVerified,
        'linkedProviders': [domain.AuthProvider.apple.name],
        'profile': {
          'firstName': appleUserInfo['firstName'],
          'lastName': appleUserInfo['lastName'],
        },
        'preferences': {
          'emailNotifications': true,
          'pushNotifications': true,
          'marketingEmails': false,
          'language': 'en',
          'currency': 'USD',
          'themeMode': 'system',
          'biometricEnabled': false,
          'rememberMe': true,
        },
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      };
      
      await _firestore.collection('users').doc(user.uid).set(userData);
    } catch (e) {
      if (kDebugMode) {
        print('Error creating Apple user document: $e');
      }
    }
  }
  
  /// Update user data with Apple Sign-In information
  Future<void> _updateUserDataFromApple(
    String uid,
    Map<String, String?> appleUserInfo,
  ) async {
    try {
      final updateData = <String, dynamic>{
        'lastSignInAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      };
      
      // Only update user info if it's not already present and Apple provided it
      final existingData = await _getUserData(uid);
      if (existingData != null) {
        // Update display name if missing and Apple provided it
        if (existingData['displayName'] == null && appleUserInfo['displayName'] != null) {
          updateData['displayName'] = appleUserInfo['displayName'];
        }
        
        // Update profile information if missing
        final existingProfile = existingData['profile'] as Map<String, dynamic>?;
        if (existingProfile?['firstName'] == null && appleUserInfo['firstName'] != null) {
          updateData['profile.firstName'] = appleUserInfo['firstName'];
        }
        if (existingProfile?['lastName'] == null && appleUserInfo['lastName'] != null) {
          updateData['profile.lastName'] = appleUserInfo['lastName'];
        }
        
        // Ensure Apple is in linked providers
        final linkedProviders = (existingData['linkedProviders'] as List?)?.cast<String>() ?? [];
        if (!linkedProviders.contains(domain.AuthProvider.apple.name)) {
          linkedProviders.add(domain.AuthProvider.apple.name);
          updateData['linkedProviders'] = linkedProviders;
        }
      }
      
      await _updateUserData(uid, updateData);
    } catch (e) {
      if (kDebugMode) {
        print('Error updating Apple user data: $e');
      }
    }
  }
  
  /// Map Firebase user to domain user
  Future<domain.User> _mapFirebaseUserToDomainUser(
    firebase.User firebaseUser,
    Map<String, dynamic>? userData,
  ) async {
    return domain.User(
      uid: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      displayName: firebaseUser.displayName,
      photoURL: firebaseUser.photoURL,
      isEmailVerified: firebaseUser.emailVerified,
      role: domain.UserRole.values.firstWhere(
        (role) => role.name == (userData?['role'] ?? 'investor'),
        orElse: () => domain.UserRole.investor,
      ),
      status: domain.UserStatus.values.firstWhere(
        (status) => status.name == (userData?['status'] ?? 'active'),
        orElse: () => domain.UserStatus.active,
      ),
      kycStatus: domain.KYCStatus.values.firstWhere(
        (status) => status.name == (userData?['kycStatus'] ?? 'pending'),
        orElse: () => domain.KYCStatus.pending,
      ),
      profile: userData?['profile'] != null
          ? domain.UserProfile.fromJson(userData!['profile'])
          : null,
      preferences: userData?['preferences'] != null
          ? domain.UserPreferences.fromJson(userData!['preferences'])
          : null,
      createdAt: firebaseUser.metadata.creationTime,
      lastSignInAt: firebaseUser.metadata.lastSignInTime,
      linkedProviders: (userData?['linkedProviders'] as List?)
          ?.map((p) => domain.AuthProvider.values.firstWhere(
                (provider) => provider.name == p,
                orElse: () => domain.AuthProvider.email,
              ))
          .toList() ?? [domain.AuthProvider.email],
    );
  }
  
  /// Map Firebase Auth exception to domain AuthFailure
  AuthFailure _mapFirebaseErrorToAuthFailure(firebase.FirebaseAuthException e) {
    AuthFailureType type;
    String message;
    
    switch (e.code) {
      case 'user-not-found':
        type = AuthFailureType.userNotFound;
        message = 'No user found with this email address';
        break;
      case 'wrong-password':
        type = AuthFailureType.wrongPassword;
        message = 'Incorrect password';
        break;
      case 'invalid-email':
        type = AuthFailureType.invalidCredentials;
        message = 'Invalid email address';
        break;
      case 'user-disabled':
        type = AuthFailureType.accountDisabled;
        message = 'This account has been disabled';
        break;
      case 'too-many-requests':
        type = AuthFailureType.timeout;
        message = 'Too many requests. Please try again later';
        break;
      case 'email-already-in-use':
        type = AuthFailureType.emailAlreadyInUse;
        message = 'An account with this email already exists';
        break;
      case 'weak-password':
        type = AuthFailureType.weakPassword;
        message = 'Password is too weak';
        break;
      case 'network-request-failed':
        type = AuthFailureType.networkError;
        message = 'Network error. Please check your internet connection';
        break;
      case 'operation-not-allowed':
        type = AuthFailureType.permissionDenied;
        message = 'This operation is not allowed';
        break;
      default:
        type = AuthFailureType.unknown;
        message = e.message ?? 'An unknown error occurred';
    }
    
    return AuthFailure(
      message: message,
      type: type,
      code: e.code,
    );
  }
  
  // Biometric Authentication
  
  /// Check if biometric authentication is available
  Future<bool> isBiometricAvailable() async {
    if (!BiometricAuthService.isSupported) return false;
    
    try {
      return await BiometricAuthService.isBiometricsAvailable();
    } catch (e) {
      if (kDebugMode) {
        print('Biometric availability check error: $e');
      }
      return false;
    }
  }
  
  /// Check if biometric authentication is enabled for current user
  Future<bool> isBiometricEnabled() async {
    if (!BiometricAuthService.isSupported || !isAuthenticated) return false;
    
    try {
      return await BiometricAuthService.isBiometricEnabled(
        userId: _auth.currentUser?.uid,
      );
    } catch (e) {
      if (kDebugMode) {
        print('Biometric enabled check error: $e');
      }
      return false;
    }
  }
  
  /// Enable biometric authentication for current user
  Future<AuthResult> enableBiometricAuthentication() async {
    final user = _auth.currentUser;
    if (user == null) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'No authenticated user found',
          type: AuthFailureType.permissionDenied,
        ),
      );
    }
    
    if (!BiometricAuthService.isSupported) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'Biometric authentication is not supported on this platform',
          type: AuthFailureType.biometricNotAvailable,
        ),
      );
    }
    
    try {
      final result = await BiometricAuthService.enableBiometric(
        userId: user.uid,
        userEmail: user.email ?? '',
      );
      
      if (result.success) {
        // Update user preferences in Firestore
        await _updateUserData(user.uid, {
          'preferences.biometricEnabled': true,
          'updatedAt': FieldValue.serverTimestamp(),
        });
        
        final userData = await _getUserData(user.uid);
        final domainUser = await _mapFirebaseUserToDomainUser(user, userData);
        return AuthResult.success(domainUser);
      } else {
        return AuthResult.failure(
          AuthFailure(
            message: result.errorMessage ?? 'Failed to enable biometric authentication',
            type: AuthFailureType.biometricError,
          ),
        );
      }
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Failed to enable biometric authentication: ${e.toString()}',
          type: AuthFailureType.biometricError,
        ),
      );
    }
  }
  
  /// Disable biometric authentication for current user
  Future<void> disableBiometricAuthentication() async {
    final user = _auth.currentUser;
    if (user == null || !BiometricAuthService.isSupported) return;
    
    try {
      await BiometricAuthService.disableBiometric(userId: user.uid);
      
      // Update user preferences in Firestore
      await _updateUserData(user.uid, {
        'preferences.biometricEnabled': false,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error disabling biometric authentication: $e');
      }
    }
  }
  
  /// Sign in with biometric authentication
  Future<AuthResult> signInWithBiometric() async {
    if (!BiometricAuthService.isSupported) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'Biometric authentication is not supported on this platform',
          type: AuthFailureType.biometricNotAvailable,
        ),
      );
    }
    
    try {
      // Check if biometric is available
      final isAvailable = await BiometricAuthService.isBiometricsAvailable();
      if (!isAvailable) {
        return const AuthResult.failure(
          AuthFailure(
            message: 'Biometric authentication is not available on this device',
            type: AuthFailureType.biometricNotAvailable,
          ),
        );
      }
      
      // Get stored user info
      final userInfo = await BiometricAuthService.getStoredUserInfo();
      if (userInfo == null) {
        return const AuthResult.failure(
          AuthFailure(
            message: 'No biometric authentication is set up. Please enable biometric authentication first.',
            type: AuthFailureType.biometricNotEnrolled,
          ),
        );
      }
      
      // Authenticate with biometrics
      final authResult = await BiometricAuthService.authenticate(
        reason: 'Sign in to your Social Impact account',
      );
      
      if (!authResult.success) {
        return AuthResult.failure(
          AuthFailure(
            message: authResult.errorMessage ?? 'Biometric authentication failed',
            type: AuthFailureType.biometricError,
          ),
        );
      }
      
      // Get user data and return success
      // Note: In a production app, you might want to store and retrieve encrypted tokens
      // For this MVP, we'll return success with stored user info
      final userData = await _getUserData(userInfo.userId);
      if (userData == null) {
        return const AuthResult.failure(
          AuthFailure(
            message: 'User account not found. Please sign in with your credentials.',
            type: AuthFailureType.userNotFound,
          ),
        );
      }
      
      // Create a temporary user object for biometric success
      // In production, you'd implement proper token-based authentication
      final domainUser = domain.User(
        uid: userInfo.userId,
        email: userInfo.email,
        displayName: userData['displayName'],
        photoURL: userData['photoURL'],
        isEmailVerified: userData['isEmailVerified'] ?? false,
        role: domain.UserRole.values.firstWhere(
          (role) => role.name == (userData['role'] ?? 'investor'),
          orElse: () => domain.UserRole.investor,
        ),
        status: domain.UserStatus.values.firstWhere(
          (status) => status.name == (userData['status'] ?? 'active'),
          orElse: () => domain.UserStatus.active,
        ),
        kycStatus: domain.KYCStatus.values.firstWhere(
          (status) => status.name == (userData['kycStatus'] ?? 'pending'),
          orElse: () => domain.KYCStatus.pending,
        ),
        profile: userData['profile'] != null
            ? domain.UserProfile.fromJson(userData['profile'])
            : null,
        preferences: userData['preferences'] != null
            ? domain.UserPreferences.fromJson(userData['preferences'])
            : null,
        linkedProviders: (userData['linkedProviders'] as List?)
            ?.map((p) => domain.AuthProvider.values.firstWhere(
                  (provider) => provider.name == p,
                  orElse: () => domain.AuthProvider.email,
                ))
            .toList() ?? [domain.AuthProvider.email],
      );
      
      return AuthResult.success(domainUser);
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Biometric authentication failed: ${e.toString()}',
          type: AuthFailureType.biometricError,
        ),
      );
    }
  }
  
  /// Dispose resources
  void dispose() {
    _authStateController?.close();
  }
}