import 'package:flutter/material.dart';
import 'package:quiz/common/theme.dart';

class CustomScreen extends StatelessWidget {
  const CustomScreen({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: child,
        ),
      ),
      backgroundColor: Theme.of(context).secondColor,
    );
  }
}
