import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/app/constants/enum_constants.dart';
import '../../../../../core/app/base/base_view_model.dart';
import '../../../../../core/app/constants/image_constants.dart';
import '../../../../../core/app/constants/string_constants.dart';
import '../../../../../core/extensions/build_context_extension.dart';
import '../model/onboarding_model.dart';

part 'onboarding_view_model.g.dart';

class OnboardingViewModel = _OnboardingViewModelBase with _$OnboardingViewModel;

abstract class _OnboardingViewModelBase with Store, BaseViewModel {
  List<OnboardingModel> onboardingList = [];
  PageController pageController;
  SharedPreferences sharedPreferences;

  @observable
  int currentPage = 0;

  @observable
  bool isDone = false;

  @computed
  bool get isNotLastPage => currentPage + 1 != onboardingList.length;

  @computed
  String get buttonFinishValue =>
      isNotLastPage ? StringConstanst.instance.next : StringConstanst.instance.done;

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  init() async {
    pageController = PageController();
    onboardingList.add(OnboardingModel(
        StringConstanst.instance.onboardingPageOneTitle,
        StringConstanst.instance.onboardingPageOneSubtitle,
        ImageConstants.instance.onboardingPageOneSVG));
    onboardingList.add(OnboardingModel(
        StringConstanst.instance.onboardingPageTwoTitle,
        StringConstanst.instance.onboardingPageTwoSubtitle,
        ImageConstants.instance.onboardingPageTwoSVG));
    onboardingList.add(OnboardingModel(
        StringConstanst.instance.onboardingPageThreeTitle,
        StringConstanst.instance.onboardingPageThreeSubtitle,
        ImageConstants.instance.onboardingPageThreeSVG));
    sharedPreferences = await SharedPreferences.getInstance();
    isDone = sharedPreferences.getBool("$EnumSharedPreferences.isDoneOnboarding");
  }

  @action
  void onPageChanged(int index) => currentPage = index;

  void onPageButtonPressed() {
    if (isNotLastPage)
      pageController.nextPage(duration: context.onboardingDuration, curve: Curves.easeInOut);
    else {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      isDone = true;
      sharedPreferences.setBool("$EnumSharedPreferences.isDoneOnboarding", true);
    }
  }
}
