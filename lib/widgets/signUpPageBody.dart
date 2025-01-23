import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/utils/colors.dart';
import 'package:recipe_book_app/widgets/CustomButton.dart';
import 'package:recipe_book_app/widgets/socialButton.dart';
import 'package:recipe_book_app/widgets/textButton.dart';

import 'AcceptTermsWidget.dart';
import 'CustomTextField.dart';

class signUpPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
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
                  'Create an account',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Let’s help you set up your account,\n it won’t take long.',
                  style: TextStyle(
                    fontFamily: 'Poppins-SemiBold',
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.h),
            CustomTextField(
              label: 'Name',
              labelSize: 14.sp,
              labelFamily: 'Poppins-SemiBold',
              hintText: 'Enter Name',
            ),
            SizedBox(height: 7.h),
            CustomTextField(
              label: 'Email',
              labelSize: 14.sp,
              labelFamily: 'Poppins-SemiBold',
              hintText: 'Enter Email',
            ),
            SizedBox(height: 7.h),
            CustomTextField(
              label: 'Password',
              labelSize: 14.sp,
              labelFamily: 'Poppins-SemiBold',
              hintText: 'Enter Password',
            ),
            SizedBox(height: 7.h),
            CustomTextField(
              label: 'Confirm Password',
              labelSize: 14.sp,
              labelFamily: 'Poppins-SemiBold',
              hintText: 'Retype Password',
            ),
            SizedBox(height: 5.h),
            AcceptTermsWidget(),
            SizedBox(height: 5.h),
            //Bottom Body
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
                onPressed: () {},
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
            SizedBox(height: 20.h),
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
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already a member?',
                  style: TextStyle(fontSize: 10.sp),
                ),
                textButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'Sign In',
                  textSize: 10.sp,
                  textColor: AppColors.textButtonColor,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
