import 'package:flutter/material.dart';
import 'package:meal_app/screens/bottomBar.dart';
import 'package:meal_app/screens/categoryMeal.dart';
import 'package:meal_app/screens/favorites.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/meaDetails.dart';
import 'package:meal_app/widgets/categories.dart';
import 'package:meal_app/screens/home.dart';
import 'package:meal_app/screens/splashScreen.dart';
import 'package:meal_app/theme/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: lightTheme,
        fontFamily: 'RobotoCondensed',
      ),
      darkTheme: ThemeData(
        colorScheme: darkTheme,
        fontFamily: 'RobotoCondensed',
      ),
      initialRoute: '/splash',
      // home: MyHomePage(),
      routes: {
        /*'/login': (context) => const Login(title: 'Login'),
        '/signup': (context) => const Signup(title: 'Login'),*/
        '/splash': (context) => const MySplashScreen(title: 'Meal App'),
        '/bottom-tabs': (context) => const BottomTabs(),
        '/home': (context) => const Home(title: 'Meal App'),
        '/category-meal': (context) => const CategoryMeal(title: 'A Meal'),
        '/meal-detail': (context) => const MealDetails(title: 'Meal Details'),
        '/favorites': (context) => const Favorites(title: 'Favorite Meals'),
        '/filters': (context) => const Filter(title: 'Filters'),
      },
    );
  }
}
