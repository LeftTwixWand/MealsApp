import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: Text('This is Recipes Fro The Category!'),
      );
}
