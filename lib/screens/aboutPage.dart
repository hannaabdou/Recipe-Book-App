import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/customTextStyle.dart';

class aboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // لجعل الـ AppBar فوق المحتوى
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h), // ضبط ارتفاع الـ AppBar
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: AppBar(
              backgroundColor: Colors.transparent,
              // خلفية شفافة
              elevation: 0,
              // إزالة الظلال
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white, // لون الأيقونة
                  size: 18.r,
                ),
                onPressed: () {
                  Navigator.pop(context); // العودة للخلف
                },
              ),
              centerTitle: true,
              // النص في المنتصف
              title: customTextStyle(
                text: 'About App',
                textWordSpacing: 5,
                textLetterSpacing: 3,
                textSize: 12.sp,
                textColor: Colors.white,
              )),
        ),
      ),
      body: Stack(
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
      ),
    );
  }
}
