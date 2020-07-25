import 'package:flutter/material.dart';
import 'Views/login_page/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby Names',
      home: LoginPage(),
    );
  }
}
