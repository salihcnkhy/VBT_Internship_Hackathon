import 'package:flutter/material.dart';
import 'package:vbt_hackathon/core/app/constants/app_constants.dart';
import 'package:vbt_hackathon/core/app/theme/color_scheme.dart';

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
      fontFamily: AppConstants.fontQuicksand,
      indicatorColor: AppColorScheme.orangish,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: AppColorScheme.denim,
          fontWeight: FontWeight.w700,
        ),
        subtitle1: TextStyle(
          color: AppColorScheme.denim,
          fontWeight: FontWeight.w500,
        ),
        button: TextStyle(
          color: AppColorScheme.denim,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
