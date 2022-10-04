import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';

class MyTheme with ChangeNotifier {
  static bool _isDark = false;

  ThemeData currentTheme() {
    return _isDark ? FooderlichTheme.dark() : FooderlichTheme.light();
  }

  void switchTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
