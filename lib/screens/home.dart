import 'package:flutter/material.dart';
import 'package:meal_app/widgets/categories.dart';

import 'bottomBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text(widget.title),
      ),*/
      body: const Categories(),
    );
  }
}
