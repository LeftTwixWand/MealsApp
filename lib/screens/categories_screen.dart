import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../my_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GridView(
        children: MY_CATEGORIES
            .map((catData) =>
                CategoryItem(catData.id, catData.title, catData.color))
            .toList(),
        padding: const EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      );
}
