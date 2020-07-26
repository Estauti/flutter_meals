import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';

import '../models/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = 'categoryMeals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final id = routeArgs['id'];
    final meals = DUMMY_MEALS.where((m) => m.categories.contains(id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final meal = meals[index];

          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            complexity: meal.complexity,
            affordability: meal.affordability,
            duration: meal.duration,
          );
        },
        itemCount: meals.length,
      ),
    );
  }
}
