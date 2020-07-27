import 'package:flutter/material.dart';
import './category_list_page_view_model.dart';

class CategoryListPageView extends CategoryListPageViewModel {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 20),
      crossAxisCount: 2,
      crossAxisSpacing: 25,
      mainAxisSpacing: 25,
      children: <Widget>[
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: Container(color: Colors.blue),
        ),
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: Container(color: Colors.black),
        ),
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: Container(color: Colors.red),
        ),
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: Container(color: Colors.green),
        ),
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: Container(color: Colors.orange),
        ),
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 10,
          child: Container(color: Colors.yellow),
        )
      ],
    );
    // Replace this with your build function
  }
}
