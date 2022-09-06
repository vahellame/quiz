import 'package:quiz/quiz/screens/select_difficulty.dart';
import 'package:vrouter/vrouter.dart';

class QuizRoute extends VRouteElementBuilder {
  static const selectDifficulty = '/select_difficulty';
  static const questions = '/questions';
  static const result = '/result';

  @override
  List<VRouteElement> buildRoutes() {
    return [
      VWidget(
        path: selectDifficulty,
        widget: const SelectDifficultyScreen(),
      ),
    ];
  }
}
