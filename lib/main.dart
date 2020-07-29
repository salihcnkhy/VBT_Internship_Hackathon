import 'package:flutter/material.dart';

import 'Core/Firebase/Firebase.dart';
import 'core/app/theme/app_theme.dart';
import 'ui/Views/auth/login_page/view/login_page_view.dart';
import 'ui/Views/auth/onboarding_page/view/onboarding_view.dart';
import 'ui/Views/auth/register_page/register_page.dart';
import 'ui/Views/auth/splash_page/view/splash_view.dart';
import 'ui/Views/settings/settings_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget with FirebaseAuthProcess {
  @override
  Widget build(BuildContext context) {
    print("");
    return MaterialApp(
      theme: AppTheme.instance.theme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashView(),
        '/onboarding': (context) => OnboardingView(),
        '/login': (context) => LoginPageView(),
        '/register': (context) => RegisterPage(),
        '/settings': (context) => SettingsView()
      },
    );
  }
  // FutureHelper(
  //       future: checkUser(),
  //       hasDataWidget: HomePage(),
  //       hasErrorWidget: Text("Error"),
  //       progressWidget: DefaultProgressBar(),
  //     ),
}
