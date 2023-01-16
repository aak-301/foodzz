import 'package:flutter/cupertino.dart';

import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key, required this.favMeals});

  final List<Meal> favMeals;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("You have no Favourites yet. Start adding some!"),
    );
  }
}
