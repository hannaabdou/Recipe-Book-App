/*
// recent_searches_list.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/custom_text_style.dart';
import 'package:recipe_book_app/data/static_recipe.dart';
import 'package:recipe_book_app/data/recipe_box.dart';
import 'package:recipe_book_app/widgets/recent_search.dart';

import '../screens/recipe_details_page.dart';

Widget buildRecentSearches(List<RecentSearch> recentSearches, TextEditingController _searchController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomTextStyle(
        text: 'Recent Search',
        textFamily: 'Poppins-SemiBold',
        textWordSpacing: 3,
        textLetterSpacing: 1,
        textSize: 16.sp,
        textColor: Colors.black,
      ),
      SizedBox(height: 1.h),
      ListView.builder(
        shrinkWrap: true,
        itemCount: recentSearches.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recentSearches[index].name),
            subtitle: Text(recentSearches[index].category),
            onTap: () {
              final selectedRecipe = StaticRecipe.recipes.firstWhere(
                    (recipe) => recipe.name == recentSearches[index].name,
                orElse: () => RecipeBox.empty(),
              );

              if (selectedRecipe.name.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailsPage(recipe: selectedRecipe),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Recipe not found')),
                );
              }
            },
          );
        },
      ),
    ],
  );
}
*/
