import 'package:flutter/material.dart';

import '../widgets/CustomButton.dart';
import '../widgets/CustomRecipeCard.dart';
import '../widgets/CustomTextField.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomRecipeCard(
              title: 'Traditional spare ribs baked',
              chefName: 'John',
              cookingTime: '30',
              rating: 4.5,
              imageUrl: 'assets/IMG/Spicy Chicken Biryani.jpg',
              onFavoritePressed: () {},
              targetPage: () {},
            )
          ],
        ),
      ),
    );
  }
}
