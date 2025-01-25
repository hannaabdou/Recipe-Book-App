import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/recipe_details_body.dart';

class RecipeDetailsPage extends StatelessWidget {
  const RecipeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onPressed: () {},
        title: 'Recipe Page',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: RecipeDetailsBody(
          recipeName: 'Spicy Chicken Burger with French Fries',
          recipeDescription:
              'Delicious spicy chicken burger paired with crispy golden French fries – the perfect combo for a flavorful meal!',
        ),
      ),
    );
  }
}
