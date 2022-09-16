import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/common/theme.dart';
import 'package:quiz/common/widgets/bad_state.dart';
import 'package:quiz/quiz/bloc/quiz_bloc.dart';
import 'package:quiz/quiz/models/models.dart';

class QuestionView extends StatefulWidget {
  const QuestionView({Key? key, required this.questionIndex}) : super(key: key);

  final int questionIndex;

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is QuizPassing) {
          final QuestionModel question = state.questions[widget.questionIndex];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  question.title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).firstColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: question.answers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12, bottom: 12),
                              child: Text(
                                question.answers[index].answer,
                                style: TextStyle(
                                  color: Theme.of(context).firstColor,
                                ),
                              ),
                            ),
                          ),
                          Checkbox(
                            activeColor: Theme.of(context).firstColor,
                            checkColor: Theme.of(context).secondColor,
                            focusColor: Theme.of(context).firstColor,
                            value: state.questions[widget.questionIndex].answers[index].isAnswered,
                            onChanged: (_) {
                              setState(
                                () {
                                  context.read<QuizBloc>().add(QuizAnswered(questionId: question.id, answerKey: question.answers[index].key));
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Theme.of(context).firstColor,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return const BadState();
        }
      },
    );
  }
}
