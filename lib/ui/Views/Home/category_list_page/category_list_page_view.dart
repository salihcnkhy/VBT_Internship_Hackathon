import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:vbt_hackathon/Core/Firebase/Firebase.dart';
import 'package:vbt_hackathon/core/extensions/build_context_extension.dart';
import '../../../../Helper/Views/progress_bar.dart';
import '../../../../Helper/Views/stream_builder_helper.dart';
import '../../../../Models/Category.dart';
import '../../Home/category_detail_page/category_detail_page.dart';
import './category_list_page_view_model.dart';

class CategoryListPageView extends CategoryListPageViewModel {
  @override
  Widget build(BuildContext context) {
    return StreamHelper(
      stream: getQuerySnapshot(CollectionID.Category),
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
        pushNewScreen(
          context,
          screen: CategoryDetailPage(category: category),
          withNavBar: true,
          pageTransitionAnimation: PageTransitionAnimation.slideUp,
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(category.title, style: context.textTheme.headline6),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.network(category.image),
            )
          ],
        ),
      ),
    );
  }
}
