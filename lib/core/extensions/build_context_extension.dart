import 'package:flutter/material.dart';
import 'package:vbt_hackathon/core/app/theme/color_scheme.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Duration get onboardingDuration => Duration(milliseconds: 500);


  LinearGradient get baseGradient {
    return LinearGradient(
      begin: Alignment(0, 0),
      end: Alignment(1, 1),
      colors: [AppColorScheme.light_gold, AppColorScheme.orangish],
    );
  }
}
