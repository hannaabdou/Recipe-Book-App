import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Color labelColor;
  final FontWeight labelFontWeight;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final int? maxLines;

  const CustomTextField({
    Key? key,
    required this.label,
    this.hintText,
    this.onChanged,
    this.controller,
    this.labelColor = Colors.black,
    this.labelFontWeight = FontWeight.normal,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: labelColor,
            fontSize: 16.sp,
            fontWeight: labelFontWeight,
          ),
        ),
        SizedBox(height: 5.h), // مسافة بين النص والحقل
        TextField(
          cursorColor: AppColors.primaryColor,
          controller: controller,
          onChanged: onChanged,
          maxLines: maxLines,
          style: const TextStyle(
            color: Colors.black,
          ),
          // النص داخل الحقل
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.transparent,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 2.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
