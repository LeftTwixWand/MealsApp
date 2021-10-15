import 'package:flutter/material.dart';
import '/models/meal.dart';
import './my_data.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = MY_MEALS;
  List<Meal> _favoriteMeals = [];

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void _setFilters(Map<String, bool> filterData) {
    setState(
      () {
        _filters = filterData;

        _availableMeals = MY_MEALS.where((meal) {
          if (_filters['gluten'] == null ? false : true && !meal.isGlutenFree) {
            return false;
          }
          if (_filters['lactose'] == null
              ? false
              : true && !meal.isLactoseFree) {
            return false;
          }
          if (_filters['vegan'] == null ? false : true && !meal.isVegan) {
            return false;
          }
          if (_filters['vegetarian'] == null
              ? false
              : true && !meal.isVegetarian) {
            return false;
          }

          return true;
        }).toList();
      },
    );
  }

  void _toggleFavourite(String id) {
    final existingIndex =
        _favoriteMeals.indexWhere((element) => element.id == id);

    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
      return;
    }

    setState(() {
      _favoriteMeals
          .add(_availableMeals.firstWhere((element) => element.id == id));
    });
  }

  bool _isMealFavorite(String id) =>
      _favoriteMeals.any((element) => element.id == id);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.fromSwatch(accentColor: Colors.amber),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline1: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      home: TabScreen(_favoriteMeals),
      routes: {
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(
            toggleFavourite: _toggleFavourite, isFavorite: _isMealFavorite),
        FiltersScreen.routName: (ctx) => FiltersScreen(_setFilters, _filters),
      },
    );
  }
}
