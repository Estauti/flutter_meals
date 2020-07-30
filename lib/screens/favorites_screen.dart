import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import '../widgets/meal_item.dart';

import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Favorite'),
      ),
      drawer: MainDrawer(),
      body: favoriteMeals.length > 0
          ? ListView.builder(
              itemBuilder: (ctx, index) {
                final meal = favoriteMeals[index];

                return MealItem(
                  id: meal.id,
                  title: meal.title,
                  imageUrl: meal.imageUrl,
                  complexity: meal.complexity,
                  affordability: meal.affordability,
                  duration: meal.duration,
                );
              },
              itemCount: favoriteMeals.length,
            )
          : Center(
              child: Text('You have no favorites yet - start adding some!'),
            ),
    );
  }
}
