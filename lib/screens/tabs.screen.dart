import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

import 'categories.screen.dart';
import 'favorites.screen.dart';

import '../models/meal.model.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(
    this.favoriteMeals
  );

  @override
  _TabScreenState createState() => _TabScreenState(); 
}

class _TabScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories'
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals), 
        "title": 'Favorites'
      }
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;
  
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_pages[_selectedPageIndex]['title']}'),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        unselectedItemColor: Theme.of(context).accentColor,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: 'Category'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: 'Favorites'
          ),
        ]
      )
    );
  }
}