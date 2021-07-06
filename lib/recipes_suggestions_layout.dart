import 'package:flutter/material.dart';
import 'package:hello_fridge/main.dart';
import 'package:hello_fridge/single_recipe_container.dart';
import 'package:hello_fridge/utilities/recipe_util.dart';
import 'package:hello_fridge/sign_in.dart';

import 'entities/recipe.dart';

class RecipesSuggestionsLayout extends StatefulWidget {
  const RecipesSuggestionsLayout({Key? key}) : super(key: key);

  @override
  _RecipesSuggestionsLayoutState createState() =>
      _RecipesSuggestionsLayoutState();
}

class _RecipesSuggestionsLayoutState extends State<RecipesSuggestionsLayout> {
  List<Widget> _recipesWidgets() {
    return RecipeUtility.findBestMatch(
            ingredientsInPot, Recipe.getDummyRecipes())
        .map((recipe) {
      return SingleRecipeContainer(recipe,120,120);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recipes Suggestions"),
          actions: <Widget>[IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Log out',
            onPressed: () {
              ingredientsInPot.clear();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SignInLayout()));
            },
          ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  "With your ingredients, you could cook: ",
                  style: TextStyle(color: Colors.deepOrange.shade300, fontStyle: FontStyle.italic),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ListView(
                children: <Widget>[
                  GridView.count(
                      crossAxisCount: 2,
                      // physics: NeverScrollableScrollPhysics(),
                      // to disable GridView's scrolling
                      shrinkWrap: true,
                      // You won't see infinite size error
                      children: _recipesWidgets())
                ],
              ),
            ),
          ],
        ));
  }
}
