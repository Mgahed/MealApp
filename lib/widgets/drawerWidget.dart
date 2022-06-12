import 'package:flutter/material.dart';

import '../functions/capitalize.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            accountName: Text("Abdelrhman",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inverseSurface)),
            accountEmail: Text("mgahed@mrtechnawy.com",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inverseSurface)),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: Text(
                "Abdelrhman"[0].toUpperCase(),
                style: TextStyle(
                    fontSize: 40.0,
                    color: Theme.of(context).colorScheme.secondaryContainer),
              ),
            ),
          ),
          buildListTile(context, 'bottom-tabs', 'Home'),
          buildListTile(context, 'filters', 'Filters'),
        ],
      ),
    );
  }

  ListTile buildListTile(BuildContext context, route, title) {
    return ListTile(
      title: Text(title),
      leading: title == 'Home'
          ? const Icon(Icons.home)
          : const Icon(Icons.filter_alt),
      onTap: () {
        Navigator.of(context).pushReplacementNamed('/$route');
      },
      // textColor: Theme.of(context).indicatorColor,
    );
  }
}
