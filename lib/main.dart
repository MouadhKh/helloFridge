import 'package:flutter/material.dart';
import 'package:hello_fridge/sign_in.dart';
import 'package:hello_fridge/entities/ingredient.dart';

//TODO initialise ingredientsInPot without rice but it`s necessary because when empty set that it`s wrong type
Ingredient rice = Ingredient(
    name: "Rice",
    quantity: 200,
    unit: ["gram"],
    imagePath: "assets/images/rice.png");
Set<Ingredient> ingredientsInPot = [rice].toSet();

final lightGreen = Color(0xff9ccc65);

final greenTheme = ThemeData(
    primaryColor: lightGreen,
    accentColor: lightGreen,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(lightGreen),
        foregroundColor: MaterialStateProperty.all<Color>(
          Colors.white,
        ), //text (and icon)
      ),
    ),
    primaryTextTheme: TextTheme(
        button: TextStyle(
            fontSize: 18,
            fontFamily: 'SourceSansPro',
            color: Colors.white),
        headline6: TextStyle(color: Colors.white)));
void main() {
  runApp(MaterialApp(
      theme: greenTheme,
      //Scaffold take all the screen size
      home: SignInLayout()));
  // PotContentList()));
  // Pot()));
  // SignInLayout()));
  //   SingleIngredientLayout(
  //       ingredientsName: "Bread",
  //       imagePath: "assets/images/bread.png",
  //       unit: ["Gram", "Kilogram"]),
  // ));
}
