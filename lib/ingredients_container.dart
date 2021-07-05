import 'package:flutter/material.dart';
import 'package:hello_fridge/single_ingredient_icon.dart';
import 'package:string_similarity/string_similarity.dart';
import 'entities/ingredient.dart';

class IngredientsContainer extends StatefulWidget {
  const IngredientsContainer({Key? key}) : super(key: key);

  @override
  _IngredientsContainerState createState() => _IngredientsContainerState();
}

class _IngredientsContainerState extends State<IngredientsContainer> {
  late Set<Ingredient> ingredients;
  var searchController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    searchController.dispose();
    super.dispose();
  }

  void updateResults(String newValue) {
    if (newValue.isEmpty) {
      ingredients = Ingredient.getDummyIngredients();
    } else {
      print("new Value = $newValue");
      ingredients = this.ingredients.where((ing) {
        double similarity =
            StringSimilarity.compareTwoStrings(ing.name, newValue);
        print("$similarity for ${ing.name}");
        return similarity > 0.2;
      }).toSet();
      ingredients.forEach((element) {
        print("found ${element.name}");
      });
    }

    setState(() {});
  }

  Widget _searchBar(Set<Ingredient> ingredients) {
    return Row(
      children: <Widget>[
        IconButton(
          splashColor: Colors.grey,
          icon: Icon(Icons.restaurant),
          onPressed: null,
        ),
        Expanded(
          child: TextField(
            controller: searchController,
            // onChanged: (newValue) {
            //   updateResults(newValue);
            // },
            cursorColor: Colors.black,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.go,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                hintText: "Search..."),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            icon: Icon(
              Icons.search,
              color: Color(0xff9ccc65),
            ),
            onPressed: () {
              updateResults(searchController.text);
            },
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    this.ingredients = Ingredient.getDummyIngredients();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        Expanded(flex: 1, child: _searchBar(this.ingredients)),
        Expanded(flex: 5, child: IngredientsGrid(this.ingredients))
      ]),
    );
  }
}

class IngredientsGrid extends StatelessWidget {
  Set<Ingredient> ingredients;

  IngredientsGrid(this.ingredients);

  List<Widget> _buildIngredients() {
    return this.ingredients.map((ing) => SingleIngredientIcon(ing)).toList();
  }

  // const IngredientsGrid({
  //   Key? key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.ingredients.forEach((ing) => print(ing.name + ","));
    return ListView(
      children: <Widget>[
        GridView.count(
            crossAxisCount: 3,
            // physics: NeverScrollableScrollPhysics(),
            // to disable GridView's scrolling
            shrinkWrap: true,
            // You won't see infinite size error
            children: _buildIngredients()),
        // ...... other list children.
      ],
    );
  }
}
