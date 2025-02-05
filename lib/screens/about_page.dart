import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/custom_text_style.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 18.r,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              centerTitle: true,
              title: CustomTextStyle(
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
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/IMG/Wallpaper.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextStyle(
                  text: 'Recipe Rleam',
                  textWordSpacing: 5,
                  textLetterSpacing: 5,
                  textSize: 20.sp,
                  textColor: Colors.white,
                ),
                SizedBox(height: 5.h),
                CustomTextStyle(
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
                CustomTextStyle(
                  text: 'Made by',
                  textWordSpacing: 5,
                  textLetterSpacing: 5,
                  textSize: 12.sp,
                  textFamily: 'Poppins-SemiBold',
                  textColor: Colors.white,
                ),
                SizedBox(height: 5.h),
                CustomTextStyle(
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
