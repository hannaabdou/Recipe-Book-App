class Recipe {
  String id;
  String title;
  String? description;
  String? imageUrl;
  List<String> ingredients;
  List<String> steps;
  bool isFavorite;

  Recipe({
    required this.id,
    required this.title,
    this.description,
    this.imageUrl,
    required this.ingredients,
    required this.steps,
    this.isFavorite = false,
  });
  factory Recipe.fromApi(Map<String, dynamic> data) {
    final ingredients = <String>[];
    final steps = <String>[];

    for (int i = 1; i <= 20; i++) {
      final ingredient = data['strIngredient$i'];
      final measure = data['strMeasure$i'];
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add('$measure $ingredient');
      }
    }
    final instructions = data['strInstructions'];
    if (instructions != null) {
      steps.addAll(instructions.split('\r\n'));
    }
    return Recipe(
      id: data['idMeal'],
      title: data['strMeal'],
      description: data['strCategory'],
      imageUrl: data['strMealThumb'],
      ingredients: ingredients,
      steps: steps,
    );
  }
}
