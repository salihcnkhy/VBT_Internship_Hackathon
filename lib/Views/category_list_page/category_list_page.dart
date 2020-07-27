import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vbt_hackathon/Views/category_detail_page/category_detail_page.dart';
import './category_list_page_view.dart';

class CategoryListPage extends StatefulWidget {
  @override
  CategoryListPageView createState() => new CategoryListPageView();
}

class Category {
  String url;
  String title;
  String image;
  final DocumentReference reference;
  Category.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['url'] != null),
        assert(map['title'] != null),
        title = map['title'],
        image = map['image'],
        url = map['url'];

  Category.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
