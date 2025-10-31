import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/usecases/password_recovery_usecases.dart';
import '../providers/auth_providers.dart';
import 'auth_provider_aliases.dart';
import 'dart:async';

part 'password_recovery_providers.g.dart';

/// Provider for password recovery use cases
@riverpod
PasswordRecoveryUseCases passwordRecoveryUseCases(
    PasswordRecoveryUseCasesRef ref) {
  final repository = ref.read(authRepositoryProvider);
  return PasswordRecoveryUseCases(repository);
}

/// Provider for email verification status
@riverpod
Future<bool> emailVerificationRequired(EmailVerificationRequiredRef ref) async {
  final useCases = ref.read(passwordRecoveryUseCasesProvider);
  return await useCases.isEmailVerificationRequired();
}

/// Provider for resend cooldown timer
@riverpod
class ResendCooldown extends _$ResendCooldown {
  static const int _cooldownSeconds = 30;
  Timer? _timer;

  @override
  int build() {
    return 0;
  }

  /// Start cooldown timer
  void startCooldown() {
    state = _cooldownSeconds;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state > 0) {
        state = state - 1;
      } else {
        timer.cancel();
        _timer = null;
      }
    });
  }

  /// Reset cooldown
  void resetCooldown() {
    _timer?.cancel();
    _timer = null;
    state = 0;
  }

  /// Check if can resend
  bool get canResend => state <= 0;
}

/// Provider for password reset flow state
@riverpod
class PasswordResetFlow extends _$PasswordResetFlow {
  @override
  PasswordResetFlowState build() {
    return const PasswordResetFlowState.initial();
  }

  /// Start password reset flow
  Future<void> startPasswordReset(String email) async {
    state = const PasswordResetFlowState.loading();

    try {
      final useCases = ref.read(passwordRecoveryUseCasesProvider);
      await useCases.sendPasswordResetEmail(email);

      state = PasswordResetFlowState.emailSent(email);

      // Start cooldown for resend
      ref.read(resendCooldownProvider.notifier).startCooldown();
    } catch (e) {
      state = PasswordResetFlowState.error(e.toString());
    }
  }

  /// Resend password reset email
  Future<void> resendPasswordReset(String email) async {
    try {
      final useCases = ref.read(passwordRecoveryUseCasesProvider);
      await useCases.sendPasswordResetEmail(email);

      // Start cooldown again
      ref.read(resendCooldownProvider.notifier).startCooldown();

      state = PasswordResetFlowState.emailSent(email);
    } catch (e) {
      state = PasswordResetFlowState.error(e.toString());
    }
  }

  /// Confirm password reset with code
  Future<void> confirmPasswordReset({
    required String code,
    required String newPassword,
  }) async {
    state = const PasswordResetFlowState.loading();

    try {
      final useCases = ref.read(passwordRecoveryUseCasesProvider);
      await useCases.confirmPasswordReset(
        code: code,
        newPassword: newPassword,
      );

      state = const PasswordResetFlowState.success();
    } catch (e) {
      state = PasswordResetFlowState.error(e.toString());
    }
  }

  /// Reset flow state
  void resetFlow() {
    state = const PasswordResetFlowState.initial();
    ref.read(resendCooldownProvider.notifier).resetCooldown();
  }
}

/// Provider for email verification flow state
@riverpod
class EmailVerificationFlow extends _$EmailVerificationFlow {
  @override
  EmailVerificationFlowState build() {
    return const EmailVerificationFlowState.initial();
  }

  /// Send email verification
  Future<void> sendEmailVerification() async {
    state = const EmailVerificationFlowState.loading();

    try {
      final useCases = ref.read(passwordRecoveryUseCasesProvider);
      await useCases.sendEmailVerification();

      state = const EmailVerificationFlowState.emailSent();

      // Start cooldown for resend
      ref.read(resendCooldownProvider.notifier).startCooldown();
    } catch (e) {
      state = EmailVerificationFlowState.error(e.toString());
    }
  }

  /// Resend email verification
  Future<void> resendEmailVerification() async {
    try {
      final useCases = ref.read(passwordRecoveryUseCasesProvider);
      await useCases.resendEmailVerification();

      // Start cooldown again
      ref.read(resendCooldownProvider.notifier).startCooldown();

      state = const EmailVerificationFlowState.emailSent();
    } catch (e) {
      state = EmailVerificationFlowState.error(e.toString());
    }
  }

  /// Verify email with action code
  Future<void> verifyEmail(String actionCode) async {
    state = const EmailVerificationFlowState.loading();

    try {
      final useCases = ref.read(passwordRecoveryUseCasesProvider);
      await useCases.verifyEmail(actionCode);

      state = const EmailVerificationFlowState.success();

      // Refresh auth state to reflect email verification
      ref.invalidate(authStateProvider);
    } catch (e) {
      state = EmailVerificationFlowState.error(e.toString());
    }
  }

  /// Reset flow state
  void resetFlow() {
    state = const EmailVerificationFlowState.initial();
    ref.read(resendCooldownProvider.notifier).resetCooldown();
  }
}

/// Provider for password change flow
@riverpod
class PasswordChangeFlow extends _$PasswordChangeFlow {
  @override
  PasswordChangeFlowState build() {
    return const PasswordChangeFlowState.initial();
  }

  /// Change user password
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    state = const PasswordChangeFlowState.loading();

    try {
      final useCases = ref.read(passwordRecoveryUseCasesProvider);
      await useCases.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );

      state = const PasswordChangeFlowState.success();
    } catch (e) {
      state = PasswordChangeFlowState.error(e.toString());
    }
  }

  /// Reset flow state
  void resetFlow() {
    state = const PasswordChangeFlowState.initial();
  }
}

/// Provider for email update flow
@riverpod
class EmailUpdateFlow extends _$EmailUpdateFlow {
  @override
  EmailUpdateFlowState build() {
    return const EmailUpdateFlowState.initial();
  }

  /// Update user email
  Future<void> updateEmail({
    required String newEmail,
    required String password,
  }) async {
    state = const EmailUpdateFlowState.loading();

    try {
      final useCases = ref.read(passwordRecoveryUseCasesProvider);
      await useCases.updateEmail(
        newEmail: newEmail,
        password: password,
      );

      state = EmailUpdateFlowState.success(newEmail);

      // Refresh auth state to reflect email change
      ref.invalidate(authStateProvider);
    } catch (e) {
      state = EmailUpdateFlowState.error(e.toString());
    }
  }

  /// Reset flow state
  void resetFlow() {
    state = const EmailUpdateFlowState.initial();
  }
}

/// Provider for password validation
@riverpod
PasswordValidationResult passwordValidation(
  PasswordValidationRef ref,
  String password,
) {
  if (password.isEmpty) {
    return const PasswordValidationResult(isValid: false);
  }

  // Use the same validation logic as in the use cases
  if (password.length < 8) {
    return const PasswordValidationResult(
      isValid: false,
      errorMessage: 'Password must be at least 8 characters long',
    );
  }

  if (!password.contains(RegExp(r'[A-Z]'))) {
    return const PasswordValidationResult(
      isValid: false,
      errorMessage: 'Password must contain at least one uppercase letter',
    );
  }

  if (!password.contains(RegExp(r'[a-z]'))) {
    return const PasswordValidationResult(
      isValid: false,
      errorMessage: 'Password must contain at least one lowercase letter',
    );
  }

  if (!password.contains(RegExp(r'[0-9]'))) {
    return const PasswordValidationResult(
      isValid: false,
      errorMessage: 'Password must contain at least one number',
    );
  }

  if (!password.contains(RegExp(r'[!@#$%^&*()_+\-=\[\]{};:"\\|,.<>\/?]'))) {
    return const PasswordValidationResult(
      isValid: false,
      errorMessage: 'Password must contain at least one special character',
    );
  }

  // Check for common weak passwords
  final commonPasswords = [
    'password',
    '12345678',
    'qwerty123',
    'abc123456',
    'password123',
    '123456789',
    'welcome123',
    'admin123'
  ];

  if (commonPasswords.contains(password.toLowerCase())) {
    return const PasswordValidationResult(
      isValid: false,
      errorMessage: 'Password is too common, please choose a stronger password',
    );
  }

  return const PasswordValidationResult(isValid: true);
}

/// State classes for different flows

/// Password reset flow states
sealed class PasswordResetFlowState {
  const PasswordResetFlowState();

  const factory PasswordResetFlowState.initial() = _PasswordResetInitial;
  const factory PasswordResetFlowState.loading() = _PasswordResetLoading;
  const factory PasswordResetFlowState.emailSent(String email) =
      _PasswordResetEmailSent;
  const factory PasswordResetFlowState.success() = _PasswordResetSuccess;
  const factory PasswordResetFlowState.error(String message) =
      _PasswordResetError;
}

class _PasswordResetInitial extends PasswordResetFlowState {
  const _PasswordResetInitial();
}

class _PasswordResetLoading extends PasswordResetFlowState {
  const _PasswordResetLoading();
}

class _PasswordResetEmailSent extends PasswordResetFlowState {
  final String email;
  const _PasswordResetEmailSent(this.email);
}

class _PasswordResetSuccess extends PasswordResetFlowState {
  const _PasswordResetSuccess();
}

class _PasswordResetError extends PasswordResetFlowState {
  final String message;
  const _PasswordResetError(this.message);
}

/// Email verification flow states
sealed class EmailVerificationFlowState {
  const EmailVerificationFlowState();

  const factory EmailVerificationFlowState.initial() =
      _EmailVerificationInitial;
  const factory EmailVerificationFlowState.loading() =
      _EmailVerificationLoading;
  const factory EmailVerificationFlowState.emailSent() =
      _EmailVerificationEmailSent;
  const factory EmailVerificationFlowState.success() =
      _EmailVerificationSuccess;
  const factory EmailVerificationFlowState.error(String message) =
      _EmailVerificationError;
}

class _EmailVerificationInitial extends EmailVerificationFlowState {
  const _EmailVerificationInitial();
}

class _EmailVerificationLoading extends EmailVerificationFlowState {
  const _EmailVerificationLoading();
}

class _EmailVerificationEmailSent extends EmailVerificationFlowState {
  const _EmailVerificationEmailSent();
}

class _EmailVerificationSuccess extends EmailVerificationFlowState {
  const _EmailVerificationSuccess();
}

class _EmailVerificationError extends EmailVerificationFlowState {
  final String message;
  const _EmailVerificationError(this.message);
}

/// Password change flow states
sealed class PasswordChangeFlowState {
  const PasswordChangeFlowState();

  const factory PasswordChangeFlowState.initial() = _PasswordChangeInitial;
  const factory PasswordChangeFlowState.loading() = _PasswordChangeLoading;
  const factory PasswordChangeFlowState.success() = _PasswordChangeSuccess;
  const factory PasswordChangeFlowState.error(String message) =
      _PasswordChangeError;
}

class _PasswordChangeInitial extends PasswordChangeFlowState {
  const _PasswordChangeInitial();
}

class _PasswordChangeLoading extends PasswordChangeFlowState {
  const _PasswordChangeLoading();
}

class _PasswordChangeSuccess extends PasswordChangeFlowState {
  const _PasswordChangeSuccess();
}

class _PasswordChangeError extends PasswordChangeFlowState {
  final String message;
  const _PasswordChangeError(this.message);
}

/// Email update flow states
sealed class EmailUpdateFlowState {
  const EmailUpdateFlowState();

  const factory EmailUpdateFlowState.initial() = _EmailUpdateInitial;
  const factory EmailUpdateFlowState.loading() = _EmailUpdateLoading;
  const factory EmailUpdateFlowState.success(String newEmail) =
      _EmailUpdateSuccess;
  const factory EmailUpdateFlowState.error(String message) = _EmailUpdateError;
}

class _EmailUpdateInitial extends EmailUpdateFlowState {
  const _EmailUpdateInitial();
}

class _EmailUpdateLoading extends EmailUpdateFlowState {
  const _EmailUpdateLoading();
}

class _EmailUpdateSuccess extends EmailUpdateFlowState {
  final String newEmail;
  const _EmailUpdateSuccess(this.newEmail);
}

class _EmailUpdateError extends EmailUpdateFlowState {
  final String message;
  const _EmailUpdateError(this.message);
}
