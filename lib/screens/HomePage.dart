import 'package:flutter/material.dart';

import '../widgets/CustomRecipeCard.dart';

class HomePage extends StatelessWidget {
  final List<String> filters = [
    'Ingredient',
    'Procedure',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomRecipeCard(
              title: 'Lol',
              imageUrl: 'assets/IMG/Recipe Photos/Spicy Chicken Biryani.jpg',
              targetPage: (){},
              onFavoritePressed: (){},
              rating: 4.5,
              cookingTime: 30,
              chefName: 'Gogo',
            ),
          ],
        ),
      ),
    );
  }
}
