import 'package:flutter/material.dart';

import '../widgets/drawerWidget.dart';
import 'bottomBar.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Favorites'),
      ),
    );
  }
}
