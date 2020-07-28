import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vbt_hackathon/Core/Firebase/Firebase.dart';
import 'package:vbt_hackathon/Models/User.dart';
import 'package:vbt_hackathon/ui/Views/auth/login_page/view/login_page_view.dart';
import './register_page.dart';

abstract class RegisterPageViewModel extends State<RegisterPage>
    with FirebaseAuthProcess, FirestoreProcess {
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
      MaterialPageRoute(builder: (context) => LoginPageView()),
    );
  }

  void registerCallBack(FirebaseUser user) {
    var newUser = User(uuid: user.uid);
    addDocument("User", newUser.toJson());
  }
}
