import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_fridge/sign_in.dart';
import 'package:hello_fridge/entities/ingredient.dart';
import 'package:hello_fridge/main.dart';
import 'package:hello_fridge/main_layout.dart';

class SingleIngredientLayout extends StatefulWidget {
  final String? ingredientsName;
  final String? imagePath;
  final List<String>? unit;

  const SingleIngredientLayout(
      {Key? key, this.ingredientsName, this.imagePath, this.unit})
      : super(key: key);

  @override
  _SingleIngredientLayoutState createState() => _SingleIngredientLayoutState(
      this.ingredientsName, this.imagePath, this.unit);
}

class _SingleIngredientLayoutState extends State<SingleIngredientLayout> {
  String? _ingredientsName;
  String? _imagePath;
  List<String>? _unit;
  String? _selectedUnit = "";

  //TODO check unit is not empty
  _SingleIngredientLayoutState(
      String? ingredientsName, String? imagePath, List<String>? unit) {
    this._ingredientsName = ingredientsName;
    this._imagePath = imagePath;
    this._unit = unit;
    if (unit!.isNotEmpty) {
      this._selectedUnit = unit.first;
    }
  }

  var ingredientname;
  var ingredientquantity;
  var ingredientunit;
  var ingredientpath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text(_ingredientsName!), centerTitle: true,
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
        body: Container(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(children: [
                Expanded(
                  child: Container(
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        border: new Border.all(
                            color: Colors.lightGreen, width: 1.0)),
                    child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 180,
                        child: ClipOval(child: Image.asset(_imagePath!))),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 120,
                            height: 50,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Quantity'),
                                onChanged: (String? newValue) {
                                    ingredientquantity = int.parse(newValue!);
                                }
                            ),
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          SizedBox(
                            width: 100,
                            child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  labelText: 'Unity',
                                ),
                                //TODO check if its empty later
                                icon: const Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 16,
                                style:
                                    const TextStyle(color: Color(0xff9ccc65)),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedUnit = newValue!;
                                  });
                                  ingredientunit = newValue!;
                                },
                                items: _unit!.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList()),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(10.0)),
                              onPressed: () {
                                //TODO How to find out which ingredients is picked?
                                // Currentl hardcoded strict order Rice, Tomato, Spice
                                // Quantity and Unit defined by user
                                Ingredient ingredient = Ingredient(name: "bowl", quantity: ingredientquantity, unit: ["ml"],imagePath: "assets/images/bowl.png");

                                if(ingredientsInPot.length == 0){
                                      ingredient = Ingredient(
                                      name: "Rice",
                                      quantity: ingredientquantity,
                                      unit: [ingredientunit.toString()],
                                      imagePath: "assets/images/rice.png");
                                }else if(ingredientsInPot.length == 1){
                                      ingredient = Ingredient(
                                      name: "Chicken Breast",
                                      quantity: ingredientquantity,
                                      unit: [ingredientunit.toString()],
                                      imagePath: "assets/images/chicken-breast.png");
                                }else if(ingredientsInPot.length == 2){
                                      ingredient = Ingredient(
                                      name: "Tomato",
                                      quantity: ingredientquantity,
                                      unit: [ingredientunit.toString()],
                                      imagePath: "assets/images/tomato.png");
                                }else if(ingredientsInPot.length == 3){
                                      ingredient = Ingredient(
                                      name: "Olive oil",
                                      quantity: ingredientquantity,
                                      unit: [ingredientunit.toString()],
                                      imagePath: "assets/images/oil.png");
                                }else if(ingredientsInPot.length == 4){
                                  ingredient = Ingredient(
                                      name: "Spices",
                                      quantity: ingredientquantity,
                                      unit: [ingredientunit.toString()],
                                      imagePath: "assets/images/spice.png");
                                }

                                ingredientsInPot.add(ingredient);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                  builder: (context) => MainLayout()));
                              },
                          child: SizedBox(
                            width: 120,
                            child: Row(children: [
                              Icon(Icons.add),
                              SizedBox(width: 4),
                              Text("Add to pot")
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ));
  }
}
