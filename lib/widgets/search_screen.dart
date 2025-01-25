import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/utils/colors.dart';
import 'package:recipe_book_app/widgets/custom_app_bar.dart';
import 'package:recipe_book_app/widgets/custom_text_style.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = [];
  final List<String> _recentSearches = [
    'Recipe 1',
    'Recipe 2',
    'Recipe 3',
    'Recipe 1',
    'Recipe 2',
    'Recipe 3',
    'Recipe 1',
    'Recipe 2',
    'Recipe 3',
    'Recipe 1',
    'Recipe 2',
    'Recipe 3',
    'Recipe 1',
    'Recipe 2',
    'Recipe 3',
    'Recipe 1',
    'Recipe 2',
    'Recipe 3',
    'Recipe 1',
    'Recipe 2',
    'Recipe 3',
    'Recipe 4'
  ]; // قائمة عمليات البحث الأخيرة
  final List<String> _allItems = [
    'Recipe 1',
    'Recipe 2',
    'Recipe 3',
    'Recipe 4'
  ]; // عينة من البيانات

  void _performSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        _searchResults.clear();
      } else {
        _searchResults = _allItems
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _addToRecentSearches(String query) {
    if (!_recentSearches.contains(query)) {
      setState(() {
        _recentSearches.add(query);
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
                  borderSide: BorderSide(
                    color: Colors.blue, // تغيير لون البوردير
                    width: 2, // تغيير سماكة البوردير
                  ),
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
                              title: Text(_recentSearches[index]),
                              onTap: () {
                                _searchController.text = _recentSearches[index];
                                _performSearch(_recentSearches[index]);
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
                          title: Text(_searchResults[index]),
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
