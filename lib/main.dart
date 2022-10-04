// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'config.dart';
import 'home.dart';

class AppData {
  bool isFavorited;
  AppData({required this.isFavorited});

  changeIsFavorited() {
    isFavorited = !isFavorited;
  }
}

class AppDataProvider extends InheritedWidget {
  final AppData appData;
  final Widget child;

  const AppDataProvider({Key? key, required this.appData, required this.child})
      : super(key: key, child: child);

  static AppDataProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppDataProvider>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

void main() {
  runApp(AppDataProvider(
      appData: AppData(isFavorited: false), child: const Fooderlich()));
}

class Fooderlich extends StatefulWidget {
  const Fooderlich({Key? key}) : super(key: key);

  @override
  _FooderlichState createState() => _FooderlichState();
}

class _FooderlichState extends State<Fooderlich> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // untuk menghilangkan banner Debug pada aplikasi
      debugShowCheckedModeBanner: false,
      title: 'Fooderlich',
      theme: currentTheme.currentTheme(),
      home: const Home(),
    );
  }
}
