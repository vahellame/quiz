import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz/common/theme.dart';
import 'package:quiz/generated/l10n.dart';
import 'package:quiz/quiz/bloc/quiz_bloc.dart';
import 'package:quiz/quiz/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vrouter/vrouter.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => QuizBloc(GetIt.I.get()),
      child: VRouter(
        theme: ThemeData(
          unselectedWidgetColor: Theme.of(context).firstColor,
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Theme.of(context).firstColor),
        ),
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        initialUrl: QuizRoute.start,
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
      ),
    );
  }
}
