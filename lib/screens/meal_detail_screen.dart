import 'package:flutter/material.dart';
import '../my_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final void Function(String) toggleFavourite;
  final Function isFavorite;

  MealDetailScreen({required this.toggleFavourite, required this.isFavorite});

  Widget buildSectionTitle(BuildContext context, String text) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          '$text',
          style: Theme.of(context).textTheme.headline1,
        ),
      );

  Widget buildContainer(Widget child) => Container(
        height: 250,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = MY_MEALS.firstWhere((element) => element.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${(index + 1)}'),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  Divider(),
                ],
              ),
              itemCount: selectedMeal.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavourite(mealId),
        child: Icon(isFavorite(mealId) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
