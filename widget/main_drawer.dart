import 'package:flutter/material.dart';
import '../screen/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title, IconData icon, Function tabHandler){
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        '$title',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoCondensed',
        ),
      ),
      onTap: tabHandler,
    );

  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Raleway',
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          buildListTile('Meal', Icons.restaurant,(){Navigator.of(context).pushReplacementNamed('/');}),
          buildListTile('Filters', Icons.settings,(){Navigator.of(context).pushNamed(FiltersScreen.routeName);})
        ],
      ),
    );
  }
}
