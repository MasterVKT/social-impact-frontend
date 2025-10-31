import 'package:flutter/material.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';

/// Widget that displays password strength with visual indicator and feedback
class PasswordStrengthIndicator extends StatelessWidget {
  final String password;
  final bool showRequirements;
  
  const PasswordStrengthIndicator({
    super.key,
    required this.password,
    this.showRequirements = true,
  });

  @override
  Widget build(BuildContext context) {
    final strength = _calculatePasswordStrength(password);
    final requirements = _getPasswordRequirements(password);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStrengthBar(context, strength),
        const SizedBox(height: Spacing.xs),
        _buildStrengthText(context, strength),
        if (showRequirements && password.isNotEmpty) ...[
          const SizedBox(height: Spacing.sm),
          _buildRequirementsList(context, requirements),
        ],
      ],
    );
  }
  
  /// Build strength indicator bar
  Widget _buildStrengthBar(BuildContext context, PasswordStrength strength) {
    final strengthValue = _getStrengthValue(strength);
    final strengthColor = _getStrengthColor(context, strength);
    
    return Column(
      children: [
        Row(
          children: List.generate(4, (index) {
            final isActive = index < (strengthValue * 4).ceil();
            return Expanded(
              child: Container(
                height: 4,
                margin: EdgeInsets.only(
                  right: index < 3 ? Spacing.xs : 0,
                ),
                decoration: BoxDecoration(
                  color: isActive
                      ? strengthColor
                      : Theme.of(context).colorScheme.outline.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
  
  /// Build strength text
  Widget _buildStrengthText(BuildContext context, PasswordStrength strength) {
    final strengthText = _getStrengthText(strength);
    final strengthColor = _getStrengthColor(context, strength);
    
    return Row(
      children: [
        Text(
          'Password strength: ',
          style: AdaptiveTextStyles.bodySmall(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          ),
        ),
        Text(
          strengthText,
          style: AdaptiveTextStyles.bodySmall(context).copyWith(
            color: strengthColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
  
  /// Build requirements list
  Widget _buildRequirementsList(
    BuildContext context,
    List<PasswordRequirement> requirements,
  ) {
    return Container(
      padding: const EdgeInsets.all(Spacing.sm),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: requirements
            .map((req) => _buildRequirementItem(context, req))
            .toList(),
      ),
    );
  }
  
  /// Build individual requirement item
  Widget _buildRequirementItem(
    BuildContext context,
    PasswordRequirement requirement,
  ) {
    final isMet = requirement.isMet;
    final color = isMet
        ? Theme.of(context).colorScheme.tertiary
        : Theme.of(context).colorScheme.onSurface.withOpacity(0.6);
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        children: [
          Icon(
            isMet ? Icons.check_circle : Icons.radio_button_unchecked,
            size: 16,
            color: color,
          ),
          const SizedBox(width: Spacing.xs),
          Expanded(
            child: Text(
              requirement.description,
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: color,
                decoration: isMet ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  /// Calculate password strength
  PasswordStrength _calculatePasswordStrength(String password) {
    if (password.isEmpty) return PasswordStrength.none;
    
    int score = 0;
    
    // Length scoring
    if (password.length >= 8) score += 2;
    if (password.length >= 12) score += 1;
    if (password.length >= 16) score += 1;
    
    // Character variety scoring
    if (password.contains(RegExp(r'[a-z]'))) score += 1;
    if (password.contains(RegExp(r'[A-Z]'))) score += 1;
    if (password.contains(RegExp(r'[0-9]'))) score += 1;
    if (password.contains(RegExp(r'[!@#$%^&*()_+\-=\[\]{};:"\\|,.<>\/?]'))) score += 1;
    
    // Pattern scoring
    if (_hasNoRepeatingChars(password)) score += 1;
    if (_hasNoSequentialChars(password)) score += 1;
    
    // Penalty for common patterns
    if (_isCommonPattern(password)) score -= 2;
    
    // Convert score to strength
    if (score <= 2) return PasswordStrength.weak;
    if (score <= 4) return PasswordStrength.fair;
    if (score <= 6) return PasswordStrength.good;
    if (score <= 8) return PasswordStrength.strong;
    return PasswordStrength.veryStrong;
  }
  
  /// Get password requirements with their status
  List<PasswordRequirement> _getPasswordRequirements(String password) {
    return [
      PasswordRequirement(
        description: 'At least 8 characters',
        isMet: password.length >= 8,
      ),
      PasswordRequirement(
        description: 'Contains uppercase letter',
        isMet: password.contains(RegExp(r'[A-Z]')),
      ),
      PasswordRequirement(
        description: 'Contains lowercase letter',
        isMet: password.contains(RegExp(r'[a-z]')),
      ),
      PasswordRequirement(
        description: 'Contains number',
        isMet: password.contains(RegExp(r'[0-9]')),
      ),
      PasswordRequirement(
        description: 'Contains special character',
        isMet: password.contains(RegExp(r'[!@#$%^&*()_+\-=\[\]{};:"\\|,.<>\/?]')),
      ),
    ];
  }
  
  /// Get strength value (0.0 to 1.0)
  double _getStrengthValue(PasswordStrength strength) {
    switch (strength) {
      case PasswordStrength.none:
        return 0.0;
      case PasswordStrength.weak:
        return 0.25;
      case PasswordStrength.fair:
        return 0.5;
      case PasswordStrength.good:
        return 0.75;
      case PasswordStrength.strong:
        return 0.9;
      case PasswordStrength.veryStrong:
        return 1.0;
    }
  }
  
  /// Get strength color
  Color _getStrengthColor(BuildContext context, PasswordStrength strength) {
    switch (strength) {
      case PasswordStrength.none:
        return Theme.of(context).colorScheme.outline;
      case PasswordStrength.weak:
        return Theme.of(context).colorScheme.error;
      case PasswordStrength.fair:
        return Colors.orange;
      case PasswordStrength.good:
        return Colors.yellow;
      case PasswordStrength.strong:
        return Theme.of(context).colorScheme.tertiary;
      case PasswordStrength.veryStrong:
        return Colors.green;
    }
  }
  
  /// Get strength text
  String _getStrengthText(PasswordStrength strength) {
    switch (strength) {
      case PasswordStrength.none:
        return 'Enter password';
      case PasswordStrength.weak:
        return 'Weak';
      case PasswordStrength.fair:
        return 'Fair';
      case PasswordStrength.good:
        return 'Good';
      case PasswordStrength.strong:
        return 'Strong';
      case PasswordStrength.veryStrong:
        return 'Very Strong';
    }
  }
  
  /// Check if password has no repeating characters
  bool _hasNoRepeatingChars(String password) {
    for (int i = 0; i < password.length - 2; i++) {
      if (password[i] == password[i + 1] && password[i] == password[i + 2]) {
        return false;
      }
    }
    return true;
  }
  
  /// Check if password has no sequential characters
  bool _hasNoSequentialChars(String password) {
    final lower = password.toLowerCase();
    for (int i = 0; i < lower.length - 2; i++) {
      final code1 = lower.codeUnitAt(i);
      final code2 = lower.codeUnitAt(i + 1);
      final code3 = lower.codeUnitAt(i + 2);
      
      if (code2 == code1 + 1 && code3 == code2 + 1) {
        return false;
      }
      if (code2 == code1 - 1 && code3 == code2 - 1) {
        return false;
      }
    }
    return true;
  }
  
  /// Check if password is a common pattern
  bool _isCommonPattern(String password) {
    final commonPatterns = [
      'password',
      '12345678',
      'qwerty',
      'abc123',
      '123456789',
      'welcome',
      'admin',
      'letmein',
      'monkey',
      'dragon',
    ];
    
    final lower = password.toLowerCase();
    return commonPatterns.any((pattern) => lower.contains(pattern));
  }
}

/// Password strength levels
enum PasswordStrength {
  none,
  weak,
  fair,
  good,
  strong,
  veryStrong,
}

/// Password requirement with status
class PasswordRequirement {
  final String description;
  final bool isMet;
  
  const PasswordRequirement({
    required this.description,
    required this.isMet,
  });
}