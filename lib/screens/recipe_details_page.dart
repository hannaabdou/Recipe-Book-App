import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/recipe.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_recipe_card.dart';
import '../widgets/custom_filter.dart';
import '../widgets/custom_text_style.dart';
import '../widgets/list_ingrident.dart';
import '../widgets/list_step.dart';

class RecipeDetailsPage extends StatefulWidget {
  final Recipe recipe;

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
        titleSize: 14.sp,
        textWordSpacing: 3.w,
        textLetterSpacing: 1.w,
        title: 'Recipe Details',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          children: [
            // الكارت الخاص بعنوان الوصفة والصورة
            CustomRecipeCard(
              title: selectedRecipe.title,
              imageUrl: selectedRecipe.imageUrl ?? '',
              targetPage: () {}, // يمكن ربطها لاحقًا بتصفح الوصفات
            ),
            SizedBox(height: 10.h),

            // وصف الوصفة
            if (selectedRecipe.description != null)
              CustomTextStyle(
                text: selectedRecipe.description!,
                textSize: 12.sp,
                textColor: Colors.grey,
                textAlign: TextAlign.start,
                textFamily: 'Poppins-SemiBold',
              ),
            SizedBox(height: 10.h),

            // قائمة الفلاتر (Ingredients & Steps)
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

            // عرض المكونات أو الخطوات بناءً على الفلتر
            Expanded(
              child: _selectedFilterIndex == 0
                  ? (selectedRecipe.ingredients.isNotEmpty
                      ? ListIngredient(ingredients: selectedRecipe.ingredients)
                      : Center(
                          child: Text(
                            'No ingredients available.',
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.grey),
                          ),
                        ))
                  : (selectedRecipe.steps.isNotEmpty
                      ? ListStep(steps: selectedRecipe.steps)
                      : Center(
                          child: Text(
                            'No steps available.',
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.grey),
                          ),
                        )),
            ),
          ],
        ),
      ),
    );
  }
}
