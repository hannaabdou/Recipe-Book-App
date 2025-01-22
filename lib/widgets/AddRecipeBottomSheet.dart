import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/CustomButton.dart';
import 'package:recipe_book_app/widgets/CustomTextField.dart';
import '../utils/UploadPhotoFunction.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: CustomTextField(
                  label: 'Recipe Name',
                  labelColor: Colors.black,
                  labelFontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10.w),
              CustomButton(
                onPressed: () async {
                  final image =
                      await UploadPhotoFunction.pickImageFromGallery();
                  if (image != null) {
                    print('Image selected: ${image.path}');
                  }
                },
                title: 'Upload Photo',
                verticalSize: 12,
                titleColor: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          CustomTextField(
            label: 'Recipe Description',
            labelColor: Colors.black,
            labelFontWeight: FontWeight.bold,
            maxLines: 5,
          ),
          SizedBox(height: 10.h),
          CustomTextField(
            label: 'Recipe Ingredients',
            labelColor: Colors.black,
            labelFontWeight: FontWeight.bold,
            maxLines: 5,
          ),
          SizedBox(height: 10.h),
          CustomTextField(
            label: 'Recipe Steps',
            labelColor: Colors.black,
            labelFontWeight: FontWeight.bold,
            maxLines: 5,
          ),
          SizedBox(height: 10.h),
          CustomButton(
            onPressed: () {},
            title: 'Add',
            titleColor: Colors.white,
            buttonColor: Color(0xFFF4B855),
          ),
        ],
      ),
    );
  }
}
