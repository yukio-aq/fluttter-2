import 'package:flutter/material.dart';

import '/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key, required this.saveFilters, required this.currentFilters}) : super(key: key);

  static const routeName = '/filters';
  final Function(Map<String, bool>) saveFilters;
  final Map<String, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    // TODO: implement initState
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
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
                },
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'meal selection',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    'Gluten-Free',
                    'description',
                    _glutenFree,
                    (newValue) => setState(() {
                      _glutenFree = newValue;
                    }),
                  ),
                  _buildSwitchListTile(
                    'Lactose-Free',
                    'description',
                    _lactoseFree,
                    (newValue) => setState(() {
                      _lactoseFree = newValue;
                    }),
                  ),
                  _buildSwitchListTile(
                    'Vegetarian',
                    'description',
                    _vegetarian,
                    (newValue) => setState(() {
                      _vegetarian = newValue;
                    }),
                  ),
                  _buildSwitchListTile(
                    'Vegan',
                    'description',
                    _vegan,
                    (newValue) => setState(() {
                      _vegan = newValue;
                    }),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
