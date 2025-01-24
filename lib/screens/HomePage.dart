import 'package:flutter/material.dart';
import 'package:recipe_book_app/screens/SearchPage.dart';
import 'package:recipe_book_app/screens/savedrecipe.dart';
import '../services/api_service.dart'; // Import the ApiService
import '../models/recipe.dart'; // Import the Recipe model

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService _apiService = ApiService();
  List<Recipe> _recipes = [];

  @override
  void initState() {
    super.initState();
    _fetchRecipes();
  }

  Future<void> _fetchRecipes() async {
    try {
      final recipes = await _apiService.fetchRecipes();
      setState(() {
        _recipes = recipes;
      });
    } catch (e) {
      print("Failed to load recipes: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello Hanna', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Text('What are you cooking today?', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text('Recent Search',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  final recipe = _recipes[index];
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
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SearchPage()));
          } else if (index == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SavedRecipesPage()));
          }
        },
      ),
    );
  }
}
