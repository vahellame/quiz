import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/common/l10n/generated/l10n.dart';
import 'package:quiz/common/theme.dart';
import 'package:quiz/common/widgets/bad_state.dart';
import 'package:quiz/common/widgets/custom_button.dart';
import 'package:quiz/quiz/bloc/quiz_bloc.dart';
import 'package:quiz/quiz/route.dart';
import 'package:quiz/quiz/screens/questions/widgets/question_view.dart';
import 'package:vrouter/vrouter.dart';

enum QuestionsButtonText {
  next,
  finishQuiz;

  @override
  String toString() => name;
}

class Questions extends StatefulWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  late QuestionsButtonText _buttonText;

  @override
  void initState() {
    final state = context.read<QuizBloc>().state;
    if (state is QuizPassing) {
      _tabController = TabController(length: state.questions.length, vsync: this);
      if (state.questions.length == 1) {
        _buttonText = QuestionsButtonText.finishQuiz;
      } else {
        _buttonText = QuestionsButtonText.next;
      }
      _tabController.addListener(
        () {
          setState(
            () {
              _buttonText = _tabController.index != _tabController.length - 1 ? QuestionsButtonText.next : QuestionsButtonText.finishQuiz;
            },
          );
        },
      );
    } else {
      throw Error();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is QuizPassing) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16),
                child: Text(
                  S.current.questions_title,
                  style: TextStyle(
                    color: Theme.of(context).firstColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                tabs: [
                  for (int i = 0; i < state.questions.length; i++)
                    Tab(
                      height: 32,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).firstColor, width: 1),
                          borderRadius: const BorderRadius.all(Radius.circular(32)),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(S.current.questions_tab_text(i + 1)),
                          ),
                        ),
                      ),
                    ),
                ],
                indicator: BoxDecoration(
                  border: Border.all(color: Theme.of(context).firstColor, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(32)),
                  color: Theme.of(context).firstColor,
                ),
                indicatorWeight: 0.0,
                indicatorColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Theme.of(context).secondColor,
                unselectedLabelColor: Theme.of(context).firstColor,
                automaticIndicatorColorAdjustment: true,
                isScrollable: true,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                indicatorPadding: EdgeInsets.zero,
                labelStyle: const TextStyle().copyWith(color: Theme.of(context).firstColor),
                unselectedLabelStyle: const TextStyle().copyWith(color: Theme.of(context).firstColor),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    for (int i = 0; i < state.questions.length; i++)
                      QuestionView(
                        questionIndex: i,
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomButton(
                  text: _buttonText.toString(),
                  onPressed: _onButtonPressed,
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

  void _onButtonPressed() {
    switch (_buttonText) {
      case QuestionsButtonText.next:
        _tabController.animateTo(_tabController.index + 1);
        break;
      case QuestionsButtonText.finishQuiz:
        context.read<QuizBloc>().add(QuizFinished());
        context.vRouter.to(QuizRoute.result, isReplacement: true);
        break;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
