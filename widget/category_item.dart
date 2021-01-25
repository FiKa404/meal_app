import 'package:flutter/material.dart';
import '../screen/category_meals_screen.dart';

class Category_Item extends StatelessWidget {

  final String id;
  final Color color;
  final String title;

  const Category_Item(
    this.id,
    this.color,
    this.title,
  );

  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,
    arguments: {
      'id' : id,
      'title' : title,
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color,
              color.withOpacity(0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(15),
        child: Text('$title',style: TextStyle(fontSize: 20),),
      ),
      onTap: (){
        selectCategory(context);

      },
    );
  }
}