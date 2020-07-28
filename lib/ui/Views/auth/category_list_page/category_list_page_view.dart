import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:vbt_hackathon/Helper/Views/progress_bar.dart';
import 'package:vbt_hackathon/Helper/Views/stream_builder_helper.dart';
import 'package:vbt_hackathon/Models/Category.dart';
import 'package:vbt_hackathon/Views/category_detail_page/category_detail_page.dart';
import './category_list_page_view_model.dart';
import 'category_list_page.dart';

class CategoryListPageView extends CategoryListPageViewModel {
  @override
  Widget build(BuildContext context) {
    return StreamHelper(
      stream: getQuerySnapshot("Category"),
      hasDataCallback: queryCallBack,
      hasDataWidget: buildGridView(categories),
      hasErrorWidget: Text("Error"),
      progressWidget: DefaultProgressBar(),
    );
  }

  Widget buildGridView(List<Category> snapshot) {
    return GridView.count(
      padding: EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 20),
      crossAxisCount: 2,
      crossAxisSpacing: 25,
      mainAxisSpacing: 25,
      children:
          snapshot.map((category) => buildGridViewCard(category)).toList(),
    );
  }

  Widget buildGridViewCard(Category category) {
    return GestureDetector(
      onTap: () {
        print(category.title);
        print(category.url);
        pushNewScreen(context,
            screen: CategoryDetailPage(
              category: category,
            ),
            withNavBar: true,
            pageTransitionAnimation: PageTransitionAnimation.slideUp);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(category.title),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.network(category.image),
              )
            ],
          ),
        ),
      ),
    );
  }
}
