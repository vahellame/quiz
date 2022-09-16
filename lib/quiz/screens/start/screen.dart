import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/common/theme.dart';
import 'package:quiz/common/widgets/custom_button.dart';
import 'package:quiz/common/widgets/custom_dropdown.dart';
import 'package:quiz/common/widgets/custom_screen.dart';
import 'package:quiz/quiz/bloc/quiz_bloc.dart';
import 'package:quiz/quiz/models/models.dart';
import 'package:quiz/quiz/route.dart';
import 'package:vrouter/vrouter.dart';


class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: Text(
              'Start',
              style: TextStyle(
                color: Theme.of(context).firstColor,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Text(
              'Category',
              style: const TextStyle().copyWith(color: Theme.of(context).firstColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: BlocBuilder<QuizBloc, QuizState>(
              builder: (context, state) {
                if (state is QuizStarting) {
                  return CustomDropdown(
                    initialValue: null,
                    value: state.category,
                    hint: 'Select category',
                    items: QuizCategory.values,
                    onChanged: (value) {
                      if (value != null) {
                        context.read<QuizBloc>().add(QuizChangedCategory(category: value));
                      }
                    },
                    labelText: 'Select category',
                  );
                } else {
                  return const Text('Something went wrong');
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Text(
              'Difficulty',
              style: const TextStyle().copyWith(color: Theme.of(context).firstColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: BlocBuilder<QuizBloc, QuizState>(
              builder: (context, state) {
                if (state is QuizStarting) {
                  return CustomDropdown(
                    initialValue: null,
                    value: state.difficulty,
                    hint: 'Select difficulty',
                    items: QuizDifficulty.values,
                    onChanged: (value) {
                      if (value != null) {
                        context.read<QuizBloc>().add(QuizChangedDifficulty(difficulty: value));
                      }
                    },
                    labelText: 'Select difficulty',
                  );
                } else {
                  return const Text('Something went wrong');
                }
              },
            ),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<QuizBloc, QuizState>(
              builder: (context, state) {
                if (state is QuizStarting) {
                  return Opacity(
                    opacity: state.category != null && state.difficulty != null ? 1 : 0.5,
                    child: CustomButton(
                      text: 'Start',
                      onPressed: _onButtonNextPressed,
                    ),
                  );
                } else {
                  return const Text('Something went wrong');
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onButtonNextPressed() {
    final state = context.read<QuizBloc>().state;

    if (state is QuizStarting) {
      if (state.category != null && state.difficulty != null) {
        context.read<QuizBloc>().add(QuizStarted());
        context.vRouter.to(QuizRoute.questions, isReplacement: true);
      }
    }
  }
}
