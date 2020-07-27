import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/app/base/base_view_model.dart';
import '../../../../../core/app/constants/image_constants.dart';
import '../../../../../core/app/constants/string_constants.dart';
import '../../../../../core/extensions/build_context_extension.dart';
import '../model/onboarding_model.dart';

part 'onboarding_view_model.g.dart';

class OnboardingViewModel = _OnboardingViewModelBase with _$OnboardingViewModel;

abstract class _OnboardingViewModelBase with Store, BaseViewModel {
  PageController pageController;
  List<OnboardingModel> onboardingList = [];

  @observable
  int currentPage = 0;

  @computed
  bool get isNotLastPage => currentPage + 1 != onboardingList.length;

  @computed
  String get buttonFinishValue =>
      isNotLastPage ? StringConstanst.instance.next : StringConstanst.instance.done;

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  init() {
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
  }

  @action
  void onPageChanged(int index) => currentPage = index;

  void onPageButtonPressed() {
    if (isNotLastPage)
      pageController.nextPage(duration: context.onboardingDuration, curve: Curves.easeInOut);
    else
      Navigator.pushNamed(context, 'login');
  }
}
