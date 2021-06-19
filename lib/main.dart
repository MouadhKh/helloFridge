import 'package:flutter/material.dart';
import 'package:hello_fridge/fill_pot_layout.dart';
import 'package:hello_fridge/pot_content_list.dart';
import 'package:hello_fridge/pot_widget.dart';
import 'package:hello_fridge/sign_in.dart';
import 'package:hello_fridge/single_ingredient.dart';
import 'package:sign_button/sign_button.dart';

void main() {
  final lightGreen = Color(0xff9ccc65);
  runApp(MaterialApp(
      theme: ThemeData(
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
              headline6: TextStyle(color: Colors.white))),
      //Scaffold take all the screen size
      home: FillPotLayout()));
  // PotContentList()));
  // Pot()));
  // SignInLayout()));
  //   SingleIngredientLayout(
  //       ingredientsName: "Bread",
  //       imagePath: "assets/images/bread.png",
  //       unit: ["Gram", "Kilogram"]),
  // ));
}
