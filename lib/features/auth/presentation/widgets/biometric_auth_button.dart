import 'package:flutter/material.dart';
import '../../../../core/services/biometric/biometric_service.dart';

/// Widget qui affiche un bouton d'authentification biométrique
class BiometricAuthButton extends StatefulWidget {
  final String reason;
  final VoidCallback onAuthenticated;
  final VoidCallback onFailed;
  final VoidCallback onUnavailable;

  const BiometricAuthButton({
    super.key,
    required this.reason,
    required this.onAuthenticated,
    required this.onFailed,
    required this.onUnavailable,
  });

  @override
  State<BiometricAuthButton> createState() => _BiometricAuthButtonState();
}

class _BiometricAuthButtonState extends State<BiometricAuthButton> {
  final BiometricService _biometricService = BiometricService();
  bool _isAvailable = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkBiometricAvailability();
  }

  Future<void> _checkBiometricAvailability() async {
    final isAvailable = await _biometricService.isBiometricAvailable();

    if (mounted) {
      setState(() {
        _isAvailable = isAvailable;
        _isLoading = false;
      });
    }

    if (!isAvailable && mounted) {
      widget.onUnavailable();
    }
  }

  Future<void> _authenticate() async {
    setState(() {
      _isLoading = true;
    });

    final success = await _biometricService.authenticate(
      reason: widget.reason,
      useErrorDialogs: true,
      stickyAuth: true,
    );

    if (mounted) {
      setState(() {
        _isLoading = false;
      });

      if (success) {
        widget.onAuthenticated();
      } else {
        widget.onFailed();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const CircularProgressIndicator();
    }

    if (!_isAvailable) {
      return const SizedBox.shrink();
    }

    return ElevatedButton.icon(
      onPressed: _authenticate,
      icon: const Icon(Icons.fingerprint),
      label: const Text('Authentification biométrique'),
    );
  }
}
