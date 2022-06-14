import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/drawerWidget.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  void initState() {
    super.initState();
    getData();
    setData();
  }

  setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isGlutenFree', _isGlutenFree);
    prefs.setBool('isLactoseFree', _isLactoseFree);
    prefs.setBool('isVegan', _isVegan);
    prefs.setBool('isVegetarian', _isVegetarian);
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isGlutenFree = prefs.getBool('isGlutenFree') ?? false;
      _isLactoseFree = prefs.getBool('isLactoseFree') ?? false;
      _isVegan = prefs.getBool('isVegan') ?? false;
      _isVegetarian = prefs.getBool('isVegetarian') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text('Adjust your meal selection',
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline5?.fontSize)),
              ),
              const SizedBox(
                height: 20,
              ),
              SwitchListTile(
                title: const Text('Gluten-Free'),
                subtitle: const Text('Only include gluten-free meals'),
                value: _isGlutenFree,
                activeColor: Theme.of(context).colorScheme.primary,
                onChanged: (value) {
                  setState(() {
                    _isGlutenFree = value;
                  });
                  setData();
                },
              ),
              SwitchListTile(
                title: const Text('Lactose-Free'),
                subtitle: const Text('Only include lactose-free meals'),
                value: _isLactoseFree,
                activeColor: Theme.of(context).colorScheme.primary,
                onChanged: (value) {
                  setState(() {
                    _isLactoseFree = value;
                  });
                  setData();
                },
              ),
              SwitchListTile(
                title: const Text('Vegan'),
                subtitle: const Text('Only include vegan meals'),
                value: _isVegan,
                activeColor: Theme.of(context).colorScheme.primary,
                onChanged: (value) {
                  setState(() {
                    _isVegan = value;
                  });
                  setData();
                },
              ),
              SwitchListTile(
                title: const Text('Vegetarian'),
                subtitle: const Text('Only include vegetarian meals'),
                value: _isVegetarian,
                activeColor: Theme.of(context).colorScheme.primary,
                onChanged: (value) {
                  setState(() {
                    _isVegetarian = value;
                  });
                  setData();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
