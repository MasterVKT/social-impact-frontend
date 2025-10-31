import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/utils/platform_detector.dart';

/// Adaptive switch widget
class AdaptiveSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;

  const AdaptiveSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.activeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return CupertinoSwitch(
        value: value,
        onChanged: onChanged,
        activeColor: activeColor ?? CupertinoColors.activeBlue,
      );
    } else {
      return Switch(
        value: value,
        onChanged: onChanged,
        activeColor: activeColor,
      );
    }
  }
}

/// Adaptive checkbox widget
class AdaptiveCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final Color? activeColor;
  final bool tristate;

  const AdaptiveCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.tristate = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return GestureDetector(
        onTap: () => onChanged(!value),
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            border: Border.all(
              color: value
                  ? (activeColor ?? CupertinoColors.activeBlue)
                  : CupertinoColors.systemGrey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(6),
            color: value
                ? (activeColor ?? CupertinoColors.activeBlue)
                : Colors.transparent,
          ),
          child: value
              ? const Icon(
                  CupertinoIcons.check_mark,
                  size: 16,
                  color: Colors.white,
                )
              : null,
        ),
      );
    } else {
      return Checkbox(
        value: value,
        onChanged: onChanged,
        activeColor: activeColor,
        tristate: tristate,
      );
    }
  }
}

/// Adaptive radio button
class AdaptiveRadio<T extends Object> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;
  final Color? activeColor;

  const AdaptiveRadio({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.activeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    if (PlatformDetector.isIOS) {
      return GestureDetector(
        onTap: () => onChanged(value),
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected
                  ? (activeColor ?? CupertinoColors.activeBlue)
                  : CupertinoColors.systemGrey,
              width: 2,
            ),
          ),
          child: isSelected
              ? Center(
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: activeColor ?? CupertinoColors.activeBlue,
                    ),
                  ),
                )
              : null,
        ),
      );
    } else {
      return Radio<T>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: activeColor,
      );
    }
  }
}

/// Adaptive slider widget
class AdaptiveSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final int? divisions;
  final String? label;
  final Color? activeColor;

  const AdaptiveSlider({
    Key? key,
    required this.value,
    required this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.label,
    this.activeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return CupertinoSlider(
        value: value,
        onChanged: onChanged,
        min: min,
        max: max,
        divisions: divisions,
        activeColor: activeColor ?? CupertinoColors.activeBlue,
      );
    } else {
      return Slider(
        value: value,
        onChanged: onChanged,
        min: min,
        max: max,
        divisions: divisions,
        label: label,
        activeColor: activeColor,
      );
    }
  }
}

/// Adaptive segmented control
class AdaptiveSegmentedControl<T extends Object> extends StatelessWidget {
  final Map<T, Widget> children;
  final T? groupValue;
  final ValueChanged<T?> onValueChanged;

  const AdaptiveSegmentedControl({
    Key? key,
    required this.children,
    required this.groupValue,
    required this.onValueChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformDetector.isIOS) {
      // CupertinoSegmentedControl requires non-null groupValue
      // We handle null by using a placeholder or not showing selection
      if (groupValue == null) {
        return Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: CupertinoColors.tertiarySystemFill,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: children.entries.map((entry) {
              return Expanded(
                child: GestureDetector(
                  onTap: () => onValueChanged(entry.key),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    alignment: Alignment.center,
                    child: entry.value,
                  ),
                ),
              );
            }).toList(),
          ),
        );
      }

      return CupertinoSegmentedControl<T>(
        children: children,
        groupValue: groupValue as T,
        onValueChanged: (T value) => onValueChanged(value),
      );
    } else {
      return SegmentedButton<T>(
        segments: children.entries
            .map(
              (entry) => ButtonSegment<T>(
                value: entry.key,
                label: entry.value,
              ),
            )
            .toList(),
        selected: groupValue != null ? {groupValue!} : {},
        onSelectionChanged: (Set<T> selected) {
          if (selected.isNotEmpty) {
            onValueChanged(selected.first);
          }
        },
      );
    }
  }
}

/// Adaptive date picker
class AdaptiveDatePicker {
  static Future<DateTime?> showDatePicker({
    required BuildContext context,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
    DatePickerMode initialDatePickerMode = DatePickerMode.day,
  }) {
    if (PlatformDetector.isIOS) {
      return _showIOSDatePicker(
        context: context,
        initialDate: initialDate,
        minimumDate: firstDate,
        maximumDate: lastDate,
      );
    } else {
      return showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate,
        initialDatePickerMode: initialDatePickerMode,
      );
    }
  }

  static Future<DateTime?> _showIOSDatePicker({
    required BuildContext context,
    required DateTime initialDate,
    required DateTime minimumDate,
    required DateTime maximumDate,
  }) async {
    DateTime? selectedDate = initialDate;

    await showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => Container(
        height: 300,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: Column(
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      selectedDate = null;
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoButton(
                    child: const Text('Done'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: initialDate,
                minimumDate: minimumDate,
                maximumDate: maximumDate,
                onDateTimeChanged: (DateTime date) {
                  selectedDate = date;
                },
              ),
            ),
          ],
        ),
      ),
    );

    return selectedDate;
  }
}

/// Adaptive time picker
class AdaptiveTimePicker {
  static Future<TimeOfDay?> showTimePicker({
    required BuildContext context,
    required TimeOfDay initialTime,
  }) {
    if (PlatformDetector.isIOS) {
      return _showIOSTimePicker(
        context: context,
        initialTime: initialTime,
      );
    } else {
      return showTimePicker(
        context: context,
        initialTime: initialTime,
      );
    }
  }

  static Future<TimeOfDay?> _showIOSTimePicker({
    required BuildContext context,
    required TimeOfDay initialTime,
  }) async {
    final now = DateTime.now();
    DateTime? selectedDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      initialTime.hour,
      initialTime.minute,
    );

    await showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => Container(
        height: 300,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: Column(
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      selectedDateTime = null;
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoButton(
                    child: const Text('Done'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: selectedDateTime,
                onDateTimeChanged: (DateTime date) {
                  selectedDateTime = date;
                },
              ),
            ),
          ],
        ),
      ),
    );

    return selectedDateTime != null
        ? TimeOfDay.fromDateTime(selectedDateTime!)
        : null;
  }
}
