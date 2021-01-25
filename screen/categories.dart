import 'package:flutter/material.dart';
import 'package:meal_app/module/original.dart';
import 'package:meal_app/widget/category_item.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(

        children: DUMMY_CATEGORIES.map((Catdata) =>
          Category_Item(Catdata.id,Catdata.color,Catdata.title)
          ).toList(),

        padding: EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 3 / 2,
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
}
}
