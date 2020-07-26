import 'package:flutter/material.dart';

import '../models/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = 'mealDetails';

  Widget buildScrollableContainer(BuildContext context, Widget child) {
    return Container(
      height: 250,
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white12,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((m) => m.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(
              meal.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            buildScrollableContainer(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).accentColor,
                    ),
                    child: Text(meal.ingredients[index]),
                  );
                },
                itemCount: meal.ingredients.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Steps',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            buildScrollableContainer(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('#${index + 1}'),
                    ),
                    title: Text(meal.steps[index]),
                  );
                },
                itemCount: meal.steps.length,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
