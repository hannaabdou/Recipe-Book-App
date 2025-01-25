/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/custom_text_style.dart';
import '../data/recipe_box.dart';
import 'custom_filter.dart';
import 'custom_recipe_card.dart';
import 'list_ingrident.dart';
import 'list_step.dart';

class RecipeDetailsBody extends StatefulWidget {
  final String recipeName;

  RecipeDetailsBody({
    super.key,
    required this.recipeName,
  });

  @override
  _RecipeDetailsBodyState createState() => _RecipeDetailsBodyState();
}

class _RecipeDetailsBodyState extends State<RecipeDetailsBody> {
  int _selectedFilterIndex = 0;

  // قائمة الوصفات الثابتة
  List<RecipeBox> staticRecipes = [
    RecipeBox(
      name: 'Spaghetti',
      description: 'Delicious spaghetti recipe',
      imageUrl: 'https://example.com/spaghetti.jpg',
      ingredients: ['Pasta', 'Tomato Sauce', 'Cheese'],
      steps: ['Boil pasta', 'Prepare sauce', 'Mix and serve'],
    ),
    RecipeBox(
      name: 'Pizza',
      description: 'Classic pizza with cheese and tomato',
      imageUrl: 'https://example.com/pizza.jpg',
      ingredients: ['Dough', 'Tomato Sauce', 'Mozzarella'],
      steps: ['Prepare dough', 'Spread sauce', 'Add cheese and bake'],
    ),
    // المزيد من الوصفات...
  ];

  late RecipeBox? selectedRecipe;

  @override
  void initState() {
    super.initState();

    // العثور على الوصفة بناءً على اسمها
    selectedRecipe = staticRecipes.firstWhere(
          (recipe) => recipe.name == widget.recipeName,
      orElse: () => null,
    );
  }

  @override
  Widget build(BuildContext context) {
    // التحقق من وجود الوصفة
    if (selectedRecipe == null) {
      return Center(
        child: Text('Recipe not found'),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomRecipeCard(
          title: selectedRecipe!.name,
          imageUrl: selectedRecipe!.imageUrl,
          targetPage: () {},
        ),
        SizedBox(height: 10.h),
        CustomTextStyle(
          text: selectedRecipe!.description,
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
              _selectedFilterIndex = index;
            });
          },
        ),
        SizedBox(height: 10.h),
        Expanded(
          child: SingleChildScrollView(
            child: _selectedFilterIndex == 0
                ? ListIngredient(ingredients: selectedRecipe!.ingredients)
                : ListStep(steps: selectedRecipe!.steps),
          ),
        ),
      ],
    );
  }
}
*/
