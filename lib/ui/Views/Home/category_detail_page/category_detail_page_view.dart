import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:vbt_hackathon/Helper/Views/chart.dart';
import 'package:vbt_hackathon/Helper/Views/roundedrect_with_shadow.dart';
import 'package:vbt_hackathon/ui/Views/Game/waiting_room_page/waiting_room_page.dart';
import 'package:vbt_hackathon/ui/Views/Home/learn_page/learn_page.dart';

import 'category_detail_page_view_model.dart';

class CategoryDetailPageView extends CategoryDetailPageViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      body: Center(
        heightFactor: 1.05,
        child: Column(
          children: <Widget>[
            RoundedRectWithShadow(
              width: MediaQuery.of(context).size.width - 30,
              height: MediaQuery.of(context).size.height * 0.55,
              color: Colors.white24,
              borderRadius: BorderRadius.circular(15),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(widget.category.title),
                    Text(
                        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et"),
                    PointsLineChart.withSampleData(),
                    PointsLineChart.withSampleData(),
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
                        pushNewScreen(context,
                            screen: WaitingRoomPage(
                              category: widget.category,
                            ),
                            pageTransitionAnimation:
                                PageTransitionAnimation.slideRight);
                      },
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[Text("Düelloya Gir")],
                      ),
                      color: Colors.grey,
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.width * 0.18,
                      borderRadius: BorderRadius.circular(20)),
                  RoundedRectWithShadow(
                      onTap: () {
                        pushNewScreen(context,
                            screen: LearnPage(),
                            pageTransitionAnimation:
                                PageTransitionAnimation.slideRight);
                      },
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[Text("Öğren")],
                      ),
                      color: Colors.blue,
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.width * 0.18,
                      borderRadius: BorderRadius.circular(20))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
