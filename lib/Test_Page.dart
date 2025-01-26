import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/services/api_service.dart';
import 'package:recipe_book_app/widgets/custom_recipe_card.dart';
import 'models/recipe.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final MealService _mealService = MealService();
  late Future<List<Recipe>> _mealsFuture;

  @override
  void initState() {
    super.initState();
    _mealsFuture = _mealService.fetchMealsByCategory('Dessert');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Book'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: FutureBuilder<List<Recipe>>(
          future: _mealsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No recipes found.'));
            } else {
              final recipes = snapshot.data!;
              return ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: CustomRecipeCard(
                      title: recipe.title,
                      imageUrl: recipe.imageUrl ??
                          'https://via.placeholder.com/150', // URL الصورة
                      targetPage: () {
                        Navigator.pushNamed(
                          context,
                          '/recipe_details',
                          arguments: recipe,
                        );
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
