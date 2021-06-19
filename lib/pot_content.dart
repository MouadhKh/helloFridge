import 'ingredient.dart';

class PotContent {
  late List<Ingredient> _ingredients;

  PotContent() {
    this._ingredients = [];
  }

  PotContent.fromIngredients({required List<Ingredient> ingredients}) {
    this._ingredients = ingredients;
  }

  List<Ingredient> get ingredients => _ingredients;

  int getPotSize() {
    return this._ingredients.length;
  }
}
