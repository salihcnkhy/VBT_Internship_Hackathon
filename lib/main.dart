import 'package:flutter/material.dart';
import 'package:vbt_hackathon/ui/Views/auth/login_page/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
