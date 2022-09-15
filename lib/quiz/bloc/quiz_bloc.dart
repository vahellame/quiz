import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/quiz/models/models.dart';
import 'package:quiz/quiz/repositories/questions_repository.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final QuestionsRepository _questionsRepository;

  QuizBloc(this._questionsRepository)
      : super(
          const QuizStarting(
            category: null,
            difficulty: null,
          ),
        ) {
    on<QuizChangedCategory>(_onChangeCategory);
    on<QuizChangedDifficulty>(_onChangeDifficulty);
  }

  Future<void> _onChangeCategory(QuizChangedCategory event, Emitter<QuizState> emit) async {
    final state = this.state;
    if (state is QuizStarting) {
      emit(state.copyWith(category: event.category));
    } else {
      emit(QuizError());
    }
  }

  Future<void> _onChangeDifficulty(QuizChangedDifficulty event, Emitter<QuizState> emit) async {
    final state = this.state;
    if (state is QuizStarting) {
      emit(state.copyWith(difficulty: event.difficulty));
    } else {
      emit(QuizError());
    }
  }
}
