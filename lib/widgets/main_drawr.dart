import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawr extends StatelessWidget {
  Widget _buildListTile(String title, IconData icon, VoidCallback onTap) =>
      ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          '$title',
          style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        onTap: onTap,
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Main Page',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          _buildListTile(
            'Filters',
            Icons.settings,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routName);
            },
          ),
        ],
      ),
    );
  }
}
