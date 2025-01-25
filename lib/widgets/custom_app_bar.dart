import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/custom_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onPressed;
  final bool showMoreIcon; // متغير للتحكم في إظهار أو إخفاء الأيقونة

  const CustomAppBar({
    super.key,
    required this.onPressed,
    required this.title,
    this.showMoreIcon = true, // قيمة افتراضية تظهر الأيقونة
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomTextStyle(
        text: title,
        textFamily: 'Poppins-SemiBold',
        textSize: 10.sp,
        textColor: Colors.black,
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        if (showMoreIcon) // شرط إظهار أو إخفاء الأيقونة
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: onPressed,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
