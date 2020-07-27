import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Duration get onboardingDuration => Duration(milliseconds: 500);
}
