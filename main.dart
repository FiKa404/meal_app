import 'package:flutter/material.dart';
import 'package:meal_app/module/original.dart';
import './screen/filters_screen.dart';
import './screen/tabs_screen.dart';
import 'module/meal.dart';
import 'screen/category_meals_screen.dart';
import 'screen/meal_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color c = Color(0xFFffc764);

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableMeal = DUMMY_MEALS;


  void setFilters(Map<String, bool> _filtersData) {
    setState((){
        _filters = _filtersData;
        availableMeal = DUMMY_MEALS.where((meal) {
          if (_filters['gluten'] && !meal.isGlutenFree) {
            return false;
          }
          if(_filters['lactose'] && !meal.isLactoseFree) {
            return false;
          }
          if (_filters['vegan'] && !meal.isVegan) {
            print('Done');

            return false;
          }
          if (_filters['vegetarian'] && !meal.isVegetarian) {
            return false;
          }
          return true;
        }).toList();
      },
    );
  }

  List<Meal> _favoriteMeal = [];

  void toggleFavorite(String mealId){

    final existIndex = _favoriteMeal.indexWhere((meal) =>  meal.id == mealId);

    if(existIndex >= 0){
      setState(() {
        _favoriteMeal.removeAt(existIndex);
      });
    }
    else{
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id){
    return _favoriteMeal.any((meal) => meal.id == id);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meal App',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => TabsScreen(_favoriteMeal),
          CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(availableMeal),
          MealDetailScreen.routeName: (context) => MealDetailScreen(toggleFavorite,_isMealFavorite),
          FiltersScreen.routeName: (context) => FiltersScreen(setFilters,_filters),
        });
  }
}

class Myappm extends StatefulWidget {
  @override
  _myappState createState() => _myappState();
}

class _myappState extends State<Myappm> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meal App',
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: null,
    );
  }
}
