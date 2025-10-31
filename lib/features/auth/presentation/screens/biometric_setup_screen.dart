import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils/platform_detector.dart';
import '../../../../shared/widgets/adaptive/adaptive_button.dart';
import '../../../../shared/widgets/responsive_layout.dart';
import '../providers/providers.dart';
import '../providers/auth_providers.dart';
import '../widgets/biometric_auth_button.dart';

/// Screen for setting up and managing biometric authentication
/// Shows biometric capabilities and allows users to enable/disable
class BiometricSetupScreen extends ConsumerStatefulWidget {
  const BiometricSetupScreen({super.key});

  @override
  ConsumerState<BiometricSetupScreen> createState() =>
      _BiometricSetupScreenState();
}

class _BiometricSetupScreenState extends ConsumerState<BiometricSetupScreen> {
  @override
  Widget build(BuildContext context) {
    final biometricCapabilities = ref.watch(biometricCapabilitiesProvider);
    final isAuthenticated = ref.watch(isAuthenticatedProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Biometric Authentication'),
        elevation: 0,
      ),
      body: ResponsiveLayout(
        mobile: biometricCapabilities.when(
          data: (capabilities) => _buildBiometricSetup(
            context,
            capabilities,
            isAuthenticated,
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, _) => _buildErrorState(context, error.toString()),
        ),
      ),
    );
  }

  Widget _buildBiometricSetup(
    BuildContext context,
    BiometricCapabilities capabilities,
    bool isAuthenticated,
  ) {
    if (!isAuthenticated) {
      return _buildNotAuthenticatedState(context);
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          _buildHeader(context),
          const SizedBox(height: 24),

          // Platform Support Status
          _buildPlatformStatus(context, capabilities),
          const SizedBox(height: 24),

          // Biometric Capabilities
          if (capabilities.isSupported) ...[
            _buildCapabilitiesSection(context, capabilities),
            const SizedBox(height: 24),
          ],

          // Available Biometric Types
          if (capabilities.availableBiometrics.isNotEmpty) ...[
            _buildBiometricTypesSection(
                context, capabilities.availableBiometrics),
            const SizedBox(height: 24),
          ],

          // Setup Actions
          _buildActionsSection(context, capabilities),
          const SizedBox(height: 24),

          // Security Information
          _buildSecurityInfo(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Secure Sign-In',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Use your device\'s biometric authentication for quick and secure sign-in.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
        ),
      ],
    );
  }

  Widget _buildPlatformStatus(
      BuildContext context, BiometricCapabilities capabilities) {
    final platformName = PlatformDetector.isAndroid
        ? 'Android'
        : PlatformDetector.isIOS
            ? 'iOS'
            : 'Web';

    // Ajout d'une propriété calculée pour la compatibilité du dispositif
    final bool isDeviceSupported =
        capabilities.isSupported && capabilities.isAvailable;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  capabilities.isSupported
                      ? Icons.verified_user
                      : Icons.warning,
                  color:
                      capabilities.isSupported ? Colors.green : Colors.orange,
                ),
                const SizedBox(width: 8),
                Text(
                  'Platform Support',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Platform: $platformName'),
            Text('Supported: ${capabilities.isSupported ? 'Yes' : 'No'}'),
            if (capabilities.isSupported) ...[
              Text('Device Compatible: ${isDeviceSupported ? 'Yes' : 'No'}'),
              Text('Available: ${capabilities.isAvailable ? 'Yes' : 'No'}'),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCapabilitiesSection(
      BuildContext context, BiometricCapabilities capabilities) {
    // Ajout de propriétés calculées pour remplacer celles manquantes
    final bool isDeviceSupported =
        capabilities.isSupported && capabilities.isAvailable;
    final bool isEnrolled = capabilities.availableBiometrics.isNotEmpty;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Device Capabilities',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            _buildCapabilityRow(
              context,
              'Device Support',
              isDeviceSupported,
              isDeviceSupported
                  ? 'Your device supports biometric authentication'
                  : 'Your device does not support biometric authentication',
            ),
            const SizedBox(height: 8),
            _buildCapabilityRow(
              context,
              'Biometrics Enrolled',
              isEnrolled,
              isEnrolled
                  ? 'Biometrics are set up on your device'
                  : 'No biometrics are enrolled. Please set up biometrics in device settings.',
            ),
            const SizedBox(height: 8),
            _buildCapabilityRow(
              context,
              'Ready for Use',
              capabilities.isAvailable,
              capabilities.reason,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCapabilityRow(
      BuildContext context, String title, bool isEnabled, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          isEnabled ? Icons.check_circle : Icons.cancel,
          color: isEnabled ? Colors.green : Colors.red,
          size: 20,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.7),
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBiometricTypesSection(
      BuildContext context, List<String> typeStrings) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Biometric Types',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            ...typeStrings.map((typeString) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Icon(_getBiometricTypeIconFromString(typeString)),
                      const SizedBox(width: 8),
                      Text(_getBiometricTypeNameFromString(typeString)),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildActionsSection(
      BuildContext context, BiometricCapabilities capabilities) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Actions',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            if (capabilities.isSupported && capabilities.isAvailable) ...[
              // Enable/Disable Biometric Auth Button
              BiometricAuthButton(
                reason:
                    'Authenticate to ${capabilities.isEnabled ? "disable" : "enable"} biometric authentication',
                onAuthenticated: capabilities.isEnabled
                    ? _disableBiometric
                    : _enableBiometric,
                onFailed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('L\'authentification biométrique a échoué'),
                    ),
                  );
                },
                onUnavailable: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'L\'authentification biométrique n\'est pas disponible'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),

              // Test Biometric Button
              if (capabilities.isEnabled) ...[
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: _testBiometric,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.security),
                        SizedBox(width: 8),
                        Text('Test Biometric Authentication'),
                      ],
                    ),
                  ),
                ),
              ],
            ] else ...[
              // Not Available Message
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .surfaceContainerHighest
                      .withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color:
                        Theme.of(context).colorScheme.outline.withOpacity(0.5),
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.info,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.7),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      capabilities.reason,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.7),
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityInfo(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.security),
                const SizedBox(width: 8),
                Text(
                  'Security Information',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              '• Biometric data is stored securely on your device',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 4),
            Text(
              '• Your biometric information is never sent to our servers',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 4),
            Text(
              '• You can disable biometric authentication at any time',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 4),
            Text(
              '• Fallback authentication is always available',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotAuthenticatedState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock,
              size: 64,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'Authentication Required',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Please sign in to set up biometric authentication',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.7),
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            AdaptiveButton(
              text: 'Go Back',
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Error Loading Biometric Settings',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              error,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.7),
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            AdaptiveButton(
              text: 'Retry',
              onPressed: () {
                ref.invalidate(biometricCapabilitiesProvider);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _enableBiometric() async {
    try {
      final biometricUseCase = ref.read(biometricAuthUseCaseProvider);
      final result = await biometricUseCase.enableBiometricAuthentication();

      if (mounted) {
        result.when(
          success: (user) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Biometric authentication enabled successfully!'),
                backgroundColor: Colors.green,
              ),
            );
            // Refresh capabilities
            ref.invalidate(biometricCapabilitiesProvider);
          },
          failure: (failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(failure.message),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error enabling biometric authentication: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _disableBiometric() async {
    try {
      final biometricUseCase = ref.read(biometricAuthUseCaseProvider);
      final result = await biometricUseCase.disableBiometricAuthentication();

      if (mounted) {
        result.when(
          success: (user) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Biometric authentication disabled'),
                backgroundColor: Colors.orange,
              ),
            );
            // Refresh capabilities
            ref.invalidate(biometricCapabilitiesProvider);
          },
          failure: (failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(failure.message),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error disabling biometric authentication: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _testBiometric() async {
    try {
      final biometricUseCase = ref.read(biometricAuthUseCaseProvider);
      final result = await biometricUseCase.authenticateWithBiometrics();

      if (mounted) {
        result.when(
          success: (user) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Biometric authentication successful!'),
                backgroundColor: Colors.green,
              ),
            );
          },
          failure: (failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(failure.message),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Biometric test failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  IconData _getBiometricTypeIconFromString(String typeString) {
    switch (typeString.toLowerCase()) {
      case 'face':
        return Icons.face;
      case 'fingerprint':
        return Icons.fingerprint;
      case 'iris':
        return Icons.remove_red_eye;
      case 'weak':
        return Icons.security;
      case 'strong':
        return Icons.verified_user;
      default:
        return Icons.security;
    }
  }

  String _getBiometricTypeNameFromString(String typeString) {
    switch (typeString.toLowerCase()) {
      case 'face':
        return 'Face Recognition';
      case 'fingerprint':
        return 'Fingerprint';
      case 'iris':
        return 'Iris Recognition';
      case 'weak':
        return 'PIN/Pattern/Password';
      case 'strong':
        return 'Strong Biometric';
      default:
        return typeString;
    }
  }
}
