import 'package:flutter/material.dart';
import 'package:foodzz/models/meal.dart';

import '../constants/constant.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {super.key,
      required this.title,
      required this.color,
      required this.id,
      required this.complexity,
      required this.imgUrl,
      required this.duration,
      required this.affordability});

  final String title;
  final Color color;
  final String id;
  final String imgUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(AppRoutes.mealDetails, arguments: {'id': id,'color':color});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imgUrl,
                      height: 250, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 380,
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.schedule),
                        const SizedBox(
                          width: 6,
                        ),
                        Text('$duration min'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.work),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(complexityText),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.attach_money),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(affordabilityText),
                      ],
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}