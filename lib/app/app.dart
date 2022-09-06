import 'package:quiz/generated/l10n.dart';
import 'package:quiz/quiz/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vrouter/vrouter.dart';

class Quiz extends StatelessWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VRouter(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      initialUrl: QuizRoute.selectDifficulty,
      mode: VRouterMode.history,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routes: [
        QuizRoute(),
      ],
    );
  }
}
