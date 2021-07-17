import 'package:flutter/material.dart';
import '../widgets/main_drawr.dart';

class FiltersScreen extends StatelessWidget {
  static const routName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawr(),
    );
  }
}
