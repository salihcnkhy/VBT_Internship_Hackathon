import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/app/base/base_view.dart';
import '../../../../../core/app/theme/app_theme.dart';
import '../../../../../core/extensions/build_context_extension.dart';
import '../components/page_view.dart';
import '../viewmodel/onboarding_view_model.dart';

class OnboardingView extends StatefulWidget {
  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  OnboardingViewModel onboardingViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<OnboardingViewModel>(
      builder: (context, value) => Scaffold(body: buildBody),
      model: OnboardingViewModel(),
      onModelReady: (OnboardingViewModel model) {
        model.init();
        model.setContext(context);
        onboardingViewModel = model;
      },
    );
  }

  Column get buildBody {
    return Column(
      children: <Widget>[
        Spacer(flex: 2),
        Expanded(flex: 8, child: buildOnboardingPageView),
        Expanded(flex: 2, child: buildOnboardingPageControlWidget),
      ],
    );
  }

  Widget get buildOnboardingPageView {
    return PageView(
      controller: onboardingViewModel.pageController,
      onPageChanged: onboardingViewModel.onPageChanged,
      children: onboardingListWidgets,
    );
  }

  List<Widget> get onboardingListWidgets {
    return List.generate(
      onboardingViewModel.onboardingList.length,
      (index) => OnboardingPageView(onboardingModel: onboardingViewModel.onboardingList[index]),
    );
  }

  Widget get buildOnboardingPageControlWidget {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Spacer(flex: 4),
        Expanded(child: buildSmoothPageIndicator),
        Spacer(flex: 2),
        buildOnboardingNextDoneButton(context),
      ],
    );
  }

  SmoothPageIndicator get buildSmoothPageIndicator {
    return SmoothPageIndicator(
      controller: onboardingViewModel.pageController,
      count: onboardingViewModel.onboardingList.length,
      effect: buildIndicatorScrollingDotsEffect,
    );
  }

  ScrollingDotsEffect get buildIndicatorScrollingDotsEffect {
    return ScrollingDotsEffect(
      activeDotColor: AppTheme.instance.theme.indicatorColor,
      dotColor: AppTheme.instance.theme.indicatorColor.withOpacity(0.5),
      activeDotScale: 1.5,
      dotHeight: 10,
      dotWidth: 10,
    );
  }

  Widget buildOnboardingNextDoneButton(BuildContext context) {
    return Observer(builder: (_) {
      return FlatButton(
        onPressed: () => onboardingViewModel.onPageButtonPressed(),
        child: Text(
          onboardingViewModel.buttonFinishValue.toUpperCase(),
          style: context.textTheme.button,
          textAlign: TextAlign.center,
        ),
      );
    });
  }
}
