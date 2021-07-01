import 'package:flutter/material.dart';
import 'package:hello_fridge/single_recipe_layout.dart';


class RecipesSuggestionsLayout extends StatefulWidget {
  const RecipesSuggestionsLayout({Key? key}) : super(key: key);

  @override
  _RecipesSuggestionsLayoutState createState() => _RecipesSuggestionsLayoutState();
}

class _RecipesSuggestionsLayoutState extends State<RecipesSuggestionsLayout> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Recipes Suggestions"),
    ),
      body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  height: 200,
                  width: 200,
                  color: Colors.black12,
                    child: GestureDetector(
                      onTap: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SingleRecipeLayout()));
                      },
                      child: Text("Mayo Fries")
                      ),

                ),
                Container(
                  margin: EdgeInsets.all(8),
                  height: 200,
                  width: 200,
                  color: Colors.black12,
                  child: Text("Ketchup Fries"),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  height: 200,
                  width: 200,
                  color: Colors.black12,
                  child: Text('Curry Fries'),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  height: 200,
                  width: 200,
                  color: Colors.black12,
                  child: Text('Happy Fries'),
                )
              ],
            )
          )
      ),
    );
  }
}