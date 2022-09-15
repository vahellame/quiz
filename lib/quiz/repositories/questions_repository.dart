import 'package:quiz/quiz/data/firebase_api.dart';
import 'package:quiz/quiz/data/questions_api.dart';
import 'package:quiz/quiz/models/models.dart';

class QuestionsRepository {
  QuestionsRepository(this._questionsAPI, this._firebaseAPI);

  final QuestionsAPI _questionsAPI;
  final FirebaseAPI _firebaseAPI;

  Future<List<Question>> getQuestions({required QuizCategory category, required QuizDifficulty difficulty}) => _questionsAPI.getQuestions(category: category, difficulty: difficulty);
  Future<void> saveResult(Result result) => _firebaseAPI.saveResult(result);
}
