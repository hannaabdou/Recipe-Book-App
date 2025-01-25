import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/custom_app_bar.dart';
import 'package:recipe_book_app/widgets/custom_text_style.dart';
import 'package:recipe_book_app/widgets/profile_image.dart';

import 'custom_filter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedFilterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onPressed: () {},
        titleSize: 14,
        textWordSpacing: 3,
        textLetterSpacing: 1,
        showBackIcon: false,
        title: 'Profile Page',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Column(
          children: [
            ProfileImage(),
            SizedBox(height: 5.h),
            CustomTextStyle(
              text: 'Gust',
              textSize: 12.sp,
              textWeight: FontWeight.w900,
              textFamily: 'Poppins-SemiBold',
              textWordSpacing: 2.w,
              textLetterSpacing: 1.w,
              textColor: Colors.black,
            ),
            SizedBox(height: 10.h),
            CustomFilter(
              filters: ['Added Recipes', 'Saved Recipes'],
              paddingHorizontal: 10.w,
              onFilterChanged: (index) {
                setState(() {
                  _selectedFilterIndex = index; // تغيير الفلتر
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
