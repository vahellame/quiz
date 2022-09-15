part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object?> get props => [];
}

class QuizLoading extends QuizState {}

class QuizStarting extends QuizState {
  const QuizStarting({
    required this.category,
    required this.difficulty,
  });

  final QuizCategory? category;
  final QuizDifficulty? difficulty;

  QuizStarting copyWith({
    QuizCategory? category,
    QuizDifficulty? difficulty,
  }) {
    return QuizStarting(
      category: category ?? this.category,
      difficulty: difficulty ?? this.difficulty,
    );
  }

  @override
  List<Object?> get props => [category, difficulty];
}

class QuizPassing extends QuizState {
  const QuizPassing({required this.category, required this.difficulty, required this.questions, required this.result});

  final QuizCategory category;
  final QuizDifficulty difficulty;
  final List<Question> questions;
  final Result result;

  QuizPassing copyWith({
    List<Question>? questions,
    Result? result,
  }) {
    return QuizPassing(
      category: category,
      difficulty: difficulty,
      questions: questions ?? this.questions,
      result: result ?? this.result,
    );
  }

  @override
  List<Object> get props => [questions, result];
}

class QuizEnded extends QuizState {
  final Result result;

  const QuizEnded(this.result);

  @override
  List<Object> get props => [result];
}

class QuizError extends QuizState {
  @override
  List<Object> get props => [];
}
