import 'package:flutter/material.dart';
import 'package:foodzz/constants/constant.dart';
import 'package:foodzz/dummy_data/dummy_data.dart';
import 'package:foodzz/screens/categories.dart';
import 'package:foodzz/screens/category_meals.dart';
import 'package:foodzz/screens/filters.dart';
import 'package:foodzz/screens/meal_detail.dart';
import 'package:foodzz/screens/tabs.dart';

import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] as bool && meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] as bool && meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] as bool && meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] as bool && meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final exstingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (exstingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(exstingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink,
        primarySwatch: Colors.pink,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 1, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 1, 51, 1),
              ),
            ),
      ),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => TabsScreen(favMeals: _favoriteMeals),
        AppRoutes.categoryMeals: ((context) => CategoryMeals(
              availableMeals: _availableMeals,
            )),
        AppRoutes.mealDetails: ((context) => MealDetailScreen(
              toggleFav: _toggleFavorite,
              mealFavorite: _isMealFavorite,
            )),
        AppRoutes.filters: ((context) =>
            FiltersScreen(currentFilters: _filters, saveFilters: _setFilters)),
      },
      onUnknownRoute: ((settings) {
        return MaterialPageRoute(
          builder: (context) => const CategoriesScreen(),
        );
      }),
    );
  }
}
