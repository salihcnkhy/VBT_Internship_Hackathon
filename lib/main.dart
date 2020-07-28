import 'package:flutter/material.dart';
import 'package:vbt_hackathon/ui/Views/home/learn_page.dart';
import 'package:vbt_hackathon/ui/Views/home/learn_page_view.dart';

import 'core/app/theme/app_theme.dart';
import 'ui/Views/auth/onboarding_page/view/onboarding_view.dart';
import 'ui/Views/home/learn_page_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LearnPage(),
      theme: AppTheme.instance.theme,
      debugShowCheckedModeBanner: false,
    );
  }
}
