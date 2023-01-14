import 'package:flutter/material.dart';
import 'package:foodzz/constants/constant.dart';
import 'package:foodzz/screens/categories.dart';
import 'package:foodzz/screens/category_meals.dart';
import 'package:foodzz/screens/filters.dart';
import 'package:foodzz/screens/meal_detail.dart';
import 'package:foodzz/screens/tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        AppRoutes.home: (context) => const TabsScreen(),
        AppRoutes.categoryMeals: ((context) => const CategoryMeals()),
        AppRoutes.mealDetails: ((context) => const MealDetailScreen()),
        AppRoutes.filters: ((context) => const FiltersScreen()),
      },
      onUnknownRoute: ((settings) {
        return MaterialPageRoute(
          builder: (context) => const CategoriesScreen(),
        );
      }),
    );
  }
}
