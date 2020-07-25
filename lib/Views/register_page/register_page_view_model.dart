import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vbt_hackathon/Core/Firebase/Firebase.dart';
import 'package:vbt_hackathon/Views/login_page/login_page.dart';
import './register_page.dart';

abstract class RegisterPageViewModel extends State<RegisterPage>
    with FirebaseAuthProcess {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Future<FirebaseUser> myFuture;

  void registerButtonPressed() {
    setState(() {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      myFuture = register(email.text, password.text);
    });
  }

  void pushLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
