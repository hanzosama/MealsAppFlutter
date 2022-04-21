import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterPage extends StatefulWidget {
  static const routeName = '/filters';

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildSwitchTile(
      String title, String description, bool currentValue, Function onUpdate) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: onUpdate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust you meal selection',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchTile(
                  'Gluten-free', 'Only include gluten-free meals.', _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchTile('Lactose-free',
                  'Only include Lactose-free meals.', _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              _buildSwitchTile(
                  'Vegetarian', 'Only include Vegetarian meals.', _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              _buildSwitchTile('Vegan', 'Only include Vegan meals.', _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
