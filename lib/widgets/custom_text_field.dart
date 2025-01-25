import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final double labelSize;
  final Color labelColor;
  final String? labelFamily;
  final FontWeight labelFontWeight;
  final String? hintText;
  final int? maxLines;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final double? width; // عرض الحقل
  final double? height; // طول الحقل

  const CustomTextField({
    Key? key,
    this.label = '',
    this.hintText,
    this.onChanged,
    this.controller,
    this.labelColor = Colors.black,
    this.labelFontWeight = FontWeight.normal,
    this.maxLines,
    this.labelSize = 16,
    this.labelFamily,
    this.width, // تخصيص العرض
    this.height, // تخصيص الطول
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
            fontSize: labelSize,
            fontWeight: labelFontWeight,
            fontFamily: labelFamily,
          ),
        ),
        SizedBox(height: 2.h), // مسافة بين النص والحقل
        SizedBox(
          width: width, // عرض الحقل
          height: height, // طول الحقل
          child: TextField(
            cursorColor: AppColors.primaryColor,
            controller: controller,
            onChanged: onChanged,
            maxLines: maxLines,
            style: const TextStyle(
              color: Colors.black,
            ),
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
        ),
      ],
    );
  }
}