import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/screens/home_page_wrapper.dart';
import 'package:recipe_book_app/screens/sign_up_page.dart';
import '../utils/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/social_button.dart';
import '../widgets/text_link.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: TextStyle(
                        fontSize: 26.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontFamily: 'Poppins-SemiBold',
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  label: 'Email',
                  labelSize: 14.sp,
                  labelFamily: 'Poppins-SemiBold',
                  hintText: 'Enter Email',
                ),
                SizedBox(height: 5.h),
                CustomTextField(
                  label: 'Password',
                  labelSize: 14.sp,
                  labelFamily: 'Poppins-SemiBold',
                  hintText: 'Enter Password',
                ),
                SizedBox(height: 5.h),
                TextLink(
                  onPressed: () {},
                  text: 'Forgot Password?',
                  textSize: 10.sp,
                  textColor: AppColors.TextLinkColor,
                ),
                SizedBox(height: 5.h),
                Center(
                  child: CustomButton(
                    title: 'Sign In',
                    titleSize: 12.sp,
                    titleColor: Colors.white,
                    icon: Icons.arrow_forward,
                    iconSize: 16.r,
                    verticalSize: 7.h,
                    horizontalSize: 100.w,
                    iconOnRight: true,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePageWrapper(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1.5.w,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        'Or Sign in With',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 6.sp,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1.5.w,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      onPressed: () {},
                      imagePath: 'assets/IMG/Icons/Google Icon.png',
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SocialButton(
                      onPressed: () {},
                      imagePath: 'assets/IMG/Icons/Facebook Icon.png',
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: TextStyle(fontSize: 10.sp),
                    ),
                    TextLink(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ),
                        );
                      },
                      text: 'Sign up',
                      textSize: 10.sp,
                      textColor: AppColors.TextLinkColor,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
