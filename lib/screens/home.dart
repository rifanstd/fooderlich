import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../config.dart';

import 'explore_screen.dart';
import 'recipes_screen.dart';
import 'grocery_screen.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class Home extends StatefulWidget {
  final int currentTab;

  const Home({
    Key? key,
    required this.currentTab,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    const GroceryScreen(),
  ];
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fooderlich',
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: IconButton(
                  icon: const Icon(Icons.sunny),
                  onPressed: () {
                    currentTheme.switchTheme();
                  },
                ),
              ),
              profileButton(widget.currentTab),
            ],
          )
        ],
      ),
      body: IndexedStack(
        index: widget.currentTab,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
          currentIndex: widget.currentTab,
          onTap: (index) {
            Provider.of<AppStateManager>(context, listen: false).goToTab(index);
            context.goNamed(
              'home',
              params: {
                'tab': '$index',
              },
            );
          },
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
                icon: Icon(Icons.explore), label: 'Explore'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.book), label: 'Recipes'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.list), label: 'To Buy'),
          ]),
    );
  }

  Widget profileButton(int currentTab) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        child: const CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(
            'assets/profile_pics/person_stef.jpeg',
          ),
        ),
        onTap: () {
          context.goNamed('profile', params: {
            'tab': '$currentTab',
          });
        },
      ),
    );
  }
}
