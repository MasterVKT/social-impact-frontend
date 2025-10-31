import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../shared/widgets/adaptive/adaptive_card.dart';
import '../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../shared/widgets/responsive/responsive_layout.dart';
import '../../shared/constants/spacing.dart';

/// Error screen for handling navigation and application errors
class ErrorScreen extends ConsumerWidget {
  final Exception? error;
  final String? customMessage;
  final bool showRetry;
  final VoidCallback? onRetry;
  
  const ErrorScreen({
    super.key,
    this.error,
    this.customMessage,
    this.showRetry = true,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveLayout(
      mobile: _buildMobileLayout(context),
      tablet: _buildTabletLayout(context),
      desktop: _buildDesktopLayout(context),
    );
  }

  /// Build mobile layout
  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Something went wrong',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => _handleBack(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.lg),
        child: _buildErrorContent(context),
      ),
    );
  }

  /// Build tablet layout
  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Error',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => _handleBack(context),
        ),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(Spacing.xl),
          child: _buildErrorContent(context),
        ),
      ),
    );
  }

  /// Build desktop layout
  Widget _buildDesktopLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Application Error',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => _handleBack(context),
        ),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          padding: const EdgeInsets.all(Spacing.xl),
          child: _buildErrorContent(context),
        ),
      ),
    );
  }

  /// Build error content
  Widget _buildErrorContent(BuildContext context) {
    final errorType = _getErrorType();
    
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Error icon
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: _getErrorColor(errorType).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _getErrorIcon(errorType),
                size: 60,
                color: _getErrorColor(errorType),
              ),
            ),
            
            AdaptiveSpacing.verticalLarge(),
            
            // Error title
            Text(
              _getErrorTitle(errorType),
              style: AdaptiveTextStyles.headlineSmall(context).copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            
            AdaptiveSpacing.verticalMedium(),
            
            // Error message
            Text(
              customMessage ?? _getErrorMessage(errorType),
              style: AdaptiveTextStyles.bodyLarge(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            
            AdaptiveSpacing.verticalLarge(),
            
            // Error details (in debug mode)
            if (_shouldShowDetails()) ...[
              _buildErrorDetails(context),
              AdaptiveSpacing.verticalLarge(),
            ],
            
            // Action buttons
            _buildActionButtons(context, errorType),
            
            AdaptiveSpacing.verticalMedium(),
            
            // Additional help
            _buildHelpSection(context),
          ],
        ),
      ),
    );
  }

  /// Build error details
  Widget _buildErrorDetails(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.error.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Error Details',
            style: AdaptiveTextStyles.titleSmall(context).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: Spacing.sm),
          Text(
            error?.toString() ?? 'No specific error information available',
            style: AdaptiveTextStyles.bodySmall(context).copyWith(
              fontFamily: 'monospace',
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  /// Build action buttons
  Widget _buildActionButtons(BuildContext context, ErrorType errorType) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: showRetry ? (onRetry ?? () => _handleRetry(context)) : null,
            icon: const Icon(Icons.refresh),
            label: Text(_getRetryLabel(errorType)),
          ),
        ),
        
        const SizedBox(height: Spacing.sm),
        
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => _handleBack(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Go Back'),
              ),
            ),
            const SizedBox(width: Spacing.sm),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => _goToHome(context),
                icon: const Icon(Icons.home),
                label: const Text('Home'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Build help section
  Widget _buildHelpSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            'Need Help?',
            style: AdaptiveTextStyles.bodyMedium(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: Spacing.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                onPressed: () => _contactSupport(context),
                icon: const Icon(Icons.support_agent, size: 16),
                label: const Text('Contact Support'),
              ),
              TextButton.icon(
                onPressed: () => _viewHelp(context),
                icon: const Icon(Icons.help, size: 16),
                label: const Text('View Help'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Get error type
  ErrorType _getErrorType() {
    if (error is GoException) {
      return ErrorType.navigation;
    } else if (error.toString().contains('network') || 
               error.toString().contains('connection') ||
               error.toString().contains('timeout')) {
      return ErrorType.network;
    } else if (error.toString().contains('permission') ||
               error.toString().contains('unauthorized')) {
      return ErrorType.permission;
    } else if (error.toString().contains('not found') ||
               error.toString().contains('404')) {
      return ErrorType.notFound;
    }
    return ErrorType.unknown;
  }

  /// Get error icon
  IconData _getErrorIcon(ErrorType errorType) {
    switch (errorType) {
      case ErrorType.network:
        return Icons.wifi_off;
      case ErrorType.permission:
        return Icons.lock;
      case ErrorType.notFound:
        return Icons.search_off;
      case ErrorType.navigation:
        return Icons.explore_off;
      case ErrorType.unknown:
      default:
        return Icons.error_outline;
    }
  }

  /// Get error color
  Color _getErrorColor(ErrorType errorType) {
    switch (errorType) {
      case ErrorType.network:
        return Colors.orange;
      case ErrorType.permission:
        return Colors.red;
      case ErrorType.notFound:
        return Colors.blue;
      case ErrorType.navigation:
        return Colors.purple;
      case ErrorType.unknown:
      default:
        return Colors.grey;
    }
  }

  /// Get error title
  String _getErrorTitle(ErrorType errorType) {
    switch (errorType) {
      case ErrorType.network:
        return 'Connection Problem';
      case ErrorType.permission:
        return 'Access Denied';
      case ErrorType.notFound:
        return 'Page Not Found';
      case ErrorType.navigation:
        return 'Navigation Error';
      case ErrorType.unknown:
      default:
        return 'Something Went Wrong';
    }
  }

  /// Get error message
  String _getErrorMessage(ErrorType errorType) {
    switch (errorType) {
      case ErrorType.network:
        return 'We\'re having trouble connecting to our servers. Please check your internet connection and try again.';
      case ErrorType.permission:
        return 'You don\'t have permission to access this resource. Please contact support if you believe this is an error.';
      case ErrorType.notFound:
        return 'The page you\'re looking for doesn\'t exist or has been moved. Let\'s get you back on track.';
      case ErrorType.navigation:
        return 'We encountered a problem navigating to the requested page. This might be a temporary issue.';
      case ErrorType.unknown:
      default:
        return 'An unexpected error occurred. Our team has been notified and we\'re working on a fix.';
    }
  }

  /// Get retry label
  String _getRetryLabel(ErrorType errorType) {
    switch (errorType) {
      case ErrorType.network:
        return 'Try Again';
      case ErrorType.permission:
        return 'Retry Access';
      case ErrorType.notFound:
        return 'Refresh';
      case ErrorType.navigation:
        return 'Reload';
      case ErrorType.unknown:
      default:
        return 'Retry';
    }
  }

  /// Check if should show error details
  bool _shouldShowDetails() {
    // In debug mode or development, show details
    return const bool.fromEnvironment('dart.vm.product') == false;
  }

  /// Handle retry action
  void _handleRetry(BuildContext context) {
    // Refresh the current page
    GoRouter.of(context).refresh();
  }

  /// Handle back navigation
  void _handleBack(BuildContext context) {
    if (GoRouter.of(context).canPop()) {
      GoRouter.of(context).pop();
    } else {
      _goToHome(context);
    }
  }

  /// Navigate to home
  void _goToHome(BuildContext context) {
    context.go('/dashboard');
  }

  /// Contact support
  void _contactSupport(BuildContext context) {
    context.push('/support/contact');
  }

  /// View help
  void _viewHelp(BuildContext context) {
    context.push('/help');
  }
}

/// Error type enumeration
enum ErrorType {
  network,
  permission,
  notFound,
  navigation,
  unknown,
}

/// Custom error screen for specific error types
class NetworkErrorScreen extends ErrorScreen {
  const NetworkErrorScreen({super.key}) 
      : super(customMessage: 'Please check your internet connection and try again.');
}

class PermissionErrorScreen extends ErrorScreen {
  const PermissionErrorScreen({super.key})
      : super(customMessage: 'You don\'t have permission to access this resource.');
}

class NotFoundErrorScreen extends ErrorScreen {
  const NotFoundErrorScreen({super.key})
      : super(customMessage: 'The page you\'re looking for doesn\'t exist.');
}