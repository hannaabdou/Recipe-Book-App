import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/custom_text_style.dart';
import 'package:recipe_book_app/widgets/profile_image.dart';

import 'custom_app_bar.dart';
import 'custom_filter.dart';

class HomeScreen extends StatefulWidget {
  final List<String> filters = [
    'Breakfast',
    'Lunch',
    'Dinner',
    'Chicken',
    'Beef',
    'Vegetarian',
    'Snacks',
    'Desserts'
  ];

  HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        title: 'Home Page',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextStyle(
                      text: 'Hello, Mohamed Abdelsatar',
                      textFamily: 'Poppins-SemiBold',
                      textSize: 10.sp,
                      textLetterSpacing: 0.5.w,
                      textColor: Colors.black,
                    ),
                    CustomTextStyle(
                      text: 'What are you Cooking Today?',
                      textFamily: 'Poppins-Thin',
                      textWeight: FontWeight.bold,
                      textSize: 8.sp,
                      textColor: Colors.black,
                    ),
                  ],
                ),
                ProfileImage(
                  width: 35,
                  height: 35,
                ),
              ],
            ),
            SizedBox(height: 23.h),
            CustomFilter(
              filters: widget.filters,
              paddingHorizontal: 5.w,
              paddingVertical: 2.h,
              onFilterChanged: (index) {
                setState(() {
                  _selectedFilterIndex = index; // تغيير الفلتر
                });
              },
            ),
            SizedBox(height: 16.h),

          ],
        ),
      ),
    );
  }
}
