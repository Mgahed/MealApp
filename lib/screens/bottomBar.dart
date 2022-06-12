import 'package:flutter/material.dart';
import 'package:meal_app/screens/favorites.dart';

import '../widgets/drawerWidget.dart';
import 'home.dart';

class BottomTabs extends StatefulWidget {
  const BottomTabs({Key? key}) : super(key: key);

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  final _pages = [
    const Home(title: 'Meal App'),
    const Favorites(title: 'Favorite Meals'),
  ];
  int _selectedTab = 0;

  void _selectTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: Text(_selectedTab == 0 ? 'Meal App' : 'Favorite Meals'),
      ),
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedTab,
        selectedFontSize: 17,
        unselectedFontSize: 14,
        onTap: (index) {
          _selectTab(index);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedTab == 0
                ? const Icon(Icons.category)
                : const Icon(Icons.category_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: _selectedTab == 0
                ? const Icon(Icons.star_border)
                : const Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
        // selectedItemColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
