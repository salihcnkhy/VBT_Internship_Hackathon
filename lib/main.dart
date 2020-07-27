import 'package:flutter/material.dart';

import 'core/app/theme/app_theme.dart';
import 'ui/Views/auth/onboarding_page/view/onboarding_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingView(),
      theme: AppTheme.instance.theme,
      debugShowCheckedModeBanner: false,
    );
  }
}
