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

  /// `BMI Calculator`
  String get title {
    return Intl.message(
      'BMI Calculator',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Please input your height`
  String get height1 {
    return Intl.message(
      'Please input your height',
      name: 'height1',
      desc: '',
      args: [],
    );
  }

  /// `Please input your weight`
  String get weight1 {
    return Intl.message(
      'Please input your weight',
      name: 'weight1',
      desc: '',
      args: [],
    );
  }

  /// `Cannot be empty`
  String get error_text {
    return Intl.message(
      'Cannot be empty',
      name: 'error_text',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get button1 {
    return Intl.message(
      'Confirm',
      name: 'button1',
      desc: '',
      args: [],
    );
  }

  /// `Your BMI=`
  String get result1 {
    return Intl.message(
      'Your BMI=',
      name: 'result1',
      desc: '',
      args: [],
    );
  }

  /// `Your body status is `
  String get status00 {
    return Intl.message(
      'Your body status is ',
      name: 'status00',
      desc: '',
      args: [],
    );
  }

  /// `too light`
  String get status01 {
    return Intl.message(
      'too light',
      name: 'status01',
      desc: '',
      args: [],
    );
  }

  /// `normal`
  String get status02 {
    return Intl.message(
      'normal',
      name: 'status02',
      desc: '',
      args: [],
    );
  }

  /// `too heavy`
  String get status03 {
    return Intl.message(
      'too heavy',
      name: 'status03',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get alarm1 {
    return Intl.message(
      'Warning',
      name: 'alarm1',
      desc: '',
      args: [],
    );
  }

  /// `Height/weight cannot be empty!`
  String get alarm2 {
    return Intl.message(
      'Height/weight cannot be empty!',
      name: 'alarm2',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
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
