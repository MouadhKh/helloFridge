import 'package:flutter/material.dart';

class SingleIngredientLayout extends StatefulWidget {
  const SingleIngredientLayout(
      {Key? key,
      required this.ingredientsName,
      required this.imagePath,
      required this.unit})
      : super(key: key);

  final String ingredientsName;
  final String imagePath;
  final List<String> unit;

  @override
  _SingleIngredientLayoutState createState() => _SingleIngredientLayoutState(
      this.ingredientsName, this.imagePath, this.unit);
}

class _SingleIngredientLayoutState extends State<SingleIngredientLayout> {
  late String _ingredientsName;
  late String _imagePath;
  late List<String> _unit;
  late String _selectedUnit;

  //TODO check unit is not empty
  _SingleIngredientLayoutState(
      String ingredientsName, String imagePath, List<String> unit) {
    this._ingredientsName = ingredientsName;
    this._imagePath = imagePath;
    this._unit = unit;
    if (unit.isEmpty) {
      this._selectedUnit = unit.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text(_ingredientsName), centerTitle: true),
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
                        child: ClipOval(child: Image.asset(_imagePath))),
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
                                value: _unit.first,
                                icon: const Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 16,
                                style:
                                    const TextStyle(color: Color(0xff9ccc65)),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedUnit = newValue!;
                                  });
                                },
                                items: _unit.map<DropdownMenuItem<String>>(
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10.0)),
                        onPressed: () {},
                        child: SizedBox(
                          width: 120,
                          child: Row(children: [
                            Icon(Icons.add),
                            SizedBox(width: 4),
                            Text("Add to pot")
                          ]),
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