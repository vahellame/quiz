import 'package:flutter/material.dart';
import 'package:quiz/common/theme.dart';

class CustomDropdown<T> extends StatelessWidget {
  const CustomDropdown({
    Key? key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.hint,
    this.initialValue,
    this.labelText,
  }) : super(key: key);

  final String? hint;
  final List<T> items;
  final T? value;
  final void Function(T? value) onChanged;
  final T? initialValue;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: DropdownButtonFormField<T>(
        focusColor: Colors.transparent,
        elevation: 0,
        icon: Padding(
          padding: const EdgeInsets.only(top: 1, right: 14),
          child: Icon(
            Icons.arrow_drop_down,
            size: 24,
            color: Theme.of(context).firstColor,
          ),
        ),
        hint: hint != null
            ? Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2, left: 0),
                    child: Text(
                      hint!,
                    ),
                  ),
                ],
              )
            : null,
        decoration: InputDecoration(
          labelText: value != null ? labelText : null,
          contentPadding: const EdgeInsets.only(left: 14),
          labelStyle: TextStyle(
            leadingDistribution: TextLeadingDistribution.even,
            color: Theme.of(context).firstColor,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Theme.of(context).firstColor),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Theme.of(context).firstColor),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Theme.of(context).firstColor),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Theme.of(context).firstColor),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Theme.of(context).firstColor),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Theme.of(context).firstColor),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
        ),
        value: value,
        items: items.map(
          (T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2, left: 0),
                    child: Text(
                      item.toString(),
                    ),
                  ),
                ],
              ),
            );
          },
        ).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
