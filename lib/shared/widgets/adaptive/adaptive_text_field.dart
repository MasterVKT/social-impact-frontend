import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/utils/platform_detector.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../core/themes/color_scheme.dart';

/// AdaptiveTextField provides platform-aware text input with Material Design for Android/Web
/// and Cupertino styling for iOS, with responsive sizing and proper accessibility support.
class AdaptiveTextField extends StatelessWidget {
  final String? label;
  final String? placeholder;
  final String? helperText;
  final String? errorText;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsets? contentPadding;
  final InputFieldSize size;
  final bool showCursor;
  final String? initialValue;

  const AdaptiveTextField({
    Key? key,
    this.label,
    this.placeholder,
    this.helperText,
    this.errorText,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onSubmitted,
    this.validator,
    this.inputFormatters,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
    this.size = InputFieldSize.medium,
    this.showCursor = true,
    this.initialValue,
  }) : super(key: key);

  /// Named constructor for password fields
  const AdaptiveTextField.password({
    Key? key,
    this.label,
    this.placeholder,
    this.helperText,
    this.errorText,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.textInputAction = TextInputAction.done,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onSubmitted,
    this.validator,
    this.inputFormatters,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
    this.size = InputFieldSize.medium,
    this.initialValue,
  }) : obscureText = true,
       keyboardType = TextInputType.visiblePassword,
       textCapitalization = TextCapitalization.none,
       maxLines = 1,
       minLines = null,
       maxLength = null,
       showCursor = true,
       super(key: key);

  /// Named constructor for multiline text areas
  const AdaptiveTextField.multiline({
    Key? key,
    this.label,
    this.placeholder,
    this.helperText,
    this.errorText,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.sentences,
    this.maxLength,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onSubmitted,
    this.validator,
    this.inputFormatters,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
    this.size = InputFieldSize.medium,
    this.initialValue,
  }) : obscureText = false,
       keyboardType = TextInputType.multiline,
       textInputAction = TextInputAction.newline,
       maxLines = null,
       minLines = 3,
       showCursor = true,
       super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return _buildIOSTextField(context);
    } else {
      return _buildMaterialTextField(context);
    }
  }

  Widget _buildIOSTextField(BuildContext context) {
    final textField = CupertinoTextField(
      controller: controller,
      focusNode: focusNode,
      placeholder: placeholder ?? label,
      obscureText: obscureText,
      enabled: enabled,
      readOnly: readOnly,
      autofocus: autofocus,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      onChanged: onChanged,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      inputFormatters: inputFormatters,
      prefix: prefix,
      suffix: suffix,
      padding: _getIOSPadding(context),
      decoration: _getIOSDecoration(context),
      style: _getTextStyle(context),
      showCursor: showCursor,
    );

    return _wrapWithLabelAndError(context, textField);
  }

  Widget _buildMaterialTextField(BuildContext context) {
    final isWeb = PlatformDetector.isWeb;
    
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      initialValue: controller == null ? initialValue : null,
      obscureText: obscureText,
      enabled: enabled,
      readOnly: readOnly,
      autofocus: autofocus,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      onChanged: onChanged,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      inputFormatters: inputFormatters,
      style: _getTextStyle(context),
      showCursor: showCursor,
      decoration: InputDecoration(
        labelText: label,
        hintText: placeholder,
        helperText: helperText,
        errorText: errorText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefix: prefix,
        suffix: suffix,
        contentPadding: contentPadding ?? _getMaterialPadding(context),
        filled: true,
        fillColor: _getFillColor(context),
        border: _getBorder(context),
        enabledBorder: _getBorder(context),
        focusedBorder: _getFocusedBorder(context),
        errorBorder: _getErrorBorder(context),
        focusedErrorBorder: _getErrorBorder(context),
        disabledBorder: _getDisabledBorder(context),
        // Web-specific hover support
        hoverColor: isWeb ? AdaptiveColors.neutral100 : null,
      ),
    );
  }

  Widget _wrapWithLabelAndError(BuildContext context, Widget textField) {
    if (label == null && errorText == null && helperText == null) {
      return textField;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: _getLabelStyle(context),
          ),
          const SizedBox(height: 6),
        ],
        textField,
        if (errorText != null) ...[
          const SizedBox(height: 6),
          Text(
            errorText!,
            style: _getErrorStyle(context),
          ),
        ] else if (helperText != null) ...[
          const SizedBox(height: 6),
          Text(
            helperText!,
            style: _getHelperStyle(context),
          ),
        ],
      ],
    );
  }

  // iOS-specific styling
  BoxDecoration _getIOSDecoration(BuildContext context) {
    return BoxDecoration(
      color: _getFillColor(context),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        color: errorText != null
            ? CupertinoColors.destructiveRed
            : CupertinoColors.systemGrey4,
        width: 1,
      ),
    );
  }

  EdgeInsets _getIOSPadding(BuildContext context) {
    if (contentPadding != null) return contentPadding!;
    
    final basePadding = ResponsiveUtils.getAdaptivePadding(context);
    
    switch (size) {
      case InputFieldSize.small:
        return EdgeInsets.all(basePadding * 0.75);
      case InputFieldSize.medium:
        return EdgeInsets.all(basePadding);
      case InputFieldSize.large:
        return EdgeInsets.all(basePadding * 1.25);
    }
  }

  // Material-specific styling
  EdgeInsets _getMaterialPadding(BuildContext context) {
    if (contentPadding != null) return contentPadding!;
    
    final basePadding = ResponsiveUtils.getAdaptivePadding(context);
    
    switch (size) {
      case InputFieldSize.small:
        return EdgeInsets.symmetric(
          horizontal: basePadding * 0.75,
          vertical: basePadding * 0.5,
        );
      case InputFieldSize.medium:
        return EdgeInsets.symmetric(
          horizontal: basePadding,
          vertical: basePadding * 0.75,
        );
      case InputFieldSize.large:
        return EdgeInsets.symmetric(
          horizontal: basePadding * 1.25,
          vertical: basePadding,
        );
    }
  }

  OutlineInputBorder _getBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AdaptiveColors.neutral300,
        width: 1,
      ),
    );
  }

  OutlineInputBorder _getFocusedBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AdaptiveColors.primary,
        width: 2,
      ),
    );
  }

  OutlineInputBorder _getErrorBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AdaptiveColors.error,
        width: 2,
      ),
    );
  }

  OutlineInputBorder _getDisabledBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AdaptiveColors.neutral200,
        width: 1,
      ),
    );
  }

  // Common styling methods
  Color _getFillColor(BuildContext context) {
    if (!enabled) {
      return PlatformDetector.isIOS
          ? CupertinoColors.systemGrey6
          : AdaptiveColors.neutral100;
    }
    
    return PlatformDetector.isIOS
        ? CupertinoColors.systemBackground
        : AdaptiveColors.surface;
  }

  TextStyle _getTextStyle(BuildContext context) {
    final theme = Theme.of(context);
    final baseStyle = theme.textTheme.bodyLarge!;
    
    return baseStyle.copyWith(
      fontSize: _getFontSize(context),
      color: enabled 
          ? (PlatformDetector.isIOS 
              ? CupertinoColors.label 
              : AdaptiveColors.onSurface)
          : (PlatformDetector.isIOS 
              ? CupertinoColors.inactiveGray 
              : AdaptiveColors.neutral400),
    );
  }

  TextStyle _getLabelStyle(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.bodyMedium!.copyWith(
      fontWeight: FontWeight.w500,
      color: AdaptiveColors.onSurface,
    );
  }

  TextStyle _getErrorStyle(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.bodySmall!.copyWith(
      color: AdaptiveColors.error,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle _getHelperStyle(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.bodySmall!.copyWith(
      color: AdaptiveColors.onSurfaceVariant,
    );
  }

  double _getFontSize(BuildContext context) {
    switch (size) {
      case InputFieldSize.small:
        return ResponsiveUtils.isMobileScreen(context) ? 14 : 15;
      case InputFieldSize.medium:
        return ResponsiveUtils.isMobileScreen(context) ? 16 : 17;
      case InputFieldSize.large:
        return ResponsiveUtils.isMobileScreen(context) ? 18 : 19;
    }
  }
}

/// Sizes for adaptive text fields
enum InputFieldSize {
  small,   // Compact text field
  medium,  // Standard text field
  large,   // Large text field
}

/// Specialized adaptive search field
class AdaptiveSearchField extends StatelessWidget {
  final String? placeholder;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;
  final bool autofocus;
  final bool enabled;

  const AdaptiveSearchField({
    Key? key,
    this.placeholder,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.autofocus = false,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showClearButton = controller?.text.isNotEmpty ?? false;

    if (PlatformDetector.isIOS) {
      return CupertinoSearchTextField(
        controller: controller,
        placeholder: placeholder ?? 'Search',
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        autofocus: autofocus,
        enabled: enabled,
        style: TextStyle(
          color: enabled ? CupertinoColors.label : CupertinoColors.inactiveGray,
        ),
      );
    } else {
      return AdaptiveTextField(
        controller: controller,
        placeholder: placeholder ?? 'Search',
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        autofocus: autofocus,
        enabled: enabled,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: showClearButton
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  controller?.clear();
                  onClear?.call();
                  onChanged?.call('');
                },
              )
            : null,
      );
    }
  }
}