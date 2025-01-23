import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'customTextStyle.dart';

class aboutPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/IMG/Wallpaper.png'),
              // Add your image to assets
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Content
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customTextStyle(
                text: 'Recipe Rleam',
                textWordSpacing: 5,
                textLetterSpacing: 5,
                textSize: 20.sp,
                textColor: Colors.white,
              ),
              SizedBox(height: 5.h),
              customTextStyle(
                text: 'Version 1.1',
                textWordSpacing: 5,
                textLetterSpacing: 5,
                textSize: 12.sp,
                textFamily: 'Poppins-SemiBold',
                textColor: Colors.white,
              ),
              SizedBox(height: 10.h),
              Image.asset(
                'assets/IMG/Icons/Logo 2.png',
                width: 100.w,
                height: 100.h,
              ),
              SizedBox(height: 10.h),
              customTextStyle(
                text: 'Made by',
                textWordSpacing: 5,
                textLetterSpacing: 5,
                textSize: 12.sp,
                textFamily: 'Poppins-SemiBold',
                textColor: Colors.white,
              ),
              SizedBox(height: 5.h),
              customTextStyle(
                text: 'Cloud | 9',
                textWordSpacing: 5,
                textLetterSpacing: 5,
                textFamily: 'Poppins-SemiBold',
                textSize: 20.sp,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
