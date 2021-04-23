import 'dart:ui';

import 'package:flutter/material.dart';

class LocalizationManager {
  static LocalizationManager? _instance;
  static LocalizationManager? get instance {
    if (_instance == null) return _instance = LocalizationManager._init();
    return _instance;
  }

  LocalizationManager._init();

  final enLocale = Locale('en', 'US');
  final trLocale = Locale('tr', 'TR');
  List<Locale> get supportedLocales => [enLocale, trLocale];

  String currentLanguageText(Locale deviceLocale) {
    if (deviceLocale == enLocale) {
      return 'English';
    } else if (deviceLocale == trLocale) {
      return 'Türkçe';
    }
    return 'English';
  }
}
