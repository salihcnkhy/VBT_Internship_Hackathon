import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vbt_hackathon/Core/app/base/base_view.dart';
import 'package:vbt_hackathon/Core/extensions/build_context_extension.dart';
import 'package:vbt_hackathon/core/app/constants/string_constants.dart';
import 'package:vbt_hackathon/core/app/theme/color_scheme.dart';
import 'package:vbt_hackathon/core/components/row/padding_row.dart';
import '../viewmodel/login_page_view_model.dart';

class LoginPageView extends StatefulWidget {
  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  LoginPageViewModel loginPageViewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginPageViewModel>(
      builder: (context, value) => Scaffold(
        body: body(context),
        resizeToAvoidBottomPadding: false,
      ),
      model: LoginPageViewModel(),
      onModelReady: (model) {
        model.init();
        model.setContext(context);
        loginPageViewModel = model;
      },
    );
  }

  Widget body(BuildContext context) {
    return Stack(
      children: <Widget>[
        buildAppBar,
        buildLoginRegister,
        if (loginPageViewModel.myFuture != null)
          FutureBuilder(
            future: loginPageViewModel.myFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text("Success",
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ));
              } else if (snapshot.hasError) {
                return Text("Error Occured => " + snapshot.error.toString(),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ));
              }
              return buildBackdropFilter;
            },
          ),
      ],
    );
  }

  Column get buildAppBar {
    return Column(
      children: [
        Expanded(flex: 3, child: buildAppBarContainer),
        Spacer(flex: 7),
      ],
    );
  }

  Widget get buildAppBarContainer => Container(decoration: appBarBoxDecoration, child: buildLogo);

  BoxDecoration get appBarBoxDecoration {
    return BoxDecoration(
      borderRadius: baseBorderRadius40,
      boxShadow: [appBarBoxShadow],
      gradient: context.baseGradient,
    );
  }

  BorderRadius get baseBorderRadius40 => BorderRadius.only(bottomLeft: Radius.circular(40));

  BoxShadow get appBarBoxShadow =>
      BoxShadow(color: Colors.black26, offset: Offset(0, 1), blurRadius: 6, spreadRadius: 0);

  Widget get buildLogo {
    return Center(
      child: Text(
        "Logo".toUpperCase(),
        style: context.textTheme.headline2.copyWith(color: AppColorScheme.light_khaki),
      ),
    );
  }

  PaddingRow get buildLoginRegister {
    return PaddingRow(
      child: Column(
        children: <Widget>[
          Spacer(flex: 3),
          Expanded(flex: 6, child: buildLoginRegisterContainer),
          Spacer(flex: 4),
        ],
      ),
    );
  }

  Container get buildLoginRegisterContainer {
    return Container(
      decoration: buildBoxDecorationLoginRegister,
      child: PaddingRow(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildTextTitle,
            buildTextFormFieldLogin,
            buildTextFormFieldPassword,
            ButtonBar(children: [buildFlatButtonLoginWithGithub, buildFlatButtonLogin]),
          ],
        ),
      ),
    );
  }

  BoxDecoration get buildBoxDecorationLoginRegister {
    return BoxDecoration(
      color: AppColorScheme.light_khaki,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [appBarBoxShadow],
    );
  }

  Text get buildTextTitle =>
      Text(StringConstanst.instance.login, style: context.textTheme.headline5);

  TextFormField get buildTextFormFieldLogin {
    return TextFormField(
      controller: loginPageViewModel.email,
      decoration: InputDecoration(labelText: StringConstanst.instance.emailAddress),
    );
  }

  TextFormField get buildTextFormFieldPassword {
    return TextFormField(
      obscureText: true,
      controller: loginPageViewModel.password,
      decoration: InputDecoration(labelText: StringConstanst.instance.password),
    );
  }

  FlatButton get buildFlatButtonLoginWithGithub {
    return FlatButton(
      onPressed: loginPageViewModel.loginButtonPressed,
      shape: StadiumBorder(side: BorderSide()),
      child: Text(
        StringConstanst.instance.signInWithGithub,
        style: context.textTheme.button.copyWith(color: context.colorScheme.surface),
      ),
    );
  }

  FlatButton get buildFlatButtonLogin {
    return FlatButton(
      onPressed: loginPageViewModel.loginButtonPressed,
      color: context.colorScheme.primary,
      shape: StadiumBorder(),
      child: Text(
        StringConstanst.instance.login.toUpperCase(),
        style: context.textTheme.button.copyWith(color: context.colorScheme.background),
      ),
    );
  }

  Widget get buildBackdropFilter {
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
}
