import 'package:flutter/material.dart';
import '../widget/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters';

  final Function saveFilter;
  final Map<String,bool> currentFilters;
  FiltersScreen(this.saveFilter,this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;

  @override
  initState() {

     isGlutenFree = widget.currentFilters['gluten'];
     isLactoseFree = widget.currentFilters['lactose'];
     isVegan = widget.currentFilters['vegan'];
     isVegetarian = widget.currentFilters['vegetarian'];
    super.initState();

  }

  Widget buildSwitchListTile(
      String title, String subTitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subTitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){

              final selectedFilters ={
              'gluten' : isGlutenFree,
              'lactose' : isLactoseFree,
              'vegan' : isVegan,
              'vegetarian' : isVegetarian,

              };
               widget.saveFilter(selectedFilters);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection ',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile('Gluten-free',
                    'Only include Gluten-free meals', isGlutenFree, (newVal) {
                  setState(() {
                    isGlutenFree = newVal;
                  });
                }),
                buildSwitchListTile('Lactose-free',
                    'Only include Lactose-free meals', isLactoseFree, (newVal) {
                  setState(() {
                    isLactoseFree = newVal;
                  });
                }),
                buildSwitchListTile(
                    'Vegetarian', 'Only include Vegetarian meals', isVegetarian,
                    (newVal) {
                  setState(() {
                    isVegetarian = newVal;
                  });
                }),
                buildSwitchListTile(
                    'Vegan', 'Only include Vegan meals', isVegan, (newVal) {
                  setState(() {
                    isVegan = newVal;
                  });
                })
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }

}