import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/components/row/padding_row.dart';
import '../../../../../core/extensions/build_context_extension.dart';
import '../model/onboarding_model.dart';

class OnboardingPageView extends StatelessWidget {
  final OnboardingModel onboardingModel;

  const OnboardingPageView({Key key, @required this.onboardingModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PaddingRow(
      child: Column(
        children: <Widget>[
          Expanded(flex: 4, child: buildOnboardingImage),
          Spacer(flex: 1),
          Expanded(flex: 1, child: buildAutoSizeTextTitle(context)),
          Expanded(flex: 2, child: buildAutoSizeTextSubtitle(context)),
        ],
      ),
    );
  }

  SvgPicture get buildOnboardingImage => SvgPicture.asset(onboardingModel.image);

  AutoSizeText buildAutoSizeTextTitle(BuildContext context) {
    return AutoSizeText(
      onboardingModel.title,
      style: context.textTheme.headline6,
      textAlign: TextAlign.center,
      maxLines: 1,
    );
  }

  AutoSizeText buildAutoSizeTextSubtitle(BuildContext context) {
    return AutoSizeText(
      onboardingModel.subTitle,
      style: context.textTheme.subtitle1,
      textAlign: TextAlign.center,
      softWrap: true,
    );
  }
}
