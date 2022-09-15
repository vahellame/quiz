import 'package:equatable/equatable.dart';

enum QuizCategory {
  linux('Linux'),
  devops('DevOps'),
  networking('Networking'),
  cloud('Networking'),
  docker('Docker'),
  kubernetes('Kubernetes');

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

class Result extends Equatable {
  final DateTime dateCreated;
  final QuizCategory category;
  final QuizDifficulty difficulty;
  final int answersCorrect;
  final int answersIncorrect;

  const Result(
    this.dateCreated,
    this.category,
    this.difficulty,
    this.answersCorrect,
    this.answersIncorrect,
  );

  @override
  List<Object?> get props => [];

  Map<String, dynamic> toJson() => {
        'dateCreated': dateCreated.toIso8601String(),
        'category': category,
        'difficulty': difficulty,
        'answersCorrect': answersCorrect,
        'answersIncorrect': answersIncorrect,
      };
}
