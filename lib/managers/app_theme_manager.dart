import 'package:flutter/material.dart';
import 'package:flutter_tests_ui/commons/commons_export/layout_export.dart';

enum AppTheme{lightMode, darkMode}

class AppThemeManager extends ChangeNotifier{
  AppTheme appTheme = AppTheme.lightMode;
  ThemeData appThemeData = lightTheme;

  void updateThemeData(AppTheme newAppTheme){
    appTheme = newAppTheme;
    appThemeData = _newAppTheme(newAppTheme);
    notifyListeners();
  }

  ThemeData _newAppTheme(AppTheme newTheme){
    switch(newTheme){
      case AppTheme.lightMode:
        return lightTheme;

      case AppTheme.darkMode:
        return darkTheme;

      default:
        return lightTheme;
    }
  }
}