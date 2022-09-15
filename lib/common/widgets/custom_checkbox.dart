import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.tristate,
  }) : super(key: key);

  final bool? value;
  final void Function(bool? value) onChanged;
  final bool tristate;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: Colors.black,
      ),
      child: Checkbox(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.black,
        tristate: tristate,
      ),
    );
  }
}
