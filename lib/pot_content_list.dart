import 'package:flutter/material.dart';
import 'package:hello_fridge/entities/pot_content.dart';
import 'package:hello_fridge/entities/ingredient.dart';

class PotContentList extends StatelessWidget {
  final PotContent potContent =
      PotContent.fromIngredients(ingredients: Ingredient.getDummyIngredients());

  //TODO investigate
  // const PotContentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Pot"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 80, bottom: 80, right: 20, left: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pot currently contains:",
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: _getLeadingWidget(index),
                  title: Text(
                      potContent.ingredients.elementAt(index).name.toString()),
                  dense: true,
                  subtitle: Text(potContent.ingredients
                          .elementAt(index)
                          .quantity
                          .toString() +
                      " " +
                      potContent.ingredients.elementAt(index).unit.toString()),
                );
              },
              itemCount: potContent.getPotSize(),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 2,
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(padding: EdgeInsets.all(10.0)),
                onPressed: () {},
                child: SizedBox(
                    width: 120,
                    child: Row(children: [
                      Icon(Icons.add_box_outlined),
                      SizedBox(width: 4),
                      Text("Fill pot")
                    ])))
          ],
        ),
      ),
    );
  }

  Widget? _getLeadingWidget(int index) {
    if (potContent.ingredients.elementAt(index).imagePath != null) {
      return CircleAvatar(
        radius: 32,
        backgroundColor: Colors.transparent,
        child: ClipOval(
          child: Image.asset(
            potContent.ingredients.elementAt(index).imagePath.toString(),
          ),
        ),
      );
    }
    return null;
  }
}
