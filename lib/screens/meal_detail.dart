import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)!.settings.arguments as Map);
    final id=args['id'];
    final color=args['color'];
    return Scaffold(
      appBar: AppBar(title:  Text(id),backgroundColor: color,),
      body: Center(
        child: Text(id),
      ),
    );
  }
}
