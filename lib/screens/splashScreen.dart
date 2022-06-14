import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/bottomBar.dart';

import 'home.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      backgroundColor: Theme.of(context).colorScheme.background,
      loaderColor: Theme.of(context).colorScheme.secondary,
      logo: Image.asset(
        'assets/imgs/food.png',
        width: MediaQuery.of(context).size.width / 2,
      ),
      logoSize: MediaQuery.of(context).size.width / 2,
      title: const Text(
        "Meal App",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      showLoader: true,
      loadingText: const Text("Loading..."),
      // navigator: const Home(title: 'Meal App'),
      navigator: const BottomTabs(),
      durationInSeconds: 5,
    );
  }
}
