import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quiz/common/theme.dart';
import 'package:quiz/common/widgets/custom_button.dart';
import 'package:quiz/quiz/bloc/quiz_bloc.dart';
import 'package:quiz/quiz/route.dart';
import 'package:vrouter/vrouter.dart';

class ResultView extends StatelessWidget {
  const ResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is QuizFinishing) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16),
                child: Text(
                  'Result',
                  style: TextStyle(
                    color: Theme.of(context).firstColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 8),
                child: Text(
                  'Date and time: ${DateFormat('dd.MM.yyyy HH:mm:ss', 'en_US').format(state.result.dateCreated)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 8),
                child: Text(
                  'Category: ${state.result.category}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 8),
                child: Text(
                  'Difficulty: ${state.result.difficulty}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 8),
                child: Text(
                  'Answers correct: ${state.result.answersCorrect}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 8),
                child: Text(
                  'Answers incorrect: ${state.result.answersIncorrect}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 8),
                child: Text(
                  'Questions correct: ${state.result.questionsCorrect}/${state.result.questionsTotal}' ,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: CustomButton(
                  text: 'Save result',
                  onPressed: () {
                    context.read<QuizBloc>().add(QuizSavedResult());
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomButton(
                  text: 'Restart',
                  onPressed: () {
                    context.read<QuizBloc>().add(QuizRestarted());
                    context.vRouter.to(QuizRoute.start, isReplacement: true);
                  },
                ),
              ),
            ],
          );
        } else {
          return const Text('Something went wrong');
        }
      },
    );
  }
}
