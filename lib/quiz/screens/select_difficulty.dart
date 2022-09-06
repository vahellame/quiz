import 'package:flutter/material.dart';
import 'package:quiz/generated/l10n.dart';

class SelectDifficultyScreen extends StatelessWidget {
  const SelectDifficultyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.current.hello),
            ],
          ),
        ),
      ),
    );
  }
}
