import 'package:flutter/material.dart';
import 'package:hello_fridge/main.dart';
import 'package:hello_fridge/single_recipe_container.dart';
import 'package:hello_fridge/single_recipe_preparation_layout.dart';
import 'package:hello_fridge/sign_in.dart';

import 'entities/recipe.dart';

class SingleRecipeLayout extends StatelessWidget {
  late Recipe recipe;

  SingleRecipeLayout(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.name), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.logout),
          tooltip: 'Log out',
          onPressed: () {
            ingredientsInPot.clear();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SignInLayout()));
          },
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Expanded(
              child: Container(
                  width: double.infinity,
                  child: Image.asset(recipe.imagePath))),
          SizedBox(
            height: 60,
          ),
          Container(
            height: 30,
            margin: EdgeInsets.only(left: 10, top: 70),
            child: Text(
              "Ingredients",
              style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Lobster',
                  color: Colors.lightGreen),
            ),
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
                    " ${ing.quantity} ${ing.unit.first} ${ing.name} ",
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }).toList(),
            ),
          ),
          // Container(
          //   alignment: Alignment.bottomCenter,
          //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          //   child: Row(children: [
          //     // TODO implement dynamic favorites
          //     /*Flexible(
          //         child: Container(
          //       alignment: Alignment.bottomLeft,
          //       child: ElevatedButton(
          //           style: ElevatedButton.styleFrom(
          //               padding: EdgeInsets.all(0)),
          //           onPressed: () {},
          //           child: SizedBox(
          //               width: 130,
          //               height: 20,
          //               child: Row(
          //                 children: [
          //                   Icon(
          //                     Icons.star,
          //                     size: 24,
          //                   ),
          //                   Text(" Add to favorites",
          //                       textAlign: TextAlign.center),
          //                 ],
          //               ))),
          //     )),*/
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.all(0)),
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
                        Text(" Show preparation", textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
