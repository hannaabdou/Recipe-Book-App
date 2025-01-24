import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/CustomButton.dart';
import 'package:recipe_book_app/widgets/CustomTextField.dart';
import 'package:recipe_book_app/widgets/customTextStyle.dart';
import 'package:recipe_book_app/widgets/uploadPhotoButton.dart';

class AddRecipeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 20.h,
        // bottom: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          Center(
            child: customTextStyle(
              text: 'Add New Recipe',
              textSize: 10.sp,
              textFamily: 'Poppins-SemiBold',
              textColor: Colors.black,
            ),
          ),
          CustomTextField(
            label: 'Name',
            hintText: 'Ex: Traditional spare ribs baked',
            labelSize: 10.sp,
            labelColor: Colors.black,
            labelFontWeight: FontWeight.bold,
          ),
          SizedBox(height: 10.h),
          CustomTextField(
            label: 'Description',
            labelColor: Colors.black,
            labelSize: 10.sp,
            labelFontWeight: FontWeight.bold,
            maxLines: 5,
          ),
          SizedBox(height: 10.h),
          CustomTextField(
            label: 'Ingredients',
            labelColor: Colors.black,
            labelSize: 10.sp,
            labelFontWeight: FontWeight.bold,
            maxLines: 5,
          ),
          SizedBox(height: 10.h),
          CustomTextField(
            label: 'Steps',
            labelColor: Colors.black,
            labelSize: 10.sp,
            labelFontWeight: FontWeight.bold,
            maxLines: 5,
          ),
          SizedBox(height: 10.h),
          uploadPhotoButton(),
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
      ),
    );
  }
}
