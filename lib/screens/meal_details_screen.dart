import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = "/category-meals/details";
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final mealTitle = routeArgs["title"];

    final mealId = routeArgs["id"];

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    Widget buildSectionTitle(BuildContext context, String text) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: Theme.of(context).textTheme.title,
        ),
      );
    }

    Widget buildContainer(Widget child, double buildHeight) {
      return Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Theme.of(context).accentColor),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          height: buildHeight,
          width: 300,
          child: child);
    }

    return LayoutBuilder(builder: (builder, constraints) {
      return Container(
        child: Column(
          children: [
            Container(
              height: constraints.maxHeight,
              child: Scaffold(
                appBar: AppBar(
                  title: Text(" ${selectedMeal.title}"),
                ),
                body: Column(
                  children: [
                    Container(
                      height: constraints.maxHeight*0.2,
                      width: double.infinity,
                      child: Image.network(
                        selectedMeal.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    buildSectionTitle(context, "Ingredient"),
                    buildContainer(
                      ListView.builder(
                        itemBuilder: (context, index) => Card(
                          color: Theme.of(context).accentColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              selectedMeal.ingredients[index],
                            ),
                          ),
                        ),
                        itemCount: selectedMeal.ingredients.length,
                      ),  constraints.maxHeight*0.3),
                    
                    buildSectionTitle(context, "Steps"),
                    buildContainer(
                      ListView.builder(
                        itemBuilder: (context, index) => Card(
                          child: Text(
                            selectedMeal.steps[index],
                          ),
                        ),
                        itemCount: selectedMeal.steps.length,
                      ), constraints.maxHeight*0.2
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
