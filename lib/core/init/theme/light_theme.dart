import 'package:flutter/material.dart';
import 'package:furniture_app/core/constants/app/app_constants.dart';

import 'ITheme.dart';

class LightTheme extends ITheme {
  static LightTheme? _instance;
  static LightTheme get instance {
    _instance ??= LightTheme._init();
    return _instance!;
  }

  LightTheme._init();

  final ThemeData _lightTheme = ThemeData.light();
  @override
  ThemeData? get themeData => ThemeData(
        iconTheme: IconThemeData(color: Colors.black),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        fontFamily: ApplicationConstants.NUNITO_FONT,
        backgroundColor: Color(0xFFF2F2F5),
        accentColor: Color(0xFF464A7C),
        scaffoldBackgroundColor: Color(0xFFF2F2F5),
        highlightColor: Color(0xFFFFFFFF),
        cardColor: Colors.white,
        shadowColor: Color(0xFFE1E1E2),
        splashColor: Color(0xFFF8F8F8),
        hoverColor: Colors.black,
        canvasColor: Colors.grey.shade700,
        dialogBackgroundColor: Colors.yellow.shade700,
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xFF464A7C)),
        )),
        textTheme: _lightTheme.textTheme.copyWith(
          bodyText1: TextStyle(fontWeight: FontWeight.bold),
          headline4: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          headline1: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
          headline2: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w800),
          headline6: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
        ),
      );
}
