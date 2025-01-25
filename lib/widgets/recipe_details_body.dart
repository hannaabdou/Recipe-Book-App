import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/custom_text_style.dart';

import 'custom_filter.dart';
import 'custom_recipe_card.dart';
import 'list_ingrident.dart';
import 'list_step.dart';

class RecipeDetailsBody extends StatefulWidget {
  final String recipeName;
  final String recipeDescription;

  RecipeDetailsBody({
    super.key,
    required this.recipeName,
    required this.recipeDescription,
  });

  @override
  _RecipeDetailsBodyState createState() => _RecipeDetailsBodyState();
}

class _RecipeDetailsBodyState extends State<RecipeDetailsBody> {
  int _selectedFilterIndex = 0; // حالة الفلتر
  final List<Map<String, dynamic>> ingredients = [
    {
      'imageUrl': 'assets/IMG/Ingredient Photos/Tomatoes.png',
      'name': 'Chicken',
      'quantity': 200,
    },
    {
      'imageUrl': 'assets/IMG/Ingredient Photos/Tomatoes.png',
      'name': 'Onion',
      'quantity': 100,
    },
    {
      'imageUrl': 'assets/IMG/Ingredient Photos/Tomatoes.png',
      'name': 'Garlic',
      'quantity': 50,
    },
    {
      'imageUrl': 'assets/IMG/Ingredient Photos/Tomatoes.png',
      'name': 'Chicken',
      'quantity': 200,
    },
    {
      'imageUrl': 'assets/IMG/Ingredient Photos/Tomatoes.png',
      'name': 'Onion',
      'quantity': 100,
    },
    {
      'imageUrl': 'assets/IMG/Ingredient Photos/Tomatoes.png',
      'name': 'Garlic',
      'quantity': 50,
    },
    {
      'imageUrl': 'assets/IMG/Ingredient Photos/Tomatoes.png',
      'name': 'Chicken',
      'quantity': 200,
    },
    {
      'imageUrl': 'assets/IMG/Ingredient Photos/Tomatoes.png',
      'name': 'Onion',
      'quantity': 100,
    },
    {
      'imageUrl': 'assets/IMG/Ingredient Photos/Tomatoes.png',
      'name': 'Garlic',
      'quantity': 50,
    },
  ];
  final List<Map<String, dynamic>> steps = [
    {
      'stepNumber': 1,
      'description':
          'Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum dolore eu fugiat nulla pariatur?',
    },
    {
      'stepNumber': 2,
      'description': 'Chop the vegetables and prepare the ingredients.',
    },
    {
      'stepNumber': 3,
      'description': 'Cook the chicken and vegetables together.',
    },
    {
      'stepNumber': 1,
      'description':
          'Cut the chicken into small pieces and marinate with spices.',
    },
    {
      'stepNumber': 2,
      'description': 'Chop the vegetables and prepare the ingredients.',
    },
    {
      'stepNumber': 3,
      'description': 'Cook the chicken and vegetables together.',
    },
    {
      'stepNumber': 1,
      'description':
          'Cut the chicken into small pieces and marinate with spices.',
    },
    {
      'stepNumber': 2,
      'description': 'Chop the vegetables and prepare the ingredients.',
    },
    {
      'stepNumber': 3,
      'description': 'Cook the chicken and vegetables together.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomRecipeCard(
          title: widget.recipeName,
          imageUrl: 'assets/IMG/Recipe Photos/Spicy Chicken Biryani.jpg',
          targetPage: () {},
        ),
        SizedBox(height: 10.h),
        CustomTextStyle(
          text: widget.recipeDescription,
          textSize: 10.sp,
          textColor: Colors.grey,
          textFamily: 'Poppins-SemiBold',
        ),
        SizedBox(height: 10.h),
        CustomFilter(
          filters: ['Ingredients', 'Steps'],
          paddingHorizontal: 50,
          onFilterChanged: (index) {
            setState(() {
              _selectedFilterIndex = index; // تغيير الفلتر
            });
          },
        ),
        SizedBox(height: 10.h),
        // هنا سيتم التمرير فقط في هذه الأقسام
        Expanded(
          child: SingleChildScrollView(
            child: _selectedFilterIndex == 0
                ? ListIngredient(ingredients: ingredients)
                : ListStep(steps: steps),
          ),
        ),
      ],
    );
  }
}
