import 'package:flutter/material.dart';

class AddRecipeForm extends StatefulWidget {
  final Function(Map<String, dynamic>) addRecipe;

  const AddRecipeForm({required this.addRecipe, super.key});

  @override
  State<AddRecipeForm> createState() => _AddRecipeFormState();
}

class _AddRecipeFormState extends State<AddRecipeForm> {
  final TextEditingController recipeNameController = TextEditingController();
  final TextEditingController recipeDescriptionController =
  TextEditingController();

  void _submitRecipe() {
    // Validate the form fields
    if (recipeNameController.text.isEmpty ||
        recipeDescriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields!')),
      );
      return;
    }

    // Create the new recipe object
    final newRecipe = {
      'name': recipeNameController.text,
      'description': recipeDescriptionController.text,
    };

    widget.addRecipe(newRecipe); // Call the callback to update recipes
    Navigator.pop(context); // Navigate back after adding the recipe
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Recipe')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: recipeNameController,
              decoration: InputDecoration(labelText: 'Recipe Name'),
            ),
            TextField(
              controller: recipeDescriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitRecipe,
              child: Text('Add Recipe'),
            ),
          ],
        ),
      ),
    );
  }
}
