import 'package:flutter/material.dart';

import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/meal_details_screen.dart';
import 'screens/tabs_screen.dart';

import './models/meal.dart';
import './models/dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };
  List<Meal> _meals = DUMMY_MEALS;

  void _saveFilters(Map<String, bool> newFilters) {
    setState(() {
      _filters = newFilters;

      _filterMeals();
    });
  }

  void _filterMeals() {
    _meals = DUMMY_MEALS.where((meal) {
      if (meal.isGlutenFree && !_filters['gluten']) {
        return false;
      }
      if (meal.isLactoseFree && !_filters['lactose']) {
        return false;
      }
      if (meal.isVegetarian && !_filters['vegetarian']) {
        return false;
      }
      if (meal.isVegan && !_filters['vegan']) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  void initState() {
    // _filterMeals();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      initialRoute: TabsScreen.routeName,
      routes: {
        TabsScreen.routeName: (ctx) => TabsScreen(),
        CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_meals),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _saveFilters),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
