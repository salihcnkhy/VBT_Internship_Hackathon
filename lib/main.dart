import 'package:flutter/material.dart';

import 'core/app/theme/app_theme.dart';
import 'ui/Views/auth/login_page/login_page.dart';
import 'ui/Views/auth/onboarding_page/view/onboarding_view.dart';
import 'ui/Views/auth/register_page/register_page.dart';
import 'ui/Views/auth/splash_page/view/splash_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.instance.theme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashView(),
        '/onboarding': (context) => OnboardingView(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
