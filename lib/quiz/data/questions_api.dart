import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz/quiz/models/models.dart';

class QuestionsAPI {
  static const String _baseUrl = 'quizapi.io';

  final http.Client _httpClient = http.Client();

  Future<List<Question>> getQuestions({required QuizCategory category, required QuizDifficulty difficulty}) async {
    final request = Uri.https(
      _baseUrl,
      '/api/location/search',
      {
        'limit': 10,
        'category': category,
        'difficulty': difficulty,
        'apiKey': 'IExdWroYhiZgWCoz2XCbjqP5CpUpuQ1nOPsJnwQu', // Not good, but it test project
      },
    );
    final response = await _httpClient.get(request);
    final List<Map> dataRaw = jsonDecode(response.body);
    final List<Question> questions = [];
    for (Map questionRaw in dataRaw) {
      final List<Answer> answers = [];
      final List<int> correctAnswersIds = [];
      questions.add(
        Question(
          id: questionRaw['id'],
          title: questionRaw['question'],
          answers: answers,
          correctAnswersIds: correctAnswersIds,
        ),
      );
    }

    return questions;
  }
}
