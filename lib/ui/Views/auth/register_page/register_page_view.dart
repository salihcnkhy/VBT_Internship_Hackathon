import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vbt_hackathon/Helper/Views/future_builder_helper.dart';
import 'package:vbt_hackathon/Helper/Views/progress_bar.dart';
import './register_page_view_model.dart';

class RegisterPageView extends RegisterPageViewModel {
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
              hasDataCallback: registerCallBack,
              hasDataWidget: Text("Success",
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  )),
              hasErrorWidget: Text("Erorr",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  )),
              progressWidget: DefaultProgressBar(),
            ),
        ],
      )),
    );
  }

  Widget buildBackdropFilter() {
    return Container(
      color: Colors.black.withOpacity(0.2),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Center(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.width * 0.3,
              child: CircularProgressIndicator()),
        ),
      ),
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
          FlatButton(onPressed: registerButtonPressed, child: Text("Register")),
          FlatButton(onPressed: pushLoginPage, child: Text("Go Login Page"))
        ],
      ),
    );
  }
}
