import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  @required
  final String id;
  @required
  final String title;

  CategoryMealsScreen({this.id, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Recipes for this category'),
      ),
    );
  }
}
