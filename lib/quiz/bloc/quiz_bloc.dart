import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/quiz/models/models.dart';
import 'package:quiz/quiz/repositories/questions_repository.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final QuestionsRepository _questionsRepository;

  QuizBloc(this._questionsRepository)
      : super(
          const QuizStarting(
            category: null,
            difficulty: null,
          ),
        ) {
    on<QuizChangedCategory>(_onChangeCategory);
    on<QuizChangedDifficulty>(_onChangeDifficulty);
    on<QuizStarted>(_onQuizStarted);
    on<QuizAnswered>(_onQuizAnswered);
    on<QuizFinished>(_onQuizFinished);
    on<QuizRestarted>(_onQuizRestarted);
    on<QuizSavedResult>(_onQuizSavedResult);
  }

  Future<void> _onChangeCategory(QuizChangedCategory event, Emitter<QuizState> emit) async {
    final state = this.state;
    if (state is QuizStarting) {
      emit(state.copyWith(category: event.category));
    } else {
      emit(QuizError());
    }
  }

  Future<void> _onChangeDifficulty(QuizChangedDifficulty event, Emitter<QuizState> emit) async {
    final state = this.state;
    if (state is QuizStarting) {
      emit(state.copyWith(difficulty: event.difficulty));
    } else {
      emit(QuizError());
    }
  }

  Future<void> _onQuizStarted(QuizStarted event, Emitter<QuizState> emit) async {
    final state = this.state;
    if (state is QuizStarting) {
      final QuizCategory category = state.category!;
      final QuizDifficulty difficulty = state.difficulty!;
      emit(QuizLoadingQuestions(category: category, difficulty: difficulty));

      final List<QuestionModel> questions = await _questionsRepository.getQuestions(category: category, difficulty: difficulty);
      emit(QuizPassing(category: category, difficulty: difficulty, questions: questions));
    }
  }

  Future<void> _onQuizAnswered(QuizAnswered event, Emitter<QuizState> emit) async {
    final state = this.state;
    if (state is QuizPassing) {
      final List<QuestionModel> questions = state.questions;

      final int questionIndex = questions.indexWhere(
        (QuestionModel question) {
          if (question.id == event.questionId) {
            return true;
          } else {
            return false;
          }
        },
      );

      final int answerIndex = questions[questionIndex].answers.indexWhere(
        (AnswerModel answer) {
          if (answer.key == event.answerKey) {
            return true;
          } else {
            return false;
          }
        },
      );
      final bool isAnswered = questions[questionIndex].answers[answerIndex].isAnswered;
      questions[questionIndex].answers[answerIndex] = questions[questionIndex].answers[answerIndex].copyWith(isAnswered: !isAnswered);
      emit(state.copyWith(questions: questions));
    }
  }

  Future<void> _onQuizFinished(QuizFinished event, Emitter<QuizState> emit) async {
    final state = this.state;
    if (state is QuizPassing) {
      int answersCorrect = 0;
      int questionsCorrect = 0;
      int answersIncorrect = 0;
      final List<QuestionModel> questions = state.questions;
      for (QuestionModel question in questions) {
        bool isQuestionAnsweredCorrect = true;
        for (AnswerModel answer in question.answers) {
          if (answer.isAnswered) {
            if (question.correctAnswersKeys.contains(answer.key)) {
              answersCorrect = answersCorrect + 1;
            } else {
              answersIncorrect = answersIncorrect + 1;
              isQuestionAnsweredCorrect = false;
            }
          } else {
            if (question.correctAnswersKeys.contains(answer.key)) {
              isQuestionAnsweredCorrect = false;
            }
          }
        }
        if (isQuestionAnsweredCorrect == true) {
          questionsCorrect = questionsCorrect + 1;
        }
      }
      final DateTime now = DateTime.now();
      emit(
        QuizFinishing(
          result: ResultModel(
            dateCreated: now,
            category: state.category,
            difficulty: state.difficulty,
            answersCorrect: answersCorrect,
            answersIncorrect: answersIncorrect,
            questionsTotal: state.questions.length,
            questionsCorrect: questionsCorrect,
          ),
        ),
      );
    }
  }

  Future<void> _onQuizRestarted(QuizRestarted event, Emitter<QuizState> emit) async {
    emit(
      const QuizStarting(
        category: null,
        difficulty: null,
      ),
    );
  }

  Future<void> _onQuizSavedResult(QuizSavedResult event, Emitter<QuizState> emit) async {
    final state = this.state;
    if (state is QuizFinishing) {
      final ResultModel result = state.result;
      emit(QuizSavingResult(result: result));
      await _questionsRepository.saveResult(result);
      emit(QuizFinishing(result: result));
    }
  }
}
