import 'package:flutter/material.dart';

import '../dummy_data/dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMeals extends StatelessWidget {
  const CategoryMeals({super.key});

  @override
  Widget build(BuildContext context) {
    final Map routeArgs = ModalRoute.of(context)?.settings.arguments as Map;
    final categoryTitle = routeArgs['title'];
    final categoryColor = routeArgs['color'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar:
          AppBar(title: Text(categoryTitle), backgroundColor: categoryColor),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: ((ctx, index) {
          return MealItem(
            color:categoryColor,
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imgUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        }),
      ),
    );
  }
}
