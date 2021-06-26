class Ingredient {
  String? _name;
  int? _quantity;
  List<String>? _unity;
  String? _description;
  String? _imagePath;

  Ingredient(
      {String description = "",
      String? imagePath,
      required String name,
      required int quantity,
      required List<String> unity}) {
    this._name = name;
    this._quantity = quantity;
    this._unity = unity;
    this._description = description;
    this._imagePath = imagePath;
  }

  static List<Ingredient> getDummyIngredients() {
    Ingredient rice = Ingredient(
        name: "Rice",
        quantity: 200,
        unity: ["gram", "kilogram"],
        imagePath: "assets/images/rice.png");
    Ingredient spices = Ingredient(
        name: "Spices",
        quantity: 50,
        unity: ["gram"],
        imagePath: "assets/images/spice.png");
    Ingredient chickenBreast = Ingredient(
        name: "Chicken Breast",
        quantity: 500,
        unity: ["gram", "kilogram"],
        imagePath: "assets/images/chicken-breast.png");
    Ingredient oliveOil = Ingredient(
        name: "Olive oil",
        quantity: 100,
        unity: ["ml", "L"],
        imagePath: "assets/images/oil.png");
    Ingredient tomatoes = Ingredient(
        name: "Tomato",
        quantity: 2,
        unity: [""],
        imagePath: "assets/images/tomato.png");
    List<Ingredient> ingredientsList = [rice, spices, chickenBreast, oliveOil,tomatoes];
    return ingredientsList;
  }

  String? get imagePath => _imagePath;

  String? get description => _description;

  List<String>? get unity => _unity;

  int? get quantity => _quantity;

  String? get name => _name;
}
