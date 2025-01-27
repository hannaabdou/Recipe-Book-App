import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_book_app/screens/home_page_wrapper.dart';
import 'package:recipe_book_app/screens/splash_screen.dart';
import 'package:recipe_book_app/utils/boxs.dart';


void main() async {
  await Hive.initFlutter();

  await Hive.openBox(KBoxs.addRecipeBox);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          // home: SplashScreen(),
          home: HomePageWrapper(),
        );
      },
    );
  }
}
