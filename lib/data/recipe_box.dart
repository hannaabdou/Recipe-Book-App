import 'package:recipe_book_app/data/step_box.dart';

import 'ingredient_box.dart';

class RecipeBox {
  final int id;
  final String name;
  final String description;
  final String category;
  final String imageUrl;
  final List<IngredientBox> ingredients;
  final List<StepBox> steps;

  RecipeBox({
    this.id = 0,
    required this.name,
    required this.description,
    this.category = '',
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
  });

  static RecipeBox empty() {
    return RecipeBox(
      id: 0,
      name: '',
      category: '',
      ingredients: [],
      steps: [],
      description: '',
      imageUrl: '',
    );
  }
}
