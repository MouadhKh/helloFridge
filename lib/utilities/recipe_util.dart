import 'package:hello_fridge/entities/ingredient.dart';
import 'package:hello_fridge/entities/recipe.dart';
import 'package:collection/collection.dart';

class RecipeUtility {
  static Function unOrdDeepEq = const DeepCollectionEquality.unordered().equals;

  static List<Recipe> findBestMatch(
      Set<Ingredient> ingredients, Set<Recipe> recipes) {
    //TODO Quantity is not taken into consideration in this but have to be done
    return recipes
        .where((recipe) => unOrdDeepEq(recipe.ingredients, ingredients))
        .toList();
  }
}
