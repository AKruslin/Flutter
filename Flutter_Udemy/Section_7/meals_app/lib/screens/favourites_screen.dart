import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavouritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
      child: Text('There is no favourites'),);
    }
    else
    {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            favoriteMeals[index].id,
            favoriteMeals[index].title,
            favoriteMeals[index].imageUrl,
            favoriteMeals[index].complexity,
            favoriteMeals[index].affordability,
            favoriteMeals[index].duration,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}