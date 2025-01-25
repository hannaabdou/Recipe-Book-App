import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/screens/about_page.dart';
import 'package:recipe_book_app/utils/colors.dart';
import 'package:recipe_book_app/widgets/custom_app_bar.dart';
import 'package:recipe_book_app/widgets/custom_text_style.dart';
import 'package:recipe_book_app/widgets/text_link.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onPressed: () {},
        titleSize: 14,
        textWordSpacing: 3,
        textLetterSpacing: 1,
        showBackIcon: false,
        title: 'Setting Page',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.dark_mode, size: 25.r),
                    SizedBox(width: 5.w),
                    CustomTextStyle(
                      text: 'Dark Mode',
                      textSize: 16.sp,
                      textFamily: 'Poppins-SemiBold',
                      textColor: Colors.black,
                    ),
                  ],
                ),
                Transform.scale(
                  scale: 0.7.r, // يمكنك تغيير هذه القيمة لتحديد الحجم
                  child: Switch(
                    value: isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        isDarkMode = value; // تغيير حالة الوضع الداكن
                      });
                    },
                    activeColor: AppColors.primaryColor,
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.grey[300],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Icon(Icons.info_outline, size: 25.r),
                TextLink(
                  text: 'About App',
                  textSize: 16.sp,
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            AboutPage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          // التأثير هنا هو التلاشي
                          var fadeAnimation =
                              Tween(begin: 0.0, end: 1.0).animate(animation);
                          return FadeTransition(
                              opacity: fadeAnimation, child: child);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
