import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/custom_app_bar.dart';
import 'package:recipe_book_app/widgets/custom_text_style.dart';
import 'package:recipe_book_app/widgets/profile_image.dart';
import 'package:recipe_book_app/widgets/upload_photo_function.dart';
import 'custom_filter.dart';

class ProfileScreen extends StatefulWidget {
  final List<Map<String, dynamic>> recipes;
  final Function(Map<String, dynamic>)? addRecipe;

  const ProfileScreen({required this.recipes, this.addRecipe, super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _selectedImage;
  int _selectedFilterIndex = 0;

  // Filtered recipes based on selected filter
  List<Map<String, dynamic>> get filteredRecipes {
    if (_selectedFilterIndex == 0) {
      return widget.recipes; // Show all recipes
    } else if (_selectedFilterIndex == 1) {
      return widget.recipes.where((recipe) => recipe['saved'] == true).toList();
    }
    return [];
  }

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
            ProfileImage(
              onPressed: () async {
                final image = await UploadPhotoFunction.pickImageFromGallery();
                if (image != null) {
                  setState(() {
                    _selectedImage = File(image.path);
                  });
                }
              },
            ),
            SizedBox(height: 5.h),
            CustomTextStyle(
              text: 'User',
              textSize: 12.sp,
              textWeight: FontWeight.w900,
              textFamily: 'Poppins-SemiBold',
              textWordSpacing: 2.w,
              textLetterSpacing: 1.w,
              textColor: Colors.black,
            ),
            SizedBox(height: 10.h),
            // Custom Filter
            CustomFilter(
              filters: ['Added Recipes', 'Saved Recipes'],
              paddingHorizontal: 10.w,
              onFilterChanged: (index) {
                setState(() {
                  _selectedFilterIndex = index;
                });
              },
            ),
            SizedBox(height: 10.h),
            // Recipe List
            Expanded(
              child: filteredRecipes.isEmpty
                  ? Center(
                      child: CustomTextStyle(
                        text: 'No Recipes Found',
                        textSize: 10.sp,
                        textFamily: 'Poppins-Thin',
                        textWeight: FontWeight.w700,
                        textLetterSpacing: 1.w,
                        textWordSpacing: 2.w,
                        textColor: Colors.black,
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredRecipes.length,
                      itemBuilder: (context, index) {
                        final recipe = filteredRecipes[index];
                        final imagePath = recipe['imagePath'] as String?;

                        return ListTile(
                          leading: imagePath != null
                              ? Image.file(
                                  File(imagePath),
                                  width: 50.w,
                                  height: 50.h,
                                  fit: BoxFit.contain,
                                )
                              : Icon(Icons.image,
                                  size: 50.r, color: Colors.grey),
                          title: Text(recipe['title'] ?? 'No Title'),
                          subtitle:
                              Text(recipe['description'] ?? 'No Description'),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              // Confirm deletion before removing the recipe
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Delete Recipe'),
                                    content: Text(
                                        'Are you sure you want to delete this recipe? This action cannot be undone.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        // Cancel
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            // Remove the recipe from the list
                                            widget.recipes.remove(recipe);
                                          });
                                          Navigator.of(context)
                                              .pop(); // Close the dialog
                                        },
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
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
