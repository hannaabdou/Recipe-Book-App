import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/screens/signUpPage.dart';
import '../Test_Page.dart';
import '../utils/colors.dart';
import '../widgets/CustomButton.dart';
import '../widgets/CustomTextField.dart';
import '../widgets/socialButton.dart';
import '../widgets/textButton.dart';

class signInPage extends StatelessWidget {
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
                //Top Body
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
                textButton(
                  onPressed: () {},
                  text: 'Forgot Password?',
                  textSize: 10.sp,
                  textColor: AppColors.textButtonColor,
                ),
                SizedBox(height: 5.h),
                //Bottom Body
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
                          builder: (context) => testPage(),
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
                    socialButton(
                      onPressed: () {},
                      imagePath: 'assets/IMG/Icons/Google Icon.png',
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    socialButton(
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
                    textButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => signUpPage(),
                          ),
                        );
                      },
                      text: 'Sign up',
                      textSize: 10.sp,
                      textColor: AppColors.textButtonColor,
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
