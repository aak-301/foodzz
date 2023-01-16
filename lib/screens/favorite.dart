import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key, required this.favMeals});

  final List<Meal> favMeals;

  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return const Center(
        child: Text("You have no Favourites yet. Start adding some!"),
      );
    }
    return ListView.builder(
      itemCount: favMeals.length,
      itemBuilder: ((ctx, index) {
        return MealItem(
          id: favMeals[index].id,
          title: favMeals[index].title,
          imgUrl: favMeals[index].imageUrl,
          duration: favMeals[index].duration,
          complexity: favMeals[index].complexity,
          affordability: favMeals[index].affordability,
        );
      }),
    );
  }
}
