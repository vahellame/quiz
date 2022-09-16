// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `en`
  String get _locale {
    return Intl.message(
      'en',
      name: '_locale',
      desc: '',
      args: [],
    );
  }

  /// `Bad state`
  String get bad_state_label {
    return Intl.message(
      'Bad state',
      name: 'bad_state_label',
      desc: '',
      args: [],
    );
  }

  /// `Error state`
  String get error_state_label {
    return Intl.message(
      'Error state',
      name: 'error_state_label',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start_title {
    return Intl.message(
      'Start',
      name: 'start_title',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category_title_label {
    return Intl.message(
      'Category',
      name: 'category_title_label',
      desc: '',
      args: [],
    );
  }

  /// `Select category`
  String get category_dropdown_label {
    return Intl.message(
      'Select category',
      name: 'category_dropdown_label',
      desc: '',
      args: [],
    );
  }

  /// `Difficulty`
  String get difficulty_label {
    return Intl.message(
      'Difficulty',
      name: 'difficulty_label',
      desc: '',
      args: [],
    );
  }

  /// `Select difficulty`
  String get difficulty_dropdown_label {
    return Intl.message(
      'Select difficulty',
      name: 'difficulty_dropdown_label',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start_button_text {
    return Intl.message(
      'Start',
      name: 'start_button_text',
      desc: '',
      args: [],
    );
  }

  /// `Questions`
  String get questions_title {
    return Intl.message(
      'Questions',
      name: 'questions_title',
      desc: '',
      args: [],
    );
  }

  /// `Question {number}`
  String questions_tab_text(Object number) {
    return Intl.message(
      'Question $number',
      name: 'questions_tab_text',
      desc: '',
      args: [number],
    );
  }

  /// `{text, select, next{Next} finishQuiz{finishQuiz} other{ERROR}}`
  String questions_button_text(Object text) {
    return Intl.select(
      text,
      {
        'next': 'Next',
        'finishQuiz': 'finishQuiz',
        'other': 'ERROR',
      },
      name: 'questions_button_text',
      desc: '',
      args: [text],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
