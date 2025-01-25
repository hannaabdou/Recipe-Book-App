import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/screens/sign_in_page.dart';
import 'package:recipe_book_app/widgets/custom_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/IMG/Wallpaper.png',
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/IMG/Icons/Logo 2.png',
                  width: 80.w,
                  height: 80.h,
                ),
                SizedBox(height: 7.h),
                Text(
                  '100K+ Premium Recipe ',
                  style: TextStyle(
                    fontSize: 17.sp,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Recipe Realm',
                  style: TextStyle(
                    fontSize: 30.sp,
                    decoration: TextDecoration.none,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Simple way to find Tasty Recipe',
                  style: TextStyle(
                    fontSize: 10.sp,
                    decoration: TextDecoration.none,
                    fontFamily: 'Poppins-Thin',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            CustomButton(
              title: 'Start Cooking',
              titleSize: 14.sp,
              titleColor: Colors.white,
              icon: Icons.arrow_forward,
              iconSize: 16.r,
              verticalSize: 7.h,
              horizontalSize: 50.w,
              iconOnRight: true,
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 600),
                    // المدة لجعل الأنيميشن أبطأ
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        SignInPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0); // الانتقال من اليمين
                      const end = Offset.zero;
                      const curve = Curves.easeInOut;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
