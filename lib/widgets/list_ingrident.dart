import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/ingredient_box.dart';
import 'custom_ingredient_card.dart';

class ListIngredient extends StatelessWidget {
  final List<IngredientBox> ingredients;

  const ListIngredient({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ingredients.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final ingredient = ingredients[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 7.h),
          child: CustomIngredientCard(
            imageUrl: ingredient.imageUrl,
            ingredientName: ingredient.name,
          ),
        );
      },
    );
  }
}
