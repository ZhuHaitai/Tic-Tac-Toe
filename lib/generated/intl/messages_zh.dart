// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
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
  String get localeName => 'zh';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alarm1": MessageLookupByLibrary.simpleMessage("警告"),
        "alarm2": MessageLookupByLibrary.simpleMessage("身高/體重不得為空!"),
        "button1": MessageLookupByLibrary.simpleMessage("計算"),
        "error_text": MessageLookupByLibrary.simpleMessage("不得為空"),
        "height1": MessageLookupByLibrary.simpleMessage("請輸入身高"),
        "result1": MessageLookupByLibrary.simpleMessage("您的BMI值="),
        "status00": MessageLookupByLibrary.simpleMessage("您的狀態為："),
        "status01": MessageLookupByLibrary.simpleMessage("過輕"),
        "status02": MessageLookupByLibrary.simpleMessage("正常"),
        "status03": MessageLookupByLibrary.simpleMessage("過重"),
        "title": MessageLookupByLibrary.simpleMessage("BMI計算機"),
        "weight1": MessageLookupByLibrary.simpleMessage("請輸入體重")
      };
}
