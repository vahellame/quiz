import 'package:flutter/cupertino.dart';
import 'package:quiz/common/l10n/generated/l10n.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(S.current.error_state_label),
    );
  }
}
