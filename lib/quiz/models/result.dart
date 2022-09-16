import 'package:equatable/equatable.dart';

enum QuizCategory {
  linux('Linux'),
  bash('BASH'),
  php('PHP'),
  docker('Docker'),
  html('HTML'),
  mySql('MySQL'),
  wordPress('WordPress'),
  laravel('Laravel'),
  kubernetes('Kubernetes'),
  javaScript('JavaScript'),
  devOps('DevOps');

  final String value;

  const QuizCategory(this.value);

  @override
  String toString() => value;
}

enum QuizDifficulty {
  easy('Easy'),
  medium('Medium'),
  hard('Hard');

  final String value;

  const QuizDifficulty(this.value);

  @override
  String toString() => value;
}

class ResultModel extends Equatable {
  final DateTime dateCreated;
  final QuizCategory category;
  final QuizDifficulty difficulty;
  final int answersCorrect;
  final int answersIncorrect;
  final int questionsTotal;
  final int questionsCorrect;

  const ResultModel({
    required this.dateCreated,
    required this.category,
    required this.difficulty,
    required this.answersCorrect,
    required this.answersIncorrect,
    required this.questionsTotal,
    required this.questionsCorrect,
  });

  @override
  List<Object?> get props => [
        dateCreated,
        category,
        difficulty,
        answersCorrect,
        answersIncorrect,
        questionsTotal,
        questionsCorrect,
      ];

  Map<String, dynamic> toJson() => {
        'date_created': dateCreated.toIso8601String(),
        'category': category.toString(),
        'difficulty': difficulty.toString(),
        'answers_correct': answersCorrect,
        'answers_incorrect': answersIncorrect,
        'questions_total': questionsTotal,
        'questions_correct': questionsCorrect,
      };
}
