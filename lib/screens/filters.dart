import 'package:flutter/material.dart';

import '../widgets/drawerWidget.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text('Filter'),
      ),
    );
  }
}
