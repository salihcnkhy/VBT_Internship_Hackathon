import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vbt_hackathon/Core/Firebase/Firebase.dart';
import 'package:vbt_hackathon/Models/Category.dart';
import './category_list_page.dart';

abstract class CategoryListPageViewModel extends State<CategoryListPage>
    with FirestoreProcess {
  // Add your state and logic here
  List<Category> categories = new List();

  void queryCallBack(snapshot) {
    List<Category> tempCategories = List();
    for (var data in snapshot.documents) {
      var category = Category.fromSnapshot(data);
      // add condition for performance
      tempCategories.add(category);
    }
    if (categories.isEmpty) {
      setState(() {
        categories = tempCategories;
      });
    }
  }
}
