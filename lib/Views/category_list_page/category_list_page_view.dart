import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './category_list_page_view_model.dart';
import 'category_list_page.dart';

class CategoryListPageView extends CategoryListPageViewModel {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: getQuerySnapshot("Category"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          categories.clear();
          for (var data in snapshot.data.documents) {
            var category = Category.fromSnapshot(data);
            categories.add(category);
          }
          return buildGridView(categories);
        } else if (snapshot.hasError) {
          Text("Error");
        }
        return buildBackdropFilter();
      },
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

  Widget buildBackdropFilter() {
    return Container(
      color: Colors.black.withOpacity(0.2),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Center(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.width * 0.3,
              child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
