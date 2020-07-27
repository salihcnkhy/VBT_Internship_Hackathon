import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vbt_hackathon/Core/Firebase/Firebase.dart';
import './category_list_page.dart';

abstract class CategoryListPageViewModel extends State<CategoryListPage>
    with FirestoreProcess {
  // Add your state and logic here
  List<Category> categories = new List();
}
