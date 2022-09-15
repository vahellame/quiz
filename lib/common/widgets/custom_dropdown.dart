import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatefulWidget {
  const CustomDropdown({
    Key? key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.hint,
    this.errorText,
    this.initialValue,
    this.labelText,
  }) : super(key: key);

  final String? hint;
  final List<T> items;
  final T? value;
  final void Function(T? value) onChanged;
  final String? errorText;
  final T? initialValue;
  final String? labelText;
  @override
  State<CustomDropdown> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  late double _height;
  late Color _borderColor;

  @override
  void initState() {
    _height = 40;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.errorText == null) {
      _borderColor = Colors.black;
      _height = 40;
    } else {
      _height = 62;
      _borderColor = Colors.red;
    }
    return SizedBox(
      height: _height,
      child: DropdownButtonFormField<T>(
          focusColor: Colors.transparent,
          elevation: 0,
          icon: Padding(
            padding: const EdgeInsets.only(top: 1, right: 14),
            child: Icon(
              Icons.arrow_drop_down,
              size: 24,
              color: widget.errorText == null ? Colors.black : Colors.red,
            ),
          ),
          hint: widget.hint != null
              ? Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2, left: 0),
                      child: Text(
                        widget.hint!,
                      ),
                    ),
                  ],
                )
              : null,
          decoration: InputDecoration(
            labelText: widget.value != null ? widget.labelText : null,
            errorStyle: const TextStyle().copyWith(color: Colors.red),
            errorText: widget.errorText,
            contentPadding: const EdgeInsets.only(left: 14),
            labelStyle: const TextStyle(
              leadingDistribution: TextLeadingDistribution.even,
              color: Colors.black,
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: _borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: _borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: _borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: _borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: _borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: _borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
          ),
          value: widget.value,
          items: widget.items.map(
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
          onChanged: widget.onChanged),
    );
  }
}
