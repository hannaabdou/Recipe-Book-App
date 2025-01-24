import 'package:flutter/material.dart';
import 'package:recipe_book_app/screens/HomePage.dart';
import 'package:recipe_book_app/widgets/CustomRecipeCard.dart';

class testPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomRecipeCard(
            targetPage: (){},
            rating: 4.5,
            showDeleteIcon: true,
            cookingTime: 30,
            imageUrl: 'assets/IMG/Recipe Photos/Spicy Chicken Biryani.jpg',
            title: 'Traditional Spare Ribs Baked',
          ),
        ),
      ),
    );
  }
}
