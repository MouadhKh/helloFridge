import 'package:flutter/material.dart';
import 'package:hello_fridge/single_recipe_container.dart';

import 'entities/recipe.dart';
import 'main_layout.dart';

class SingleRecipePreparationLayout extends StatelessWidget {
  Recipe recipe;

  SingleRecipePreparationLayout(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: SingleRecipeContainer(recipe, 250, 250),
          ),
          Container(
            child: Column(
              children: [
                Text("Preparation",
                    style: TextStyle(
                        fontFamily: 'Lobster',
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.lightGreen)),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomScrollView(
                    shrinkWrap: true,
                    slivers: <Widget>[
                      SliverList(
                        delegate: SliverChildListDelegate(
                          recipe.preparationSteps
                              .map((step) => Container(
                                  padding: EdgeInsets.all(2),
                                  child: Text(step,
                                      style: TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 20))))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MainLayout()));
                },
                icon: Icon(Icons.history),
                label: Text("Add to history"),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.favorite),
                label: Text("Add to favorites"),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
