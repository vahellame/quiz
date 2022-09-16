import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/common/widgets/custom_screen.dart';
import 'package:quiz/common/widgets/loader.dart';
import 'package:quiz/quiz/bloc/quiz_bloc.dart';
import 'package:quiz/quiz/screens/result/widgets/result_view.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      child: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          if (state is QuizSavingResult) {
            return const Loader();
          } else if (state is QuizFinishing) {
            return const ResultView();
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}
