import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const Quiz());
}