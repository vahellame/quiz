part of 'quiz_bloc.dart';

@immutable
abstract class QuizEvent extends Equatable {
  const QuizEvent();
}

class QuizChangedCategory extends QuizEvent {
  final QuizCategory category;

  const QuizChangedCategory({required this.category});

  @override
  List<Object?> get props => [category];
}

class QuizChangedDifficulty extends QuizEvent {
  final QuizDifficulty difficulty;

  const QuizChangedDifficulty({required this.difficulty});

  @override
  List<Object?> get props => [difficulty];
}

class QuizStarted extends QuizEvent {
  @override
  List<Object?> get props => [];
}

class QuizAnswered extends QuizEvent {
  final int questionId;
  final String answerKey;

  const QuizAnswered({required this.questionId, required this.answerKey});

  @override
  List<Object?> get props => [questionId, answerKey];
}

class QuizFinished extends QuizEvent {
  @override
  List<Object?> get props => [];
}

class QuizRestarted extends QuizEvent {
  @override
  List<Object?> get props => [];
}

class QuizSavedResult extends QuizEvent {
  @override
  List<Object?> get props => [];
}
