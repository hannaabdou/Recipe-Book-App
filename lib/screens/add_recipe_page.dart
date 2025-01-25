import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/add_recipe_form.dart';
import 'package:recipe_book_app/widgets/custom_app_bar.dart';

class AddRecipePage extends StatelessWidget {
  const AddRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onPressed: () {},
        title: 'Add New Recipe',
        showMoreIcon: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        child: AddRecipeForm(),
      ),
    );
  }
}
