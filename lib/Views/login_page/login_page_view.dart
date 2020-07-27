import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
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
            FutureBuilder(
              //You can use setState There
              future: myFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print("User Data" + snapshot.data.toString());
                  return HomePage();
                } else if (snapshot.hasError) {
                  print("Hata Data" + snapshot.error.toString());

                  return Text("Error Occured => " + snapshot.error.toString(),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ));
                }
                return buildBackdropFilter();
              },
            )
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
          FlatButton(onPressed: loginButtonPressed, child: Text("Login")),
          FlatButton(
              onPressed: pushRegisterPage, child: Text("Go Register Page"))
        ],
      ),
    );
  }
}
