import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/custom_button.dart';
import 'package:recipe_book_app/widgets/custom_text_field.dart';
import 'package:recipe_book_app/widgets/upload_photo_button.dart';

import 'add_ingredients.dart';
import 'add_steps.dart';

class AddRecipeForm extends StatelessWidget {
  const AddRecipeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        CustomTextField(
          label: 'Name',
          hintText: 'Enter Recipe Name',
          labelSize: 10.sp,
          labelColor: Colors.black,
          labelFontWeight: FontWeight.bold,
        ),
        SizedBox(height: 10.h),
        CustomTextField(
          label: 'Description',
          hintText: 'Enter Recipe Description',
          labelColor: Colors.black,
          labelSize: 10.sp,
          labelFontWeight: FontWeight.bold,
          maxLines: 5,
        ),
        SizedBox(height: 10.h),
        AddIngredients(),
        SizedBox(height: 10.h),
        AddSteps(),
        SizedBox(height: 10.h),
        UploadPhotoButton(),
        SizedBox(height: 10.h),
        CustomButton(
          onPressed: () {},
          title: 'Add',
          titleSize: 14.sp,
          titleColor: Colors.white,
          buttonColor: Color(0xFFF4B855),
        ),
        SizedBox(height: 15.h)
      ],
    );
  }
}
