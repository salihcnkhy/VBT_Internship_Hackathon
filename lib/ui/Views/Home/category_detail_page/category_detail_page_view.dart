import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:vbt_hackathon/Helper/Views/chart.dart';
import 'package:vbt_hackathon/Helper/Views/roundedrect_with_shadow.dart';
import 'package:vbt_hackathon/core/app/constants/string_constants.dart';
import 'package:vbt_hackathon/core/app/theme/color_scheme.dart';
import 'package:vbt_hackathon/core/components/row/padding_row.dart';
import 'package:vbt_hackathon/core/extensions/build_context_extension.dart';
import 'package:vbt_hackathon/ui/Views/Game/waiting_room_page/waiting_room_page.dart';

import 'category_detail_page_view_model.dart';

class CategoryDetailPageView extends CategoryDetailPageViewModel {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaddingRow(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: RoundedRectWithShadow(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(widget.category.title,
                          style: context.textTheme.headline6),
                      AutoSizeText(widget.category.definition,
                          style: context.textTheme.subtitle1
                              .copyWith(fontSize: 12)),
                      PointsLineChart.withSampleData(),
                      PointsLineChart.withSampleData(),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: RoundedRectWithShadow(
                        onTap: () {
                          pushNewScreen(context,
                              screen: WaitingRoomPage(
                                category: widget.category,
                              ),
                              pageTransitionAnimation:
                                  PageTransitionAnimation.slideRight);
                        },
                        padding: EdgeInsets.all(8),
                        child: Center(
                            child: Text("Düelloya Gir",
                                style: context.textTheme.button)),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 2,
                      child: RoundedRectWithShadow(
                        padding: EdgeInsets.all(8),
                        child: Center(
                          child: Text(
                            "Öğren",
                            style: context.textTheme.button
                                .copyWith(color: AppColorScheme.light_khaki),
                          ),
                        ),
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
