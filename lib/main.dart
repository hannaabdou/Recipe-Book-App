import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/screens/splashScreen.dart';
import 'screens/HomePage.dart';
import 'screens/SearchPage.dart';
import 'screens/RecipeDetailsPage.dart';
import 'screens/savedrecipe.dart';

import 'Test_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          // home: splashScreen(),
          home: testPage(),
        );
      },
    );
  }
}
