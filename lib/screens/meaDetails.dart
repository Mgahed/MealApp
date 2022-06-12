import 'package:flutter/material.dart';

import '../dummy_data.dart';
import 'package:meal_app/models/meal.dart';

class MealDetails extends StatefulWidget {
  const MealDetails({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  @override
  Widget build(BuildContext context) {
    final meal =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final mealTitle = meal['title'];
    final mealId = meal['id'];

    final mealDetails = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(mealTitle ?? widget.title),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: Image.network(
                mealDetails.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text("Ingredients",
                    style: Theme.of(context).textTheme.headline6),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: buildListView(mealDetails, "ingredients"),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.grey,
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.all(10),
                child:
                    Text("Steps", style: Theme.of(context).textTheme.headline6),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: buildListView(mealDetails, "steps"),
            ),
          ],
        ),
      ),
    );
  }

  ListView buildListView(Meal mealDetails, String listType) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listType == "ingredients"
          ? mealDetails.ingredients.length
          : mealDetails.steps.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (ctx, index) => GestureDetector(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 2,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: (listType != "ingredients")
                        ? CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            child: Text(
                              "${index + 1}",
                            ),
                          )
                        : const Text(""),
                    title: Text(listType == "ingredients"
                        ? mealDetails.ingredients[index]
                        : mealDetails.steps[index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
