class Ingredient {
  late String _name;
  late int _quantity;
  late List<String> _unit;
  late String _description;
  late String _imagePath;

  // String? _name;
  // int? _quantity;
  // List<String>? _unity;
  // String? _description;
  // String? _imagePath;

  Ingredient(
      {String description = "",
      String imagePath = "",
      required String name,
      required int quantity,
      required List<String> unit}) {
    this._name = name;
    this._quantity = quantity;
    this._unit = unit;
    this._description = description;
    this._imagePath = imagePath;
  }

  static clone(Ingredient ingredient) {
    return Ingredient(
        name: ingredient.name,
        imagePath: ingredient.imagePath,
        description: ingredient.description,
        quantity: ingredient.quantity,
        unit: ingredient.unit);
  }

  static Set<Ingredient> getDummyIngredients() {
    Ingredient rice = Ingredient(
        name: "Rice",
        quantity: 200,
        unit: ["gram"],
        imagePath: "assets/images/rice.png");
    Ingredient spices = Ingredient(
        name: "Spices",
        quantity: 50,
        unit: ["gram"],
        imagePath: "assets/images/spice.png");
    Ingredient chickenBreast = Ingredient(
        name: "Chicken Breast",
        quantity: 500,
        unit: ["gram"],
        imagePath: "assets/images/chicken-breast.png");
    Ingredient oliveOil = Ingredient(
        name: "Olive oil",
        quantity: 100,
        unit: ["ml"],
        imagePath: "assets/images/oil.png");
    Ingredient tomatoes = Ingredient(
        name: "Tomato",
        quantity: 2,
        unit: [""],
        imagePath: "assets/images/tomato.png");
    Set<Ingredient> ingredientsList =
        [rice, spices, chickenBreast, oliveOil, tomatoes].toSet();
    return ingredientsList;
  }

  String get imagePath => _imagePath;

  String get description => _description;

  List<String> get unit => _unit;

  int get quantity => _quantity;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  @override
  bool operator ==(Object other) =>
      //TODO implement stricter equality
      other is Ingredient && other.name == name;

  @override
  // TODO: implement a real hashCode
  int get hashCode => name.hashCode;

  set quantity(int value) {
    _quantity = value;
  }

  set imagePath(String value) {
    _imagePath = value;
  }

  set description(String value) {
    _description = value;
  }

  set unit(List<String> value) {
    _unit = value;
  }
}
