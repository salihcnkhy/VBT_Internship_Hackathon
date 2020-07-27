import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vbt_hackathon/core/app/constants/enum_constants.dart';

import '../../../../../core/app/base/base_view_model.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  SharedPreferences sharedPreferences;

  @observable
  bool isDone = false;

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    isDone = sharedPreferences.getBool("$EnumSharedPreferences.isDoneOnboarding");
    if (isDone == null) isDone = false;
    !isDone ? pushOnboarding() : pushLogin();
  }

  void pushOnboarding() =>
      Navigator.pushNamedAndRemoveUntil(context, '/onboarding', (route) => false);
  void pushLogin() => Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
}
