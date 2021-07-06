import 'package:flutter/material.dart';
import 'package:hello_fridge/main.dart';
import 'package:hello_fridge/single_recipe_preparation_layout.dart';

import 'entities/recipe.dart';

class SingleRecipeLayout extends StatelessWidget {
  late Recipe recipe;

  SingleRecipeLayout(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(recipe.name),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: Image.asset(recipe.imagePath),
              ),
              Text(
                "Ingredients",
                style: TextStyle(color: Colors.lightGreen),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: recipe.ingredients.map((ing) {
                    return Container(
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        border: Border.all(color: lightGreen),
                      ),
                      height: 25,
                      child: Text(
                        " ${ing.name} ${ing.quantity} ${ing.unit}",
                        style: TextStyle(fontSize: 14),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Flexible(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Row(children: [
                    Flexible(
                        child: Container(
                      alignment: Alignment.bottomLeft,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(0)),
                          onPressed: () {},
                          child: SizedBox(
                              width: 130,
                              height: 20,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 24,
                                  ),
                                  Text(" Add to favorites",
                                      textAlign: TextAlign.center),
                                ],
                              ))),
                    )),
                    Flexible(
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(0)),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    SingleRecipePreparationLayout(recipe),
                                    // SingleRecipePreparationLayout(recipe),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: 140,
                            height: 20,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_forward,
                                  size: 24,
                                ),
                                Text(" Show preparation",
                                    textAlign: TextAlign.center),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
