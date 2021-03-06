import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../widgets/main_drawer.dart';

import '../models/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      drawer: MainDrawer(),
      body: GridView(
        padding: const EdgeInsets.all(20),
        children: DUMMY_CATEGORIES
            .map((c) => CategoryItem(
                  id: c.id,
                  title: c.title,
                  color: c.color,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ),
    );
  }
}
