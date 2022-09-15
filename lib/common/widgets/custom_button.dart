import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: Colors.black,
      ),
      onPressed: onPressed,
      child: SizedBox(
        height: 44,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              text,
              style: const TextStyle().copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
