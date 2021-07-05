import 'package:flutter/material.dart';
import 'package:hello_fridge/ingredients_container.dart';
import 'package:hello_fridge/pot_content_list.dart';
import 'package:hello_fridge/pot_widget.dart';

class FillPotLayout extends StatefulWidget {
  const FillPotLayout({Key? key}) : super(key: key);

  @override
  _FillPotLayoutState createState() => _FillPotLayoutState();
}

class _FillPotLayoutState extends State<FillPotLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Pot(), IngredientsContainer()],
        ),
      ),
    ));
  }
}
