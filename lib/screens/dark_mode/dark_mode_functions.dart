import 'package:flutter/material.dart';
import 'package:flutter_tests_ui/managers/app_theme_manager.dart';
import 'package:provider/provider.dart';

mixin DarkModeFunctions{
  void onLightTap(BuildContext context){
    context.read<AppThemeManager>().updateThemeData(AppTheme.lightMode);
  }

  void onDarkTap(BuildContext context){
    context.read<AppThemeManager>().updateThemeData(AppTheme.darkMode);
  }
}