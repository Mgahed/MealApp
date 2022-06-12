import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

import 'drawerWidget.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(40),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES.map((category) {
        return ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/category-meal',
                arguments: {"id": category.id, "title": category.title});
          },
          style: ElevatedButton.styleFrom(
            textStyle: Theme.of(context).textTheme.headline5,
            primary: category.color,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(category.title),
        );
      }).toList(),
    );
  }
}
