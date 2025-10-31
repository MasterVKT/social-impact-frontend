import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/utils/platform_detector.dart';

/// Shows an adaptive alert dialog
Future<T?> showAdaptiveDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
  String? confirmText,
  String? cancelText,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
  bool barrierDismissible = true,
}) {
  if (PlatformDetector.isIOS) {
    return showCupertinoDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          if (cancelText != null)
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
                onCancel?.call();
              },
              child: Text(cancelText),
            ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm?.call();
            },
            child: Text(confirmText ?? 'OK'),
          ),
        ],
      ),
    );
  } else {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          if (cancelText != null)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onCancel?.call();
              },
              child: Text(cancelText),
            ),
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm?.call();
            },
            child: Text(confirmText ?? 'OK'),
          ),
        ],
      ),
    );
  }
}

/// Shows an adaptive confirmation dialog
Future<bool> showAdaptiveConfirmDialog({
  required BuildContext context,
  required String title,
  required String content,
  String confirmText = 'Confirm',
  String cancelText = 'Cancel',
  bool isDangerous = false,
}) async {
  if (PlatformDetector.isIOS) {
    return await showCupertinoDialog<bool>(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(cancelText),
              ),
              CupertinoDialogAction(
                isDestructiveAction: isDangerous,
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(confirmText),
              ),
            ],
          ),
        ) ??
        false;
  } else {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(cancelText),
              ),
              FilledButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: isDangerous
                    ? FilledButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error,
                      )
                    : null,
                child: Text(confirmText),
              ),
            ],
          ),
        ) ??
        false;
  }
}

/// Shows an adaptive action sheet / bottom sheet
Future<T?> showAdaptiveActionSheet<T>({
  required BuildContext context,
  required String title,
  String? message,
  required List<AdaptiveAction<T>> actions,
  AdaptiveAction<T>? cancelAction,
}) {
  if (PlatformDetector.isIOS) {
    return showCupertinoModalPopup<T>(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: Text(title),
        message: message != null ? Text(message) : null,
        actions: actions.map((action) {
          return CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop(action.value);
              action.onPressed?.call();
            },
            isDestructiveAction: action.isDestructive,
            child: Text(action.label),
          );
        }).toList(),
        cancelButton: cancelAction != null
            ? CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.of(context).pop(cancelAction.value);
                  cancelAction.onPressed?.call();
                },
                child: Text(cancelAction.label),
              )
            : null,
      ),
    );
  } else {
    return showModalBottomSheet<T>(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                if (message != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    message,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ],
            ),
          ),
          const Divider(height: 1),
          ...actions.map((action) {
            return ListTile(
              leading: action.icon != null ? Icon(action.icon) : null,
              title: Text(
                action.label,
                style: action.isDestructive
                    ? TextStyle(color: Theme.of(context).colorScheme.error)
                    : null,
              ),
              onTap: () {
                Navigator.of(context).pop(action.value);
                action.onPressed?.call();
              },
            );
          }).toList(),
          if (cancelAction != null) ...[
            const Divider(height: 1),
            ListTile(
              title: Text(
                cancelAction.label,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.of(context).pop(cancelAction.value);
                cancelAction.onPressed?.call();
              },
            ),
          ],
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

/// Action model for action sheets
class AdaptiveAction<T> {
  final String label;
  final T value;
  final VoidCallback? onPressed;
  final bool isDestructive;
  final IconData? icon;

  const AdaptiveAction({
    required this.label,
    required this.value,
    this.onPressed,
    this.isDestructive = false,
    this.icon,
  });
}

/// Shows an adaptive loading dialog
class AdaptiveLoadingDialog extends StatelessWidget {
  final String? message;

  const AdaptiveLoadingDialog({
    Key? key,
    this.message,
  }) : super(key: key);

  static Future<T?> show<T>(
    BuildContext context, {
    String? message,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AdaptiveLoadingDialog(message: message),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return CupertinoAlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CupertinoActivityIndicator(radius: 14),
            if (message != null) ...[
              const SizedBox(height: 16),
              Text(message!),
            ],
          ],
        ),
      );
    } else {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            if (message != null) ...[
              const SizedBox(height: 16),
              Text(message!),
            ],
          ],
        ),
      );
    }
  }
}

/// Custom adaptive dialog widget
class AdaptiveDialogWidget extends StatelessWidget {
  final String title;
  final Widget content;
  final List<Widget> actions;

  const AdaptiveDialogWidget({
    Key? key,
    required this.title,
    required this.content,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: content,
        actions: actions,
      );
    } else {
      return AlertDialog(
        title: Text(title),
        content: content,
        actions: actions,
      );
    }
  }
}

/// Shows an input dialog
Future<String?> showAdaptiveInputDialog({
  required BuildContext context,
  required String title,
  String? message,
  String? placeholder,
  String? initialValue,
  TextInputType? keyboardType,
  String confirmText = 'OK',
  String cancelText = 'Cancel',
  String? Function(String?)? validator,
}) async {
  final controller = TextEditingController(text: initialValue);
  String? errorText;

  if (PlatformDetector.isIOS) {
    return await showCupertinoDialog<String>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => CupertinoAlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (message != null) ...[
                Text(message),
                const SizedBox(height: 8),
              ],
              CupertinoTextField(
                controller: controller,
                placeholder: placeholder,
                keyboardType: keyboardType,
                onChanged: (value) {
                  if (validator != null) {
                    setState(() {
                      errorText = validator(value);
                    });
                  }
                },
              ),
              if (errorText != null) ...[
                const SizedBox(height: 8),
                Text(
                  errorText!,
                  style: const TextStyle(
                    color: CupertinoColors.systemRed,
                    fontSize: 12,
                  ),
                ),
              ],
            ],
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(cancelText),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                final value = controller.text;
                if (validator != null) {
                  final error = validator(value);
                  if (error != null) {
                    setState(() => errorText = error);
                    return;
                  }
                }
                Navigator.of(context).pop(value);
              },
              child: Text(confirmText),
            ),
          ],
        ),
      ),
    );
  } else {
    return await showDialog<String>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (message != null) ...[
                Text(message),
                const SizedBox(height: 16),
              ],
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: placeholder,
                  errorText: errorText,
                ),
                keyboardType: keyboardType,
                onChanged: (value) {
                  if (validator != null) {
                    setState(() {
                      errorText = validator(value);
                    });
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(cancelText),
            ),
            FilledButton(
              onPressed: () {
                final value = controller.text;
                if (validator != null) {
                  final error = validator(value);
                  if (error != null) {
                    setState(() => errorText = error);
                    return;
                  }
                }
                Navigator.of(context).pop(value);
              },
              child: Text(confirmText),
            ),
          ],
        ),
      ),
    );
  }
}
