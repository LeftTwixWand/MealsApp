import 'package:flutter/material.dart';
import 'package:meals_app/category_item.dart';
import './my_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deli Meals'),
      ),
      body: GridView(
        children: MY_CATEGORIES
            .map((catData) => CategoryItem(catData.title, catData.color))
            .toList(),
        padding: const EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
