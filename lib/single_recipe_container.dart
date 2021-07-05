import 'package:flutter/material.dart';
import 'package:hello_fridge/single_recipe_layout.dart';

import 'entities/recipe.dart';

class SingleRecipeContainer extends StatelessWidget {
  final Recipe recipe;
  final double height;
  final double width;

  SingleRecipeContainer(this.recipe, this.height, this.width);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.lightGreen,
                    width: 1,
                  )),
              margin: EdgeInsets.all(8),
              height: this.height,
              width: this.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SingleRecipeLayout(recipe)));
                    },
                    child: Image.asset(recipe.imagePath,
                        height: this.height - 50, width: this.width - 50)),
              )),
          Text(recipe.name)
        ],
      ),
    );
  }
}
