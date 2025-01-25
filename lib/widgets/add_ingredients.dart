import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/utils/colors.dart';
import 'upload_photo_function.dart';

class AddIngredients extends StatefulWidget {
  const AddIngredients({Key? key}) : super(key: key);

  @override
  State<AddIngredients> createState() => _AddIngredientsState();
}

class _AddIngredientsState extends State<AddIngredients> {
  final List<Map<String, dynamic>> ingredients = [];

  void _addIngredient() {
    setState(() {
      ingredients.add({
        'number': ingredients.length + 1,
        'controller': TextEditingController(),
        'image': null,
      });
    });
  }

  void _removeIngredient(int index) {
    setState(() {
      ingredients.removeAt(index);
      for (int i = 0; i < ingredients.length; i++) {
        ingredients[i]['number'] = i + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...ingredients.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, dynamic> ingredient = entry.value;
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 12.r,
                  backgroundColor: AppColors.primaryColor,
                  child: Text(
                    '${ingredient['number']}',
                    style: TextStyle(color: Colors.white, fontSize: 10.sp),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: TextField(
                    cursorColor: AppColors.primaryColor,
                    controller: ingredient['controller'],
                    decoration: InputDecoration(
                      hintText: 'Enter Ingredient Name',
                      hintStyle: TextStyle(fontSize: 10.sp, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.r),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.r),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.r),
                        borderSide:
                        BorderSide(color: AppColors.primaryColor, width: 2),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                InkWell(
                  onTap: () async {
                    final image =
                    await UploadPhotoFunction.pickImageFromGallery();
                    if (image != null) {
                      setState(() {
                        ingredient['image'] = File(image.path);
                      });
                    }
                  },
                  child: Container(
                    height: 35.r,
                    width: 35.r,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7.r),
                      child: ingredient['image'] != null
                          ? Image.file(
                        ingredient['image'],
                        fit: BoxFit.contain,
                      )
                          : Icon(
                        Icons.image,
                        size: 22.r,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                InkWell(
                  onTap: () => _removeIngredient(index),
                  child: Container(
                    height: 26.h,
                    width: 26.w,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                      size: 20.r,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        ElevatedButton.icon(
          onPressed: _addIngredient,
          icon: Icon(Icons.add, color: Colors.white),
          label: Text(
            'Add Ingredients',
            style: TextStyle(fontSize: 12.sp, color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
      ],
    );
  }
}
