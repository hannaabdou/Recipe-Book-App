/*
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/custom_button.dart';
import 'package:recipe_book_app/widgets/custom_text_field.dart';
import 'package:recipe_book_app/widgets/upload_photo_button.dart';
import 'add_ingredients.dart';
import 'add_steps.dart';
import 'custom_recipe_card.dart';

class Recipe {
  final String name;
  final String description;
  final List<Map<String, dynamic>> ingredients;
  final List<Map<String, dynamic>> steps;
  final File? image;

  Recipe({
    required this.name,
    required this.description,
    required this.ingredients,
    required this.steps,
    this.image,
  });
}

class AddRecipeForm extends StatefulWidget {
  @override
  _AddRecipeFormState createState() => _AddRecipeFormState();
}

class _AddRecipeFormState extends State<AddRecipeForm> {
  final List<Recipe> recipeAdded = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final AddIngredients ingredientsWidget = AddIngredients();
  final AddSteps stepsWidget = AddSteps();
  File? selectedImage;

  void addRecipe() {
    final ingredients = ingredientsWidget.ingredients.map((e) {
      return {
        'name': e['controller'].text,
        'image': e['image'],
      };
    }).toList();

    final steps = stepsWidget.steps.map((e) {
      return {'description': e['controller'].text};
    }).toList();

    final newRecipe = Recipe(
      name: nameController.text,
      description: descriptionController.text,
      ingredients: ingredients,
      steps: steps,
      image: selectedImage,
    );

    setState(() {
      recipeAdded.add(newRecipe);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Recipe added successfully!')),
    );

    // Reset form
    nameController.clear();
    descriptionController.clear();
    ingredientsWidget.ingredients.clear();
    stepsWidget.steps.clear();
    selectedImage = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Recipe'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          CustomTextField(
            controller: nameController,
            label: 'Name',
            hintText: 'Enter Recipe Name',
            labelSize: 10.sp,
            labelColor: Colors.black,
            labelFontWeight: FontWeight.bold,
          ),
          SizedBox(height: 10.h),
          CustomTextField(
            controller: descriptionController,
            label: 'Description',
            hintText: 'Enter Recipe Description',
            labelColor: Colors.black,
            labelSize: 10.sp,
            labelFontWeight: FontWeight.bold,
            maxLines: 5,
          ),
          SizedBox(height: 10.h),
          ingredientsWidget,
          SizedBox(height: 10.h),
          stepsWidget,
          SizedBox(height: 10.h),
          UploadPhotoButton(
            label: 'Recipe Photo',
            text: 'Upload Recipe Image',
            onImageSelected: (image) {
              setState(() {
                selectedImage = image;
              });
            },
          ),
          SizedBox(height: 10.h),
          CustomButton(
            onPressed: addRecipe,
            title: 'Add Recipe',
            titleSize: 14.sp,
            titleColor: Colors.white,
            buttonColor: Color(0xFFF4B855),
          ),
        ],
      ),
    );
  }
}

class RecipeListPage extends StatelessWidget {
  final List<Recipe> recipes;

  const RecipeListPage({Key? key, required this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: recipes.isEmpty
          ? Center(child: Text('No recipes added yet.'))
          : ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return CustomRecipeCard(
            title: recipe.name,
            imageUrl: recipe.image?.path ?? '',
            targetPage: () {
              // Define navigation logic here
            },
            showDeleteIcon: true,
          );
        },
      ),
    );
  }
}
*/















import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/custom_button.dart';
import 'package:recipe_book_app/widgets/custom_text_field.dart';
import 'package:recipe_book_app/widgets/upload_photo_button.dart';

import 'add_ingredients.dart';
import 'add_steps.dart';

class AddRecipeForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        CustomTextField(
          label: 'Name',
          hintText: 'Enter Recipe Name',
          labelSize: 10.sp,
          labelColor: Colors.black,
          labelFontWeight: FontWeight.bold,
        ),
        SizedBox(height: 10.h),
        CustomTextField(
          label: 'Description',
          hintText: 'Enter Recipe Description',
          labelColor: Colors.black,
          labelSize: 10.sp,
          labelFontWeight: FontWeight.bold,
          maxLines: 5,
        ),
        SizedBox(height: 10.h),
        AddIngredients(),
        SizedBox(height: 10.h),
        AddSteps(),
        SizedBox(height: 10.h),
        UploadPhotoButton(),
        SizedBox(height: 10.h),
        CustomButton(
          onPressed: () {},
          title: 'Add',
          titleSize: 14.sp,
          titleColor: Colors.white,
          buttonColor: Color(0xFFF4B855),
        ),
        SizedBox(height: 15.h)
      ],
    );
  }
}
