import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:tuple/tuple.dart';
import 'package:vbt_hackathon/Helper/Views/future_builder_helper.dart';
import 'package:vbt_hackathon/Helper/Views/progress_bar.dart';
import 'package:vbt_hackathon/Views/home_page/home_page.dart';
import './login_page_view_model.dart';

class LoginPageView extends LoginPageViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          buildTextFields(),
          if (myFuture != null)
            FutureHelper(
              future: myFuture,
              hasDataWidget: HomePage(),
              hasErrorWidget: Text("Error"),
              progressWidget: DefaultProgressBar(
                blur: const Tuple2<double, double>(2, 2),
                color: Colors.black.withOpacity(0.2),
                scaleFactor: 0.25,
              ),
            ),
        ],
      )),
    );
  }

  Padding buildTextFields() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: email,
            decoration: InputDecoration(hintText: "E-mail"),
          ),
          TextFormField(
            obscureText: true,
            controller: password,
            decoration: InputDecoration(hintText: "Password"),
          ),
          FlatButton(onPressed: loginButtonPressed, child: Text("Login")),
          FlatButton(
              onPressed: pushRegisterPage, child: Text("Go Register Page"))
        ],
      ),
    );
  }
}
