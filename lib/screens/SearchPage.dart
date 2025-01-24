import 'package:flutter/material.dart';
import 'package:recipe_book_app/screens/HomePage.dart';
import 'package:recipe_book_app/screens/savedrecipe.dart';
import '../services/api_service.dart'; // Import the ApiService
import '../models/recipe.dart'; // Import the Recipe model

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ApiService _apiService = ApiService();
  List<Recipe> _searchResults = [];
  final TextEditingController _searchController = TextEditingController();

  Future<void> _searchRecipes(String query) async {
    try {
      final recipes = await _apiService.fetchRecipes();
      setState(() {
        _searchResults = recipes
            .where((recipe) =>
                recipe.strMeal.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } catch (e) {
      print("Failed to search recipes: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Recipes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search recipe',
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                _searchRecipes(query);
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  final recipe = _searchResults[index];
                  return ListTile(
                    title: Text(recipe.strMeal),
                    onTap: () {
                      // Navigate to recipe details page if needed
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          } else if (index == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SavedRecipesPage()));
          }
        },
      ),
    );
  }
}
