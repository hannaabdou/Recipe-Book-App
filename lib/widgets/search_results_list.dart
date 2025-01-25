import 'package:flutter/material.dart';
import 'package:recipe_book_app/data/recipe_box.dart';
import 'package:recipe_book_app/screens/recipe_details_page.dart';

Widget buildSearchResults(
    List<RecipeBox> searchResults,
    Function(RecipeBox) addToRecentSearches,
    TextEditingController searchController // تمرير الـ controller هنا
    ) {
  return Expanded(
    child: searchResults.isEmpty && searchController.text.isNotEmpty // استخدام الـ controller هنا
        ? Center(child: Text('No results found'))
        : ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index].name),
          subtitle: Text(searchResults[index].category),
          onTap: () {
            addToRecentSearches(searchResults[index]);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeDetailsPage(
                  recipe: searchResults[index],
                ),
              ),
            );
          },
        );
      },
    ),
  );
}
