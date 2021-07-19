import 'package:flutter/material.dart';
import '../widgets/main_drawr.dart';

class FiltersScreen extends StatefulWidget {
  static const routName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegeterian = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(String title, String description,
          bool currentValue, Function(bool) updateValue) =>
      SwitchListTile(
          title: Text(title),
          value: currentValue,
          subtitle: Text(description),
          onChanged: updateValue);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawr(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwitchListTile(
                'Gluten-free',
                'Only include gluten-free meals',
                _glutenFree,
                (value) {
                  setState(
                    () {
                      _glutenFree = value;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                'Lactose-free',
                'Only include lactose-free meals',
                _lactoseFree,
                (value) {
                  setState(
                    () {
                      _lactoseFree = value;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                'Vegetarian',
                'Only include vegetarian meals',
                _vegeterian,
                (value) {
                  setState(
                    () {
                      _vegeterian = value;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                'Vegan',
                'Only include vegan meals',
                _vegan,
                (value) {
                  setState(
                    () {
                      _vegan = value;
                    },
                  );
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
