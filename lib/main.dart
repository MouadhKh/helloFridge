import 'package:flutter/material.dart';
import 'package:hello_fridge/sign_in.dart';

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
