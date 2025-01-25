import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/screens/start_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _moveUpAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      // زيادة المدة إلى 5 ثوانٍ (يمكنك تعديل هذه القيمة حسب الحاجة)
      vsync: this,
    );

    _fadeInAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _moveUpAnimation =
        Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
      CurvedAnimation(
          parent: _controller,
          curve:
              Curves.easeInOut), // تغيير إلى easeInOut لجعل الحركة أكثر سلاسة
    );

    // Start the animations when the splash screen is shown
    _controller.forward();

    // Navigate after animation completes
    _controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          // After the animation is completed, navigate to the next page with fade-in animation
          Future.delayed(
            Duration(milliseconds: 3000),
            () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      StartPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const curve = Curves.easeInOut;

                    // Define opacity animation
                    var opacityAnimation = animation.drive(
                      CurveTween(curve: curve),
                    );

                    return FadeTransition(
                      opacity: opacityAnimation,
                      child: child,
                    );
                  },
                ),
              );
            },
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/IMG/Wallpaper.png', // خلفية
            fit: BoxFit.cover,
          ),
          FadeTransition(
            opacity: _fadeInAnimation,
            child: SlideTransition(
              position: _moveUpAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/IMG/Icons/Logo 2.png', // شعار
                    width: 100.w,
                    height: 100.h,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    '100K+ Premium Recipe ',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}