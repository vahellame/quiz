import 'dart:convert';

import 'package:quiz/quiz/models/models.dart';
import 'package:http/http.dart' as http;

class QuestionsAPI {
  static const String _baseUrl = 'quizapi.io';

  final http.Client _httpClient = http.Client();

  Future<List<QuestionModel>> getQuestions({required QuizCategory category, required QuizDifficulty difficulty}) async {
    final url = Uri.https(
      _baseUrl,
      '/api/v1/questions',
      {
        'limit': 10.toString(),
        'category': category.toString(),
        'difficulty': difficulty.toString(),
        'apiKey': 'IExdWroYhiZgWCoz2XCbjqP5CpUpuQ1nOPsJnwQu', // Not good, but it test project
      },
    );
    final http.Response response = await _httpClient.get(
      url,
    );
    final dataRaw = jsonDecode(response.body);
    final List<QuestionModel> questions = [];
    for (Map questionRaw in dataRaw) {
      final List<AnswerModel> answers = [];
      final Map answersRaw = questionRaw['answers'];
      for (String answerKey in answersRaw.keys) {
        if (answersRaw[answerKey] != null) {
          answers.add(
            AnswerModel(
              key: answerKey.split('_')[1],
              answer: answersRaw[answerKey],
              isAnswered: false,
            ),
          );
        }
      }

      final List<String> correctAnswersKeys = [];
      final Map correctAnswersRaw = questionRaw['correct_answers'];
      for (String correctAnswerKey in correctAnswersRaw.keys) {
        if (correctAnswersRaw[correctAnswerKey] == 'true') {
          correctAnswersKeys.add(correctAnswerKey.split('_')[1]);
        }
      }
      questions.add(
        QuestionModel(
          id: questionRaw['id'],
          title: questionRaw['question'],
          answers: answers,
          correctAnswersKeys: correctAnswersKeys,
        ),
      );
    }

    return questions;
  }
}
