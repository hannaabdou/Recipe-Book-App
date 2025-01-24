import 'package:flutter/material.dart';
import 'package:recipe_book_app/screens/HomePage.dart';
import 'package:recipe_book_app/screens/SearchPage.dart';
import '../models/recipe.dart'; // Import the Recipe model

class SavedRecipesPage extends StatelessWidget {
  final List<Recipe> _savedRecipes = [
    Recipe(idMeal: "1", strMeal: "Traditional spare ribs"),
    Recipe(idMeal: "2", strMeal: "Lamb chops with fruity salsa"),
    Recipe(idMeal: "3", strMeal: "Roasted chicken with flavored rice"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Recipes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _savedRecipes.length,
          itemBuilder: (context, index) {
            final recipe = _savedRecipes[index];
            return ListTile(
              title: Text(recipe.strMeal),
              onTap: () {
                // Navigate to recipe details page if needed
              },
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          } else if (index == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SearchPage()));
          }
        },
      ),
    );
  }
}
