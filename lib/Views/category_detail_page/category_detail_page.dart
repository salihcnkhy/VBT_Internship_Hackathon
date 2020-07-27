import 'package:flutter/material.dart';
import 'package:vbt_hackathon/Views/category_list_page/category_list_page.dart';
import './category_detail_page_view.dart';

class CategoryDetailPage extends StatefulWidget {
  final Category category;

  const CategoryDetailPage({Key key, this.category}) : super(key: key);
  @override
  CategoryDetailPageView createState() => new CategoryDetailPageView();
}
