import 'ingredient.dart';

class PotContent {
  late Set<Ingredient> _ingredients;

  PotContent() {
    this._ingredients = <Ingredient>{};
  }

  PotContent.fromIngredients({required Set<Ingredient> ingredients}) {
    this._ingredients = ingredients;
  }

  Set<Ingredient> get ingredients => _ingredients;

  int getPotSize() {
    return this._ingredients.length;
  }
}
