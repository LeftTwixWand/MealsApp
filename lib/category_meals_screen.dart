import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryId = routeArguments['id'];

    final categoryTitle = routeArguments['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle ?? 'Default category name'),
      ),
      body: Text('This is Recipes Fro The Category!'),
    );
  }
}
