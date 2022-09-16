import 'package:equatable/equatable.dart';
import 'package:quiz/quiz/models/answer.dart';

class QuestionModel extends Equatable {
  final int id;
  final String title;
  final List<AnswerModel> answers;
  final List<String> correctAnswersKeys;

  const QuestionModel({required this.id, required this.title, required this.answers, required this.correctAnswersKeys});

  @override
  List<Object?> get props => [id, title, answers, correctAnswersKeys];
}
