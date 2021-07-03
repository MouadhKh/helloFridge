import 'package:flutter/material.dart';
import 'package:hello_fridge/main_layout.dart';
import 'package:hello_fridge/pot_content_list.dart';


class SingleRecipePreparationLayout extends StatefulWidget {
  const SingleRecipePreparationLayout({Key? key}) : super(key: key);

  @override
  _SingleRecipePreparationLayoutState createState() => _SingleRecipePreparationLayoutState();
}

class _SingleRecipePreparationLayoutState extends State<SingleRecipePreparationLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Mayo Fries"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/bowl.png".toString()),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              child: Text("Preparation",style: TextStyle(color: Colors.lightGreen),)
            ),
            Column(
              ),
            Flexible(
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child:Row(
                  children:[
                    Flexible(
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: ElevatedButton(
                        style:
                        ElevatedButton.styleFrom(padding: EdgeInsets.all(0)),
                        onPressed: () {},
                        child: SizedBox(
                            width: 130,
                            height: 20,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 24,
                                ),
                                Text(" Add to favorites", textAlign: TextAlign.center),
                              ],
                            )
                        )
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                          style:
                          ElevatedButton.styleFrom(padding: EdgeInsets.all(0)),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => MainLayout()));
                          },
                          child: SizedBox(
                              width: 140,
                              height: 20,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.history,
                                    size: 24,
                                  ),
                                  Text("Add to history", textAlign: TextAlign.center),
                                ],
                              ),
                          )
                      )
                    )
                  ),
                ]
              ),
            ))
          ],
        ),
      )
    );
  }
}