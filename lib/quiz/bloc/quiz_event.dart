part of 'quiz_bloc.dart';

@immutable
abstract class QuizEvent extends Equatable {
  const QuizEvent();
}

class QuizAnswered extends QuizEvent {
  final int questionId;
  final int answerId;

  const QuizAnswered(this.questionId, this.answerId);

  @override
  List<Object?> get props => [questionId, answerId];
}

class QuizChangedCategory extends QuizEvent {
  final QuizCategory category;

  const QuizChangedCategory(this.category);

  @override
  List<Object?> get props => [category];
}

class QuizChangedDifficulty extends QuizEvent {
  final QuizDifficulty difficulty;

  const QuizChangedDifficulty(this.difficulty);

  @override
  List<Object?> get props => [difficulty];
}
