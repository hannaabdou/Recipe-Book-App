import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/screens/home_page_wrapper.dart';
import '../utils/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/social_button.dart';
import '../widgets/text_link.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isChecked = false;

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
                      'Create an account',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Let’s help you set up your account,\nit won’t take long.',
                      style: TextStyle(
                        fontFamily: 'Poppins-SemiBold',
                        fontSize: 8.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  label: 'Name',
                  labelSize: 12.sp,
                  labelFamily: 'Poppins-SemiBold',
                  hintText: 'Enter Name',
                ),
                SizedBox(height: 5.h),
                CustomTextField(
                  label: 'Email',
                  labelSize: 12.sp,
                  labelFamily: 'Poppins-SemiBold',
                  hintText: 'Enter Email',
                ),
                SizedBox(height: 5.h),
                CustomTextField(
                  label: 'Password',
                  labelSize: 12.sp,
                  labelFamily: 'Poppins-SemiBold',
                  hintText: 'Enter Password',
                ),
                SizedBox(height: 5.h),
                CustomTextField(
                  label: 'Confirm Password',
                  labelSize: 12.sp,
                  labelFamily: 'Poppins-SemiBold',
                  hintText: 'Retype Password',
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      activeColor: AppColors.TextLinkColor,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      },
                    ),
                    TextLink(
                      onPressed: () {
                        setState(
                          () {
                            isChecked = !isChecked;
                          },
                        );
                      },
                      text: 'Accept terms & Condition',
                      textSize: 10.sp,
                      textColor: AppColors.TextLinkColor,
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Center(
                  child: CustomButton(
                    title: 'Sign Up',
                    titleSize: 12.sp,
                    titleColor: Colors.white,
                    icon: Icons.arrow_forward,
                    iconSize: 16.r,
                    verticalSize: 7.h,
                    horizontalSize: 100.w,
                    iconOnRight: true,
                    onPressed: () {
                      Navigator.pushReplacement(
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
                        'Or Sign Up With',
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
                    SizedBox(width: 10.w),
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
                      'Already a member?',
                      style: TextStyle(fontSize: 10.sp),
                    ),
                    TextLink(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: 'Sign In',
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
