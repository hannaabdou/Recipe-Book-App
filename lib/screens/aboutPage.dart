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

// import 'package:flutter/material.dart';
//
// class aboutPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background Image
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/IMG/Wallpaper.png'), // Add your image to assets
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           // Content
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Recipe Rleam',
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   'Version 1.1.1.1',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Icon(
//                   Icons.restaurant_menu,
//                   size: 50,
//                   color: Colors.white,
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   'Made by',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   'Cloud | 9',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
