/*
// search_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/custom_app_bar.dart';
import 'package:recipe_book_app/data/static_recipe.dart';
import 'package:recipe_book_app/data/recipe_box.dart';
import '../screens/recipe_details_page.dart';
import '../utils/colors.dart';
import 'custom_text_style.dart';
import 'recent_search.dart';
import 'search_results_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<RecipeBox> _searchResults = [];
  final List<RecentSearch> _recentSearches = [];

  void _performSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        _searchResults.clear();
      } else {
        _searchResults = StaticRecipe.recipes
            .where((recipe) =>
                recipe.name.toLowerCase().contains(query.toLowerCase()) ||
                recipe.category.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _addToRecentSearches(RecipeBox recipe) {
    final existingSearch = _recentSearches.firstWhere(
      (search) => search.name == recipe.name,
      orElse: () =>
          RecentSearch(name: '', category: ''), // إذا كانت الوصفة غير موجودة
    );

    if (existingSearch.name.isEmpty) {
      setState(() {
        _recentSearches
            .add(RecentSearch(name: recipe.name, category: recipe.category));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onPressed: () {},
        titleSize: 14,
        textWordSpacing: 3,
        textLetterSpacing: 1,
        showBackIcon: false,
        title: 'Search Page',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              onChanged: (query) {
                _performSearch(query);
                if (query.isEmpty) {
                  setState(() {
                    _searchResults.clear();
                  });
                }
              },
              decoration: InputDecoration(
                hintText: 'Search Recipe',
                prefixIcon: Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                            _searchResults.clear();
                          });
                          // إخفاء الكيبورد بعد مسح النص
                          FocusScope.of(context).unfocus();
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              cursorColor: AppColors.primaryColor,
              cursorWidth: 2,
            ),
            SizedBox(height: 10.h),
            // عرض الـ RecentSearches دائماً إذا كانت موجودة
            if (_searchController.text.isEmpty && _recentSearches.isNotEmpty)
              Column(
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
                  Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _recentSearches.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_recentSearches[index].name),
                          subtitle: Text(_recentSearches[index].category),
                          onTap: () {
                            final selectedRecipe =
                                StaticRecipe.recipes.firstWhere(
                              (recipe) =>
                                  recipe.name == _recentSearches[index].name,
                              orElse: () => RecipeBox.empty(),
                            );

                            if (selectedRecipe.name.isNotEmpty) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecipeDetailsPage(
                                    recipe: selectedRecipe,
                                  ),
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
                  ),
                ],
              ),
            buildSearchResults(
                _searchResults, _addToRecentSearches, _searchController),
          ],
        ),
      ),
    );
  }
}
*/
