import 'package:flutter/material.dart';
import 'package:hello_fridge/single_ingredient.dart';

import 'entities/ingredient.dart';

class SingleIngredientIcon extends StatelessWidget {
  final Ingredient ingredient;

  SingleIngredientIcon(this.ingredient);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.lightGreen,
                      width: 1,
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SingleIngredientLayout(
                                    ingredientsName: ingredient.name,
                                    imagePath: ingredient.imagePath,
                                    unit: ingredient.unit)));
                      },
                      child: Image.asset(ingredient.imagePath,
                          height: 40, width: 40)),
                )),
          ),
          Text(ingredient.name)
        ],
      ),
    );
  }
}
