import 'package:flutter/material.dart';
import '../my_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryId = routeArguments['id'];
    final categoryTitle = routeArguments['title'];
    final categoryMeals = MY_MEALS
        .where((element) => element.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle ?? 'Default category name'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => Text(categoryMeals[index].title),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
