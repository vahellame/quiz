import 'package:flutter/cupertino.dart';
import 'package:quiz/common/l10n/generated/l10n.dart';

class BadState extends StatelessWidget {
  const BadState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(S.current.bad_state_label),
    );
  }
}
