import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furniture_app/core/constants/enums/app_theme_enum.dart';
import 'package:furniture_app/core/init/theme/light_theme.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData? _currentTheme;
  ThemeData? get currentTheme {
    _currentTheme = LightTheme.instance.themeData;

    return _currentTheme;
  }

  void changeTheme(EnumAppThemes theme) {
    if (theme == EnumAppThemes.LIGHT) {
      _currentTheme = LightTheme.instance.themeData;
    } else {
      //_currentTheme = AppThemeDark.instance!.theme;
    }
    notifyListeners();
  }
}
