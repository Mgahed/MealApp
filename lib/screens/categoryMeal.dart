import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dummy_data.dart';
import '../widgets/drawerWidget.dart';

class CategoryMeal extends StatefulWidget {
  const CategoryMeal({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CategoryMeal> createState() => _CategoryMealState();
}

class _CategoryMealState extends State<CategoryMeal> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  void initState() {
    super.initState();
    getData();
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
    final category =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = category['title'];
    final categoryId = category['id'];

    final meals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId) &&
          (_isGlutenFree
              ? meal.isGlutenFree == true
              : (meal.isGlutenFree == true || meal.isGlutenFree == false)) &&
          (_isLactoseFree
              ? meal.isLactoseFree == true
              : (meal.isLactoseFree == true || meal.isLactoseFree == false)) &&
          (_isVegan
              ? meal.isVegan == true
              : (meal.isVegan == true || meal.isVegan == false)) &&
          (_isVegetarian
              ? meal.isVegetarian == true
              : (meal.isVegetarian == true || meal.isVegetarian == false));
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle ?? widget.title),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                '/meal-detail',
                arguments: {"id": meals[index].id, "title": meals[index].title},
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 2,
              margin: const EdgeInsets.all(10),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.infinity,
                        child: Image.network(
                          meals[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 10,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          color: Colors.black54,
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 20,
                          ),
                          child: Text(
                            meals[index].title,
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.fontSize,
                              color: Colors.white,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton.icon(
                          icon: const Icon(Icons.access_time_rounded),
                          onPressed: () {},
                          label:
                              Text("${meals[index].duration.toString()} min"),
                        ),
                        TextButton.icon(
                          icon: const Icon(Icons.work),
                          onPressed: () {},
                          label: Text(
                              meals[index].complexity.toString().split(".")[1]),
                        ),
                        TextButton.icon(
                          icon: const Icon(Icons.attach_money),
                          onPressed: () {},
                          label: Text(meals[index]
                              .affordability
                              .toString()
                              .split(".")[1]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
