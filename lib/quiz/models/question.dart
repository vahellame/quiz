import 'package:equatable/equatable.dart';
import 'package:quiz/quiz/models/answer.dart';

class Question extends Equatable {
  final int id;
  final String title;
  final List<Answer> answers;
  final List<int> correctAnswersIds;

  const Question({required this.id, required this.title, required this.answers, required this.correctAnswersIds});

  @override
  List<Object?> get props => [id];
}
