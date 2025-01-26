import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/custom_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double titleSize;
  final String titleFamily;
  final double textWordSpacing;
  final double textLetterSpacing;
  final bool showMoreIcon;
  final bool showBackIcon;
  final VoidCallback onPressed;

  const CustomAppBar({
    super.key,
    required this.onPressed,
    required this.title,
    this.titleSize = 10,
    this.titleFamily = 'Poppins-SemiBold',
    this.showMoreIcon = false,
    this.showBackIcon = true,
    this.textWordSpacing = 0,
    this.textLetterSpacing = 0,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomTextStyle(
        text: title,
        textFamily: titleFamily,
        textSize: titleSize.sp,
        textWordSpacing: textWordSpacing.sp,
        textLetterSpacing: textLetterSpacing.sp,
        textColor: Colors.black,
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: showBackIcon,
      leading: showBackIcon
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
      actions: [
        if (showMoreIcon)
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
