import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:vbt_hackathon/Helper/Views/chart.dart';
import 'package:vbt_hackathon/Helper/Views/roundedrect_with_shadow.dart';
import 'package:vbt_hackathon/core/app/constants/string_constants.dart';
import 'package:vbt_hackathon/core/app/theme/color_scheme.dart';
import 'package:vbt_hackathon/core/extensions/build_context_extension.dart';
import 'package:vbt_hackathon/ui/Views/Game/waiting_room_page/waiting_room_page.dart';

import 'category_detail_page_view_model.dart';

class CategoryDetailPageView extends CategoryDetailPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RoundedRectWithShadow(
            width: MediaQuery.of(context).size.width - 30,
            height: MediaQuery.of(context).size.height * 0.55,
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(widget.category.title, style: context.textTheme.headline6),
                  AutoSizeText(StringConstanst.instance.b3level,
                      style: context.textTheme.subtitle1.copyWith(fontSize: 12)),
                  Expanded(child: PointsLineChart.withSampleData()),
                  Expanded(child: PointsLineChart.withSampleData()),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RoundedRectWithShadow(
                  onTap: () {
                    pushNewScreen(
                      context,
                      screen: WaitingRoomPage(category: widget.category),
                      pageTransitionAnimation: PageTransitionAnimation.slideRight,
                    );
                  },
                  padding: EdgeInsets.all(8),
                  child: Center(child: Text("Düelloya Gir", style: context.textTheme.button)),
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.18,
                  borderRadius: BorderRadius.circular(15),
                ),
                RoundedRectWithShadow(
                  padding: EdgeInsets.all(8),
                  color: context.colorScheme.primary,
                  child: Center(
                    child: Text(
                      "Öğren",
                      style: context.textTheme.button.copyWith(color: AppColorScheme.light_khaki),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.18,
                  borderRadius: BorderRadius.circular(15),
                )
              ],
            ),
          )
        ],
    );
  }
}
