import 'package:hive/hive.dart';
part 'add_recipe_model.g.dart';

@HiveType(typeId: 0)
class AddRecipeModel extends HiveObject {
  @HiveField(0)
  final int recipeId;

  @HiveField(1)
  final String recipeName;

  @HiveField(2)
  final String recipeDescription;

  @HiveField(3)
  final String recipeImgPath;

  AddRecipeModel({
    required this.recipeId,
    required this.recipeName,
    required this.recipeDescription,
    required this.recipeImgPath,
  });
}
