import 'package:flutter/material.dart';
import 'package:recipe_book_app/data/recipe_box.dart';
import 'package:recipe_book_app/screens/recipe_details_page.dart';

import '../models/recipe.dart';

Widget buildSearchResults(
    List<Recipe> searchResults,
    Function(Recipe) addToRecentSearches,
    TextEditingController searchController) {
  return Expanded(
    child: searchResults.isEmpty && searchController.text.isNotEmpty
        ? Center(child: Text('No results found'))
        : ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(searchResults[index].title),
                subtitle: Text('${searchResults[index].category}'),
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
