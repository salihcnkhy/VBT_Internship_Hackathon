import 'package:flutter/material.dart';

class AppIcons {
  static AppIcons _instance;
  static AppIcons get instance {
    if (_instance == null) _instance = AppIcons._init();
    return _instance;
  }

  AppIcons._init();

  final IconData email = Icons.email;
  final IconData password = Icons.lock;
}
