import 'package:flutter/material.dart';
import 'package:hello_fridge/ingredient.dart';
import 'package:hello_fridge/pot_content.dart';
import 'package:hello_fridge/pot_content_list.dart';

//TODO need to become stateful with dynamic data later !
class Pot extends StatelessWidget {
  //This doesn't make sense in a real app

  final PotContent potContent =
      PotContent.fromIngredients(ingredients: Ingredient.getDummyIngredients());

  // const Pot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PotContentList()));
              },
              child: Image.asset(
                'assets/images/green_pot.png',
                fit: BoxFit.cover,
                height: 180,
                width: 180,
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Text(
                potContent.getPotSize().toString(),
                style: TextStyle(
                    fontFamily: 'Pacifico', fontSize: 64, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
