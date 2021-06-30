import 'package:flutter/material.dart';


class RecipesSuggestionsLayout extends StatefulWidget {
  const RecipesSuggestionsLayout({Key? key}) : super(key: key);

  @override
  _RecipesSuggestionsLayoutState createState() => _RecipesSuggestionsLayoutState();
}

class _RecipesSuggestionsLayoutState extends State<RecipesSuggestionsLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Recipes Suggestions"),
    ),
    );
  }
}