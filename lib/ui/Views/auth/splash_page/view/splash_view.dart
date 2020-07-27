import 'package:flutter/material.dart';
import 'package:vbt_hackathon/core/app/base/base_view.dart';
import 'package:vbt_hackathon/ui/Views/auth/splash_page/viewmodel/splash_view_model.dart';
import '../../../../../core/extensions/build_context_extension.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashViewModel splashViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      builder: (context, value) => Scaffold(body: buildBody(context)),
      model: SplashViewModel(),
      onModelReady: (model) {
        model.init();
        model.setContext(context);
        splashViewModel = model;
      },
    );
  }

  Center buildBody(BuildContext context) {
    return Center(
      child: Text("Logo", style: context.textTheme.headline2),
    );
  }
}
