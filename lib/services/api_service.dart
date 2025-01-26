import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';

class MealService {
  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<List<Recipe>> fetchMealsByCategory(String category) async {
    final response =
        await http.get(Uri.parse('$baseUrl/filter.php?c=$category'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final meals = data['meals'] as List<dynamic>;
      return meals.map((meal) => Recipe.fromApi(meal)).toList();
    } else {
      throw Exception('Failed to load meals');
    }
  }

  Future<Recipe> fetchMealDetails(String mealId) async {
    final response = await http.get(Uri.parse('$baseUrl/lookup.php?i=$mealId'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final meal = data['meals'][0];
      return Recipe.fromApi(meal);
    } else {
      throw Exception('Failed to load meal details');
    }
  }
}
