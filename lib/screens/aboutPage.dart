import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/customTextStyle.dart';
import '../widgets/aboutPageBody.dart';

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
      body: aboutPageBody(),
    );
  }
}
