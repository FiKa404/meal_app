import 'package:flutter/material.dart';
import '../widget/mealItem.dart';
import '../module/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {

    if(favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorite meals yet'),
      );
    }

    else {
      return ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: favoriteMeals[index].id,
              imageUrl: favoriteMeals[index].imageUrl,
              title: favoriteMeals[index].title,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability,
            );
          },
          itemCount: favoriteMeals.length
      );
    }
  }
}