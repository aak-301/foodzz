import 'package:flutter/material.dart';
import 'package:foodzz/models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMeals extends StatefulWidget {
  const CategoryMeals({super.key, required this.availableMeals});

 final List<Meal> availableMeals;

  @override
  State<CategoryMeals> createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String categoryTitle = "";
  Color categoryColor = Colors.amber;
  String categoryId = "";
  List categoryMeals = [];
  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final Map routeArgs = ModalRoute.of(context)?.settings.arguments as Map;
      categoryTitle = routeArgs['title'];
      categoryColor = routeArgs['color'];
      categoryId = routeArgs['id'];
      categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
    }
    _loadedInitData = true;
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(categoryTitle), backgroundColor: categoryColor),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: ((ctx, index) {
          return MealItem(
            color: categoryColor,
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imgUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
            // removeItem: _removeMeal,
          );
        }),
      ),
    );
  }
}
