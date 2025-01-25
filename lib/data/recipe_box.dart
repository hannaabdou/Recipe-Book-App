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
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
  });

  // Constructor فارغ مع قيم افتراضية
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
