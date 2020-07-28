import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import 'color_scheme.dart';

class AppTheme {
  static AppTheme _instance;
  static AppTheme get instance {
    if (_instance == null) _instance = AppTheme._init();
    return _instance;
  }

  AppTheme._init();

  final TextTheme textTheme = ThemeData().textTheme.apply(fontFamily: AppConstants.fontQuicksand);

  ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: AppColorScheme.light_khaki,
      primaryColor: AppColorScheme.orangish,
      fontFamily: AppConstants.fontQuicksand,
      indicatorColor: AppColorScheme.orangish,
      accentColor: AppColorScheme.light_khaki,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: AppColorScheme.denimOpacity50, fontWeight: FontWeight.bold),
        hintStyle: TextStyle(color: AppColorScheme.denimOpacity50, fontWeight: FontWeight.bold),
      ),
      colorScheme: ColorScheme.light(
        background: AppColorScheme.light_khaki,
        primary: AppColorScheme.orangish,
        secondary: AppColorScheme.denim,
        surface: AppColorScheme.github_black_color,
      ),
      textTheme: TextTheme(
        headline2: TextStyle(color: AppColorScheme.orangish, fontWeight: FontWeight.bold),
        headline5: TextStyle(color: AppColorScheme.denim, fontWeight: FontWeight.w700),
        headline6: TextStyle(color: AppColorScheme.denim, fontWeight: FontWeight.w700),
        subtitle1: TextStyle(color: AppColorScheme.denim, fontWeight: FontWeight.w500),
        button: TextStyle(color: AppColorScheme.denim, fontWeight: FontWeight.bold),
      ),
    );
  }
}
