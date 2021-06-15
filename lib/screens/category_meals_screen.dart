import 'package:flutter/material.dart';
import 'package:mealapp/meal_item.dart';
import 'package:mealapp/models/meal.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meals";
  // final String categoryTitle;
  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs["title"];

    final categoryId = routeArgs["id"];
    final categoryMeal = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("$categoryTitle"),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItems(
              id: categoryMeal[index].id,
              title: categoryMeal[index].title,
              imageUrl: categoryMeal[index].imageUrl,
              affordability: categoryMeal[index].affordability,
              complexity: categoryMeal[index].complexity,
              duration: categoryMeal[index].duration);
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
