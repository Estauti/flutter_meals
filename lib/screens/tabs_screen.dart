import 'package:flutter/material.dart';
import './favorites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = 'tabs';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentTabIndex = 0;
  List<Widget> _pages = [
    CategoriesScreen(),
    FavoritesScreen(),
  ];

  void _tabSelected(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        onTap: (value) => _tabSelected(value),
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.category),
            title: const Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.star),
            title: const Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
