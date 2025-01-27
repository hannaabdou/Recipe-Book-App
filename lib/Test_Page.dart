import 'dart:io';

import 'package:flutter/material.dart';

class RecipeBookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Book App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    LostPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark),
            label: 'Lost',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Recipe> recipes = [];
  List<Recipe> favoriteRecipes = [];
  bool showFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Book'),
        actions: [
          IconButton(
            icon: Icon(showFavorites ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              setState(() {
                showFavorites = !showFavorites;
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: showFavorites ? favoriteRecipes.length : recipes.length,
        itemBuilder: (context, index) {
          final recipe =
              showFavorites ? favoriteRecipes[index] : recipes[index];
          return Card(
            child: ListTile(
              leading: recipe.image != null
                  ? Image.file(recipe.image!,
                      width: 50, height: 50, fit: BoxFit.cover)
                  : Icon(Icons.image, size: 50),
              title: Text(recipe.title),
              trailing: IconButton(
                icon: Icon(
                  recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: recipe.isFavorite ? Colors.red : null,
                ),
                onPressed: () {
                  setState(() {
                    recipe.isFavorite = !recipe.isFavorite;
                    if (recipe.isFavorite) {
                      favoriteRecipes.add(recipe);
                    } else {
                      favoriteRecipes.remove(recipe);
                    }
                  });
                },
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailsScreen(recipe: recipe),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddRecipeScreen(onAdd: (recipe) {
              setState(() {
                recipes.add(recipe);
              });
            }),
          ),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}

class RecipeDetailsScreen extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailsScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            recipe.image != null
                ? Image.file(recipe.image!)
                : Icon(Icons.image, size: 100),
            SizedBox(height: 16.0),
            Text(recipe.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 16.0),
            Text(recipe.description ?? 'No description provided.'),
            SizedBox(height: 16.0),
            Text('Ingredients:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...recipe.ingredients
                .map((ingredient) => Text('- $ingredient'))
                .toList(),
            SizedBox(height: 16.0),
            Text('Steps:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...recipe.steps.map((step) => Text('- $step')).toList(),
          ],
        ),
      ),
    );
  }
}

class AddRecipeScreen extends StatefulWidget {
  final Function(Recipe) onAdd;

  AddRecipeScreen({required this.onAdd});

  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  String? title;
  String? description;
  List<String> ingredients = [];
  List<String> steps = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Recipe'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Title is required' : null,
                onSaved: (value) => title = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                onSaved: (value) => description = value,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    widget
                        .onAdd(Recipe(title: title!, description: description));
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Recipe'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Recipe {
  final String title;
  final String? description;
  final List<String> ingredients;
  final List<String> steps;
  final File? image;
  bool isFavorite;

  Recipe({
    required this.title,
    this.description,
    this.ingredients = const [],
    this.steps = const [],
    this.image,
    this.isFavorite = false,
  });
}

class LostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lost Page'),
      ),
      body: Center(
        child: Text('This is the Lost Page!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
