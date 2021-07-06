import 'package:flutter/material.dart';
import 'package:hello_fridge/ingredients_container.dart';
import 'package:hello_fridge/pot_content_list.dart';
import 'package:hello_fridge/pot_widget.dart';
import 'package:hello_fridge/sign_in.dart';
import 'package:hello_fridge/main.dart';


class FillPotLayout extends StatefulWidget {
  const FillPotLayout({Key? key}) : super(key: key);

  @override
  _FillPotLayoutState createState() => _FillPotLayoutState();
}

class _FillPotLayoutState extends State<FillPotLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Pot"),
          actions: <Widget>[IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Log out',
            onPressed: () {
              ingredientsInPot.clear();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SignInLayout()));
            },
          ),
          ],
        ),
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
