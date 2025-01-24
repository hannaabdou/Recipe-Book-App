import 'package:flutter/material.dart';
import 'package:recipe_book_app/widgets/AddRecipeBottomSheet.dart';
import 'package:recipe_book_app/widgets/uploadPhotoButton.dart';

class testPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddRecipeBottomSheet();
            },
          );
        },
        child: Icon(Icons.add),
      ),
      // body: Center(child: uploadPhotoButton()),
    );
  }
}
