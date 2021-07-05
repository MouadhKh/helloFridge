import 'ingredient.dart';

class Recipe {
  String _name;
  String _imagePath;
  Set<Ingredient> _ingredients;
  List<String> _preparationSteps;

  Recipe(
      this._name, this._ingredients, this._preparationSteps, this._imagePath);

  static Set<Recipe> getDummyRecipes() {
    //TODO: change
    Set<Ingredient> tomatoRiceIngredients = Ingredient.getDummyIngredients();
    tomatoRiceIngredients.map((e) {
      if (e.name == "Spices") {
        e.quantity = 10;
        return e;
      } else if (e.name == "Olive oil") {
        e.quantity = 50;
        e.unit = ["ml"];
        return e;
      } else if (e.name == "Chicken Breast") e.quantity = 150;
      return e;
    });
    List<String> tomatoPreparationSteps = [
      "Cook the rice",
      "Add the apple",
      "Add the banana",
      "Add the tomato",
      "Add the banana",
      "Add the orange",
      "Serve with juice"
    ];
    Recipe tomatoRice = Recipe(
        "Tomato Rice",
        tomatoRiceIngredients,
        generatePreparationSteps(tomatoPreparationSteps),
        "assets/images/tomatoes_rice.jpg");
    return <Recipe>{tomatoRice};
  }

  static List<String> generatePreparationSteps(List<String> steps) {
    return steps.asMap().entries.map((entry) {
      int idx = entry.key;
      String val = entry.value;
      return "${idx + 1}. $val";
    }).toList();
  }

  List<String> get preparationSteps => _preparationSteps;

  set preparationSteps(List<String> value) {
    _preparationSteps = value;
  }

  Set<Ingredient> get ingredients => _ingredients;

  set ingredients(Set<Ingredient> value) {
    _ingredients = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get imagePath => _imagePath;
}
