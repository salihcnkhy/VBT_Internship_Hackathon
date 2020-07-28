import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:vbt_hackathon/Core/EnvironmentObjects/EnvironmentObj.dart';
import 'package:vbt_hackathon/Core/app/base/base_view_model.dart';
import 'package:vbt_hackathon/Models/User.dart';
import 'package:vbt_hackathon/core/Firebase/Firebase.dart';
import 'package:vbt_hackathon/ui/Views/Home/home_page/home_page.dart';

part 'login_page_view_model.g.dart';

class LoginPageViewModel = _LoginPageViewModelBase with _$LoginPageViewModel;

abstract class _LoginPageViewModelBase
    with Store, BaseViewModel, FirebaseAuthProcess {
  TextEditingController email;
  TextEditingController password;
  Future<FirebaseUser> myFuture;

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  init() {
    email = TextEditingController();
    password = TextEditingController();
  }

  void loginButtonPressed() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    myFuture = login(email.text, password.text);
  }

  void pushHomePage(data) {
    EnvironmentObjects().user = new User(uuid: data.uid);
    pushNewScreen(context, screen: HomePage());
  }

  void pushRegisterPage() {}
}
