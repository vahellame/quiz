import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz/app/app.dart';
import 'package:quiz/app/app_bloc_observer.dart';
import 'package:quiz/quiz/data/firebase_api.dart';
import 'package:quiz/quiz/data/firebase_options.dart';
import 'package:quiz/quiz/data/questions_api.dart';
import 'package:quiz/quiz/repositories/questions_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  _initData();
  runApp(const QuizApp());
}

void _initData() {
  GetIt.I.registerSingleton(FirebaseAPI());
  GetIt.I.registerSingleton(QuestionsAPI());
  GetIt.I.registerSingleton(QuestionsRepository(GetIt.I.get(), GetIt.I.get()));
}
