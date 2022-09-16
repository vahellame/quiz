part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object?> get props => [];
}

class QuizError extends QuizState {
  @override
  List<Object> get props => [];
}

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

class QuizLoadingQuestions extends QuizState {
  const QuizLoadingQuestions({
    required this.category,
    required this.difficulty,
  });

  final QuizCategory category;
  final QuizDifficulty difficulty;
}

class QuizPassing extends QuizState {
  const QuizPassing({
    required this.category,
    required this.difficulty,
    required this.questions,
  });

  final QuizCategory category;
  final QuizDifficulty difficulty;
  final List<QuestionModel> questions;

  QuizPassing copyWith({
    List<QuestionModel>? questions,
  }) {
    return QuizPassing(
      category: category,
      difficulty: difficulty,
      questions: questions ?? this.questions,
    );
  }

  @override
  List<Object> get props => [questions];
}

class QuizFinishing extends QuizState {
  final ResultModel result;

  const QuizFinishing({required this.result});

  @override
  List<Object> get props => [result];
}

class QuizSavingResult extends QuizState {
  final ResultModel result;

  const QuizSavingResult({required this.result});

  @override
  List<Object> get props => [result];
}