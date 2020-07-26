import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './login_page.dart';
import '../../../../Core/Firebase/Firebase.dart';
import '../register_page/register_page.dart';

abstract class LoginPageViewModel extends State<LoginPage> with FirebaseAuthProcess {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Future<FirebaseUser> myFuture;

  void loginButtonPressed() {
    setState(() {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      myFuture = login(email.text, password.text);
    });
  }

  void pushRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }
}
