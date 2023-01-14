import 'package:flutter/material.dart';
import 'package:foodzz/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      drawer: const MainDrawer(),
      body: const Center(
        child: Text("Filters"),
      ),
    );
  }
}
