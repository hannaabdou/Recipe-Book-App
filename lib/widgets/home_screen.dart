import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/custom_text_style.dart';
import 'package:recipe_book_app/widgets/profile_image.dart';
import 'package:recipe_book_app/widgets/custom_recipe_card.dart';
import 'package:recipe_book_app/widgets/custom_filter.dart';
import '../data/recipe_box.dart';
import '../data/static_recipe.dart';
import '../screens/recipe_details_page.dart';
import 'custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  final List<String> filters = [
    'All',
    'Breakfast',
    'Lunch',
    'Dinner',
    'Chicken',
    'Beef',
    'Vegetarian',
    'Snacks',
    'Desserts'
  ];

  HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedFilterIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<RecipeBox> filteredRecipes;

    if (_selectedFilterIndex == 0) {
      filteredRecipes = StaticRecipe.recipes;
    } else {
      filteredRecipes = StaticRecipe.recipes
          .where((recipe) =>
      recipe.category == widget.filters[_selectedFilterIndex])
          .toList();
    }

    return Scaffold(
      appBar: CustomAppBar(
        onPressed: () {},
        titleSize: 14,
        textWordSpacing: 3,
        textLetterSpacing: 1,
        showBackIcon: false,
        title: 'Home Page',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextStyle(
                      text: 'Hello, Mohamed Abdelsatar',
                      textFamily: 'Poppins-SemiBold',
                      textSize: 10.sp,
                      textLetterSpacing: 0.5.w,
                      textColor: Colors.black,
                    ),
                    CustomTextStyle(
                      text: 'What are you Cooking Today?',
                      textFamily: 'Poppins-Thin',
                      textWeight: FontWeight.bold,
                      textSize: 8.sp,
                      textColor: Colors.black,
                    ),
                  ],
                ),
                ProfileImage(
                  width: 35,
                  height: 35,
                ),
              ],
            ),
            SizedBox(height: 23.h),
            CustomFilter(
              filters: widget.filters,
              paddingHorizontal: 7.w,
              paddingVertical: 2.h,
              onFilterChanged: (index) {
                setState(() {
                  _selectedFilterIndex = index;
                });
              },
            ),
            SizedBox(height: 16.h),
            Flexible(
              child: SingleChildScrollView(
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: filteredRecipes.isEmpty
                        ? [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/IMG/Icons/empty.png',
                              width: 130.w,
                              height: 130.h,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 20.h),
                            CustomTextStyle(
                              text:
                              'There are no Recipes of ${widget.filters[_selectedFilterIndex]}',
                              textFamily: 'Poppins-SemiBold',
                              textSize: 16.sp,
                              textColor: Colors.black,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ]
                        : filteredRecipes.map((recipe) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 7.h),
                        child: CustomRecipeCard(
                          title: recipe.name,
                          imageUrl: recipe.imageUrl,
                          targetPage: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecipeDetailsPage(recipe: recipe),
                              ),
                            );
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
