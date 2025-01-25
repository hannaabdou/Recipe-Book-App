import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/custom_app_bar.dart';
import '../data/recipe_box.dart';
import '../widgets/custom_filter.dart';
import '../widgets/custom_recipe_card.dart';
import '../widgets/custom_text_style.dart';
import '../widgets/list_ingrident.dart';
import '../widgets/list_step.dart';

class RecipeDetailsPage extends StatefulWidget {
  final RecipeBox recipe;

  const RecipeDetailsPage({super.key, required this.recipe});

  @override
  _RecipeDetailsPageState createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  int _selectedFilterIndex = 0;

  @override
  Widget build(BuildContext context) {
    final selectedRecipe = widget.recipe;

    return Scaffold(
      appBar: CustomAppBar(
        onPressed: () {},
        titleSize: 7.sp,
        textWordSpacing: 3.w,
        textLetterSpacing: 1.w,
        title: 'Recipe Page',
        // title: selectedRecipe.name,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomRecipeCard(
              title: selectedRecipe.name,
              imageUrl: selectedRecipe.imageUrl,
              targetPage: () {},
            ),
            SizedBox(height: 10.h),
            CustomTextStyle(
              text: selectedRecipe.description,
              textSize: 12.sp,
              textColor: Colors.grey,
              textAlign: TextAlign.start,
              textFamily: 'Poppins-SemiBold',
            ),
            SizedBox(height: 10.h),
            CustomFilter(
              filters: ['Ingredients', 'Steps'],
              paddingHorizontal: 20.w,
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
                    ? ListIngredient(ingredients: selectedRecipe.ingredients)
                    : ListStep(steps: selectedRecipe.steps),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
