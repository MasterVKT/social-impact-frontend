import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/utils/platform_detector.dart';

/// Adaptive dropdown/select widget
class AdaptiveDropdown<T extends Object> extends StatelessWidget {
  final T? value;
  final List<AdaptiveDropdownItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final String? hint;
  final Widget? icon;
  final Color? dropdownColor;
  final EdgeInsetsGeometry? padding;

  const AdaptiveDropdown({
    Key? key,
    this.value,
    required this.items,
    this.onChanged,
    this.hint,
    this.icon,
    this.dropdownColor,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return _buildIOSDropdown(context);
    } else {
      return _buildMaterialDropdown(context);
    }
  }

  Widget _buildIOSDropdown(BuildContext context) {
    return GestureDetector(
      onTap: () => _showIOSPicker(context),
      child: Container(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: CupertinoColors.systemGrey4),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value != null
                  ? items.firstWhere((item) => item.value == value).label
                  : hint ?? 'Select',
              style: TextStyle(
                color: value != null
                    ? CupertinoColors.label
                    : CupertinoColors.placeholderText,
              ),
            ),
            icon ?? const Icon(CupertinoIcons.chevron_down, size: 20),
          ],
        ),
      ),
    );
  }

  void _showIOSPicker(BuildContext context) {
    showCupertinoModalPopup(
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
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoButton(
                    child: const Text('Done'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CupertinoPicker(
                itemExtent: 40,
                scrollController: FixedExtentScrollController(
                  initialItem: value != null
                      ? items.indexWhere((item) => item.value == value)
                      : 0,
                ),
                onSelectedItemChanged: (int index) {
                  onChanged?.call(items[index].value);
                },
                children: items
                    .map((item) => Center(child: Text(item.label)))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMaterialDropdown(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items
          .map(
            (item) => DropdownMenuItem<T>(
              value: item.value,
              child: Text(item.label),
            ),
          )
          .toList(),
      onChanged: onChanged,
      hint: hint != null ? Text(hint!) : null,
      icon: icon,
      dropdownColor: dropdownColor,
      decoration: InputDecoration(
        contentPadding:
            padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

/// Dropdown item model
class AdaptiveDropdownItem<T extends Object> {
  final T value;
  final String label;
  final Widget? icon;

  const AdaptiveDropdownItem({
    required this.value,
    required this.label,
    this.icon,
  });
}

/// Adaptive autocomplete widget
class AdaptiveAutocomplete<T extends Object> extends StatelessWidget {
  final List<T> options;
  final String Function(T) displayStringForOption;
  final void Function(T) onSelected;
  final String? hintText;
  final T? initialValue;

  const AdaptiveAutocomplete({
    Key? key,
    required this.options,
    required this.displayStringForOption,
    required this.onSelected,
    this.hintText,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Autocomplete<T>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return <T>[];
        }
        return options.where((T option) {
          return displayStringForOption(option)
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      displayStringForOption: displayStringForOption,
      onSelected: onSelected,
      initialValue: initialValue != null
          ? TextEditingValue(text: displayStringForOption(initialValue!))
          : null,
      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
        if (PlatformDetector.isIOS) {
          return CupertinoTextField(
            controller: controller,
            focusNode: focusNode,
            placeholder: hintText,
            onSubmitted: (value) => onFieldSubmitted(),
          );
        } else {
          return TextField(
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onSubmitted: (value) => onFieldSubmitted(),
          );
        }
      },
    );
  }
}

/// Multi-select dropdown
class AdaptiveMultiSelect<T extends Object> extends StatefulWidget {
  final List<AdaptiveDropdownItem<T>> items;
  final List<T> selectedValues;
  final ValueChanged<List<T>> onChanged;
  final String? hint;
  final String? title;

  const AdaptiveMultiSelect({
    Key? key,
    required this.items,
    required this.selectedValues,
    required this.onChanged,
    this.hint,
    this.title,
  }) : super(key: key);

  @override
  State<AdaptiveMultiSelect<T>> createState() => _AdaptiveMultiSelectState<T>();
}

class _AdaptiveMultiSelectState<T extends Object>
    extends State<AdaptiveMultiSelect<T>> {
  late List<T> _selectedValues;

  @override
  void initState() {
    super.initState();
    _selectedValues = List.from(widget.selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showMultiSelectDialog(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color: PlatformDetector.isIOS
                ? CupertinoColors.systemGrey4
                : Theme.of(context).dividerColor,
          ),
          borderRadius: BorderRadius.circular(
            PlatformDetector.isIOS ? 8 : 12,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                _selectedValues.isEmpty
                    ? (widget.hint ?? 'Select items')
                    : '${_selectedValues.length} selected',
                style: TextStyle(
                  color: _selectedValues.isEmpty
                      ? (PlatformDetector.isIOS
                          ? CupertinoColors.placeholderText
                          : Theme.of(context).hintColor)
                      : null,
                ),
              ),
            ),
            Icon(
              PlatformDetector.isIOS
                  ? CupertinoIcons.chevron_down
                  : Icons.arrow_drop_down,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _showMultiSelectDialog(BuildContext context) {
    if (PlatformDetector.isIOS) {
      _showIOSMultiSelect(context);
    } else {
      _showMaterialMultiSelect(context);
    }
  }

  void _showIOSMultiSelect(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
        height: 400,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: Column(
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: CupertinoColors.systemGrey4.resolveFrom(context),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: const Text('Cancel'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  if (widget.title != null)
                    Text(
                      widget.title!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  CupertinoButton(
                    child: const Text('Done'),
                    onPressed: () {
                      widget.onChanged(_selectedValues);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  final item = widget.items[index];
                  final isSelected = _selectedValues.contains(item.value);
                  return CupertinoListTile(
                    title: Text(item.label),
                    trailing: isSelected
                        ? const Icon(
                            CupertinoIcons.checkmark_alt,
                            color: CupertinoColors.activeBlue,
                          )
                        : null,
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          _selectedValues.remove(item.value);
                        } else {
                          _selectedValues.add(item.value);
                        }
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMaterialMultiSelect(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title ?? 'Select items',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextButton(
                  onPressed: () {
                    widget.onChanged(_selectedValues);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Done'),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];
                final isSelected = _selectedValues.contains(item.value);
                return CheckboxListTile(
                  title: Text(item.label),
                  value: isSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        _selectedValues.add(item.value);
                      } else {
                        _selectedValues.remove(item.value);
                      }
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
