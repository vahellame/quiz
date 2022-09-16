// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(text) => "${Intl.select(text, {
            'next': 'Next',
            'finishQuiz': 'finishQuiz',
            'other': 'ERROR',
          })}";

  static String m1(number) => "Question ${number}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "_locale": MessageLookupByLibrary.simpleMessage("en"),
        "bad_state_label": MessageLookupByLibrary.simpleMessage("Bad state"),
        "category_dropdown_label":
            MessageLookupByLibrary.simpleMessage("Select category"),
        "category_title_label":
            MessageLookupByLibrary.simpleMessage("Category"),
        "difficulty_dropdown_label":
            MessageLookupByLibrary.simpleMessage("Select difficulty"),
        "difficulty_label": MessageLookupByLibrary.simpleMessage("Difficulty"),
        "error_state_label":
            MessageLookupByLibrary.simpleMessage("Error state"),
        "questions_button_text": m0,
        "questions_tab_text": m1,
        "questions_title": MessageLookupByLibrary.simpleMessage("Questions"),
        "start_button_text": MessageLookupByLibrary.simpleMessage("Start"),
        "start_title": MessageLookupByLibrary.simpleMessage("Start")
      };
}
