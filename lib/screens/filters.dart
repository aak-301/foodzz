import 'package:flutter/material.dart';
import 'package:foodzz/constants/constant.dart';
import 'package:foodzz/constants/theme.dart';
import 'package:foodzz/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen(
      {super.key, required this.saveFilters, required this.currentFilters});

  final Function saveFilters;
  final Map<String,bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState(){
    _glutenFree=widget.currentFilters['gluten'] as bool;
    _vegetarian=widget.currentFilters['vegetarian'] as bool;
    _vegan=widget.currentFilters['vegan'] as bool;
    _lactoseFree=widget.currentFilters['lactose'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(
      {required String title,
      required String description,
      required bool currentValue,
      required Function updateValue}) {
    return SwitchListTile(
      value: currentValue,
      onChanged: (value) => updateValue(value),
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
                Navigator.of(context).pushReplacementNamed(AppRoutes.home);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Adjust your meal selection',
              style: AppTheme.headingTheme,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                title: 'Gluten-Free',
                description: 'Only include gluten-free-meals',
                currentValue: _glutenFree,
                updateValue: ((value) {
                  setState(() {
                    _glutenFree = value;
                  });
                }),
              ),
              _buildSwitchListTile(
                title: 'Lactose-Free',
                description: 'Only include lactose-free-meals',
                currentValue: _lactoseFree,
                updateValue: ((value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                }),
              ),
              _buildSwitchListTile(
                title: 'Vegtarian',
                description: 'Only include vegearian meals',
                currentValue: _vegetarian,
                updateValue: ((value) {
                  setState(() {
                    _vegetarian = value;
                  });
                }),
              ),
              _buildSwitchListTile(
                title: 'Vegan',
                description: 'Only include vegan meals',
                currentValue: _vegan,
                updateValue: ((value) {
                  setState(() {
                    _vegan = value;
                  });
                }),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
