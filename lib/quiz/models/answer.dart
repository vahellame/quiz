import 'package:equatable/equatable.dart';

class AnswerModel extends Equatable {
  final String key;
  final String answer;
  final bool isAnswered;

  const AnswerModel({required this.key, required this.answer, required this.isAnswered});

  AnswerModel copyWith({
    bool? isAnswered,
  }) {
    return AnswerModel(
      key: key,
      answer: answer,
      isAnswered: isAnswered ?? this.isAnswered,
    );
  }

  @override
  List<Object?> get props => [key, answer, isAnswered];
}
