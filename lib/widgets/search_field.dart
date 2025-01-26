// search_field.dart
import 'package:flutter/material.dart';
import 'package:recipe_book_app/utils/colors.dart';

Widget buildSearchField(TextEditingController searchController,
    Function(String) onChanged, BuildContext context) {
  return TextField(
    controller: searchController,
    onChanged: onChanged,
    decoration: InputDecoration(
      hintText: 'Search Recipe',
      prefixIcon: Icon(Icons.search),
      suffixIcon: searchController.text.isNotEmpty
          ? IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                searchController.clear();
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
  );
}
