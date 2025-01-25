import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/utils/colors.dart';
import 'package:recipe_book_app/widgets/custom_app_bar.dart';
import 'package:recipe_book_app/widgets/custom_text_style.dart';
import 'package:recipe_book_app/data/static_recipe.dart';
import 'package:recipe_book_app/data/recipe_box.dart';

// إنشاء فئة لتخزين Recent Search
class RecentSearch {
  final String name;
  final String category;

  RecentSearch({required this.name, required this.category});
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<RecipeBox> _searchResults = []; // نتائج البحث
  final List<RecentSearch> _recentSearches = []; // تخزين عمليات البحث الأخيرة

  void _performSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        _searchResults.clear();
      } else {
        // فلترة الوصفات بناءً على الاسم والفئة
        _searchResults = StaticRecipe.recipes
            .where((recipe) =>
                recipe.name.toLowerCase().contains(query.toLowerCase()) ||
                recipe.category.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _addToRecentSearches(String query) {
    final existingSearch = _recentSearches.firstWhere(
      (search) => search.name == query,
      orElse: () => RecentSearch(name: '', category: ''),
    );
    if (existingSearch.name.isEmpty) {
      setState(() {
        _recentSearches.add(RecentSearch(name: query, category: 'Unknown'));
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
            // سيرش بار
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
              onSubmitted: (query) {
                _addToRecentSearches(
                    query); // إضافة إلى Recent Search عند الضغط على Enter
              },
              decoration: InputDecoration(
                hintText: 'Search Recipe',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor, // لون البوردير عند التركيز
                    width: 2, // سماكة البوردير عند التركيز
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.grey, // لون البوردير في الحالة العادية
                    width: 1, // سماكة البوردير في الحالة العادية
                  ),
                ),
              ),
              cursorColor: AppColors.primaryColor,
              cursorWidth: 2, // تغيير سماكة الكورسول
            ),
            SizedBox(height: 10.h),

            // Recent Searches
            _searchController.text.isEmpty && _recentSearches.isNotEmpty
                ? Column(
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
                      // تخصيص ListView بحيث لا يحدث Overflow
                      Container(
                        height:
                            _recentSearches.isNotEmpty ? 420.h : 0, // ضبط الحجم
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _recentSearches.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(_recentSearches[index].name),
                              subtitle: Text(_recentSearches[index].category),
                              onTap: () {
                                _searchController.text =
                                    _recentSearches[index].name;
                                _performSearch(_recentSearches[index].name);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : Container(), // لا تعرض إذا كان هناك بحث جارٍ

            // عرض نتائج البحث
            Expanded(
              child: _searchResults.isEmpty && _searchController.text.isNotEmpty
                  ? Center(child: Text('No results found'))
                  : ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_searchResults[index].name),
                          subtitle: Text(_searchResults[index].category),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
