import 'package:flutter/material.dart';
import 'package:vbt_hackathon/Models/Category.dart';
import './category_detail_page_view.dart';

class CategoryDetailPage extends StatefulWidget {
  final Category category;

  const CategoryDetailPage({Key key, this.category}) : super(key: key);
  @override
  CategoryDetailPageView createState() => new CategoryDetailPageView();
}
