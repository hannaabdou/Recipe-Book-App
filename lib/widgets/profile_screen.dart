import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/custom_app_bar.dart';
import 'package:recipe_book_app/widgets/custom_text_style.dart';
import 'package:recipe_book_app/widgets/profile_image.dart';
import 'custom_filter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedFilterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleSize: 14,
        textWordSpacing: 3,
        textLetterSpacing: 1,
        showMoreIcon: true,
        onPressed: () {
          showMenu(
            context: context,
            position: RelativeRect.fromLTRB(100, 50, 0, 0), // Adjust as needed
            items: [
              PopupMenuItem(
                value: 'edit_profile',
                child: AnimatedMenuItem(
                  imagePath: 'assets/IMG/Icons/edit profile.png',
                  iconColor: const Color.fromARGB(255, 12, 147, 41),
                  text: "Edit Profile",
                ),
              ),
              PopupMenuItem(
                value: 'edit_recipe',
                child: AnimatedMenuItem(
                  imagePath: 'assets/IMG/Icons/edit recipe.png',
                  iconColor: Colors.grey.shade800,
                  text: "Edit Recipe",
                ),
              ),
            ],
          ).then((value) {
            if (value == 'edit_profile') {
              print("Edit Profile Selected");
            } else if (value == 'edit_recipe') {
              print("Edit Recipe Selected");
            }
          });
        },
        showBackIcon: false,
        title: 'Profile Page',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Column(
          children: [
            ProfileImage(),
            SizedBox(height: 5.h),
            CustomTextStyle(
              text: 'Gust',
              textSize: 12.sp,
              textWeight: FontWeight.w900,
              textFamily: 'Poppins-SemiBold',
              textWordSpacing: 2.w,
              textLetterSpacing: 1.w,
              textColor: Colors.black,
            ),
            SizedBox(height: 10.h),
            CustomFilter(
              filters: ['Added Recipes', 'Saved Recipes'],
              paddingHorizontal: 10.w,
              onFilterChanged: (index) {
                setState(() {
                  _selectedFilterIndex = index;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedMenuItem extends StatefulWidget {
  final String imagePath;
  final Color iconColor;
  final String text;

  const AnimatedMenuItem({
    super.key,
    required this.imagePath,
    required this.iconColor,
    required this.text,
  });

  @override
  _AnimatedMenuItemState createState() => _AnimatedMenuItemState();
}

class _AnimatedMenuItemState extends State<AnimatedMenuItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        decoration: BoxDecoration(),
        padding: EdgeInsets.all(8.w), // Using ScreenUtil for padding
        child: Row(
          children: [
            Image.asset(
              widget.imagePath,
              width: 26.w, // Adjusted width for responsive design
              height: 26.h, // Adjusted height for responsive design
            ),
            const SizedBox(width: 10),
            Text(widget.text),
          ],
        ),
      ),
    );
  }
}
