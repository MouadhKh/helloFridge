import 'package:flutter/material.dart';


class SingleRecipeLayout extends StatefulWidget {
  const SingleRecipeLayout({Key? key}) : super(key: key);

  @override
  _SingleRecipeLayoutState createState() => _SingleRecipeLayoutState();
}

class _SingleRecipeLayoutState extends State<SingleRecipeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Mayo Fries"),
      ),
    );
  }
}