import 'package:flutter/material.dart';
import 'package:hello_fridge/pot_widget.dart';
import 'package:hello_fridge/recipes_suggestions_layout.dart';


import 'main.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello Fridge"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Pot(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(padding: EdgeInsets.all(10.0)),
                    onPressed: () {},
                    child: SizedBox(
                        width: 120,
                        height: 20,
                        child: Row(children: [
                          Icon(Icons.add_box_outlined),
                          SizedBox(width: 4),
                          Text("Fill pot")
                        ]))),
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(padding: EdgeInsets.all(10.0)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RecipesSuggestionsLayout()));
                  },
                  child: SizedBox(
                      width: 130,
                      height: 20,
                      child: Row(
                        children: [
                          Icon(
                            Icons.restaurant,
                            size: 24,
                          ),
                          Text(" Get recipes", textAlign: TextAlign.center),
                        ],
                      ))),
              TabBarFlexibleFractioallyRecipes()
            ],
          ),
        ));
  }
}

class TabBarFlexibleFractioallyRecipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
            padding: EdgeInsets.only(top: 15.0),
            child:
                TabBarRecipes()));
  }
}

class TabBarRecipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: greenTheme,
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: AppBar(
              primary: false,
              toolbarHeight: kMinInteractiveDimension,
              automaticallyImplyLeading: false,
              titleSpacing: 0.0,
              bottom: TabBar(
                tabs: [
                  Tab(
                    iconMargin: EdgeInsets.zero,
                    icon: Icon(Icons.history, size: 16),
                  ),
                  Tab(
                      iconMargin: EdgeInsets.zero,
                      icon: Icon(
                        Icons.star,
                        size: 16.0,
                      )),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              CustomScrollView(
                shrinkWrap: true,
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.all(20.0),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        <Widget>[
                          const Text("Mayo Fries"),
                          const Text("Ketchup Fries"),
                          const Text('Curry Fries'),
                          const Text('Happy Fries'),
                          const Text('Sour Sour Rice'),
                          const Text('Crazy Fries'),
                          const Text('Ugly Fries'),
                          const Text('Avocado Fries'),
                          const Text('Garlic Fries'),
                          const Text('Spicy Fries'),
                          const Text('Sweet Sour Rice'),
                          const Text('Sweet Fries'),
                          const Text('Sour Fries'),
                          const Text('Tomatoe Rice'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CustomScrollView(
                shrinkWrap: true,
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.all(20.0),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        <Widget>[
                          const Text('Sweet Sour Rice'),
                          const Text('Tomatoe Rice'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
