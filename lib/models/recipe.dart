import '../data/ingredient_box.dart';
import '../data/step_box.dart';

class Recipe {
  String id;
  String title;
  String? description;
  String? category;
  String? imageUrl;
  final List<IngredientBox> ingredients;
  final List<StepBox> steps;

  Recipe({
    this.id = '0',
    required this.title,
    this.description,
    this.category,
    this.imageUrl,
    required this.ingredients,
    required this.steps,
  });

  factory Recipe.fromApi(Map<String, dynamic> data) {
    final ingredients = <IngredientBox>[];
    for (int i = 1; i <= 20; i++) {
      final ingredient = data['strIngredient$i']?.trim();
      final measure = data['strMeasure$i']?.trim();
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(IngredientBox(
          name: '$ingredient (${measure ?? ''})',
          imageUrl:
              'https://www.themealdb.com/images/ingredients/$ingredient.png',
        ));
      }
    }

    final steps = <StepBox>[];
    final instructions = data['strInstructions']?.trim();
    if (instructions != null && instructions.isNotEmpty) {
      final stepsList = instructions
          .split('\r\n')
          .where((step) => step.trim().isNotEmpty)
          .toList();
      for (var i = 0; i < stepsList.length; i++) {
        steps.add(StepBox(
          stepNumber: i + 1,
          description: stepsList[i].trim(),
        ));
      }
    }

    return Recipe(
      id: data['idMeal'] ?? '0',
      title: data['strMeal'] ?? 'Unknown Recipe',
      description: data['strInstructions'] ?? '',
      category: data['strCategory'] ?? '',
      imageUrl: data['strMealThumb'] ?? '',
      ingredients: ingredients,
      steps: steps,
    );
  }
}
