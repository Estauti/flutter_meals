import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'favorites';

  final Function filtersSaved;
  final Map<String, bool> filters;

  const FiltersScreen(this.filters, this.filtersSaved);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutterFree = false;
  bool _isLactoseFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;

  @override
  void initState() {
    _isGlutterFree = widget.filters['gluten'];
    _isLactoseFree = widget.filters['lactose'];
    _isVegetarian = widget.filters['vegetarian'];
    _isVegan = widget.filters['vegan'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => widget.filtersSaved({
              'gluten': _isGlutterFree,
              'lactose': _isLactoseFree,
              'vegetarian': _isVegetarian,
              'vegan': _isVegan,
            }),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 25,
            ),
            child: Center(
              child: Text(
                'Adjust your meal selection',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                  value: _isGlutterFree,
                  title: Text('Gluten-free'),
                  subtitle: Text('Only include gluten-free meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _isGlutterFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  value: _isLactoseFree,
                  title: Text('Lactose-free'),
                  subtitle: Text('Only include lactose-free meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _isLactoseFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  value: _isVegetarian,
                  title: Text('Vegetarian'),
                  subtitle: Text('Only include vegetarian meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _isVegetarian = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  value: _isVegan,
                  title: Text('Vegan'),
                  subtitle: Text('Only include vegan meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _isVegan = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
