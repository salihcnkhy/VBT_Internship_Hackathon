import 'package:flutter/material.dart';
import './home_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

abstract class HomePageViewModel extends State<HomePage> {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);
}
