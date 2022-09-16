import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/common/widgets/bad_state.dart';
import 'package:quiz/common/widgets/custom_screen.dart';
import 'package:quiz/quiz/bloc/quiz_bloc.dart';
import 'package:quiz/common/widgets/loader.dart';
import 'package:quiz/quiz/screens/questions/widgets/questions.dart';


class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      child: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          if (state is QuizLoadingQuestions) {
            return const Loader();
          } else if (state is QuizPassing) {
            return const Questions();
          } else {
            return const BadState();
          }
        },
      ),
    );
  }
}
