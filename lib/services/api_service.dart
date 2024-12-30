import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';

class ApiService {
  final String baseUrl = "https://www.themealdb.com/api/json/v1/1";

  Future<List<Recipe>> fetchRecipes() async {
    final response = await http.get(Uri.parse("$baseUrl/search.php?s="));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List recipes = data['meals'] ?? [];
      return recipes.map((recipe) => Recipe.fromJson(recipe)).toList();
    } else {
      throw Exception("Failed to load recipes");
    }
  }

  Future<Recipe?> fetchRecipeDetails(String id) async {
    final response = await http.get(Uri.parse("$baseUrl/lookup.php?i=$id"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Recipe.fromJson(data['meals'][0]);
    } else {
      throw Exception("Failed to load recipe details");
    }
  }
}
