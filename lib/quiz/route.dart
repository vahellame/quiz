import 'package:quiz/quiz/screens/questions/screen.dart';
import 'package:quiz/quiz/screens/result/screen.dart';
import 'package:quiz/quiz/screens/start/screen.dart';
import 'package:vrouter/vrouter.dart';

class QuizRoute extends VRouteElementBuilder {
  static const start = '/select_difficulty';
  static const questions = '/questions';
  static const result = '/result';

  @override
  List<VRouteElement> buildRoutes() {
    return [
      VWidget(
        path: start,
        widget: const StartScreen(),
      ),
      VWidget(
        path: questions,
        widget: const QuestionsScreen(),
      ),
      VWidget(
        path: result,
        widget: const ResultScreen(),
      ),
    ];
  }
}
