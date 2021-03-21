import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

import '../models/meal.model.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favoriteMeals;

  FavoritesScreen(
    this._favoriteMeals
  );
  
  @override
  Widget build (BuildContext context) {
    if (_favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!')
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title:_favoriteMeals[index].title,
            imageUrl:_favoriteMeals[index].imageUrl,
            affordability:_favoriteMeals[index].affordability,
            duration:_favoriteMeals[index].duration,
            complexity:_favoriteMeals[index].complexity,
            id:_favoriteMeals[index].id,
          );
        },
        itemCount: _favoriteMeals.length
      );
    }
  }
}