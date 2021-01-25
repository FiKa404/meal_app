import 'package:flutter/material.dart';
import '../module/meal.dart';
import '../widget/mealItem.dart';
import '../module/original.dart';

class CategoryMealsScreen extends StatefulWidget {

  static const routeName = 'categoryMeals';

  final List<Meal> availableMeal;

  CategoryMealsScreen(this.availableMeal);


  @override
  CategoryMealsScreenState createState() => CategoryMealsScreenState();
}

class CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> displayMeals;

  @override
  void didChangeDependencies() {
    final routeArg = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    displayMeals = widget.availableMeal.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void removeMeal(String mealId){
    setState(() {
      displayMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryTitle'),
      ),
      body: ListView.builder(
        itemBuilder: (context,index){
          return MealItem(
            id: displayMeals[index].id,
            imageUrl: displayMeals[index].imageUrl,
            title: displayMeals[index].title,
            duration: displayMeals[index].duration,
            complexity: displayMeals[index].complexity,
            affordability: displayMeals[index].affordability,
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
