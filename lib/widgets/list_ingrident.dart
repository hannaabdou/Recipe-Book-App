import 'package:flutter/material.dart';

import 'CustomIngridentCard.dart';

class listIngrident extends StatelessWidget {
  final List<Map<String, dynamic>> ingredients;

  const listIngrident({Key? key, required this.ingredients}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ingredients.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final ingredient = ingredients[index];
        return CustomIngredientCard(
          imageUrl: ingredient['imageUrl'],
          ingredientName: ingredient['name'],
        );
      },
    );
  }
}
