import 'package:flutter/material.dart';
import 'package:foodzz/constants/constant.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {required this.title, required this.color, required this.id, super.key});

  final String id;
  final String title;
  final Color color;

  void selecCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(AppRoutes.categoryMeals,
        arguments: {'id': id, 'title': title, 'color': color});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selecCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
