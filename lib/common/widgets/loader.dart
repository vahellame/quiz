import 'package:flutter/material.dart';
import 'package:quiz/common/theme.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(color: Theme.of(context).firstColor),
      ],
    );
  }
}
