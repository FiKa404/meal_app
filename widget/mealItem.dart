import 'package:flutter/material.dart';
import '../screen/meal_details_screen.dart';
import '../module/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;


  MealItem({
    @required this.imageUrl,
    @required this.title,
    @required this.complexity,
    @required this.affordability,
    @required this.duration,
    @required this.id,
  });

  String get complexityText{
    switch(complexity){
      case Complexity.Simple : return 'Simple' ; break;
      case Complexity.Hard : return 'Hard' ; break;
      case Complexity.Challenging : return 'Challenging' ; break;
      default: return 'Unknown'; break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable :
        return 'Affordable';
        break;
      case Affordability.Pricey :
        return 'Pricey';
        break;
      case Affordability.Luxurious :
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  void selectedMeal(BuildContext ctx) {
   Navigator.of(ctx).pushNamed(MealDetailScreen.routeName,
   arguments: id,
   );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedMeal(context),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    '$imageUrl',
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      alignment: Alignment.center,
                      width: 230,
                      color: Colors.black45,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top : 10.0,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 10,),
                      Text('$duration'+"m"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 10,),
                      Text('$complexityText'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 5,),
                      Text('$affordabilityText'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
