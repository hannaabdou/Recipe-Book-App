import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/custom_text_style.dart';
import 'package:recipe_book_app/widgets/profile_image.dart';
import 'package:recipe_book_app/widgets/custom_recipe_card.dart';
import 'package:recipe_book_app/widgets/custom_filter.dart';
import 'package:recipe_book_app/widgets/profile_screen.dart';
import '../models/recipe.dart';
import '../screens/recipe_details_page.dart';
import '../services/api_service.dart';
import 'custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  final List<String> filters = [
    'All',
    'Breakfast',
    'Chicken',
    'Beef',
    'Vegetarian',
  ];

  // final Function(int) onItemSelected;

  HomeScreen({
    super.key,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedFilterIndex = 0;
  final MealService _mealService = MealService();
  late Future<List<Recipe>> _mealsFuture;

  @override
  void initState() {
    super.initState();
    _mealsFuture = _fetchMealsByFilter(widget.filters[_selectedFilterIndex]);
  }

  Future<List<Recipe>> _fetchMealsByFilter(String filter) async {
    if (filter == 'All') {
      return _mealService.fetchMealsByCategory('Dessert');
    } else {
      return _mealService.fetchMealsByCategory(filter);
    }
  }

  void _onFilterChanged(int index) {
    setState(() {
      _selectedFilterIndex = index;
      _mealsFuture = _fetchMealsByFilter(widget.filters[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onPressed: () {},
        titleSize: 8.sp,
        textWordSpacing: 3.w,
        textLetterSpacing: 1.w,
        showBackIcon: false,
        title: 'Home Page',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextStyle(
                      text: 'Hello, User',
                      textFamily: 'Poppins-SemiBold',
                      textSize: 12.sp,
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
                  onPressed: () {},
                  width: 35.w,
                  height: 35.h,
                ),
              ],
            ),
            SizedBox(height: 23.h),

            // Filter Section
            CustomFilter(
              filters: widget.filters,
              paddingHorizontal: 12.w,
              paddingVertical: 2.h,
              onFilterChanged: _onFilterChanged,
            ),
            SizedBox(height: 16.h),

            // Recipes List
            Flexible(
              child: FutureBuilder<List<Recipe>>(
                future: _mealsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
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
                    );
                  } else {
                    final recipes = snapshot.data!;
                    return ListView.builder(
                      itemCount: recipes.length,
                      itemBuilder: (context, index) {
                        final recipe = recipes[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 7.h),
                          child: CustomRecipeCard(
                            title: recipe.title,
                            imageUrl: recipe.imageUrl ??
                                'https://via.placeholder.com/150',
                            targetPage: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecipeDetailsPage(
                                    recipe: recipe, // تمرير الوصفة مباشرة
                                  ),
                                ),
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
          ],
        ),
      ),
    );
  }
}
