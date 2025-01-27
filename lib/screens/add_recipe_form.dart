import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/custom_app_bar.dart';
import 'package:recipe_book_app/widgets/custom_button.dart';
import 'package:recipe_book_app/widgets/custom_new_recipe_card.dart';
import 'package:recipe_book_app/widgets/custom_text_field.dart';
import 'package:recipe_book_app/widgets/upload_photo_function.dart';

class AddRecipeForm extends StatefulWidget {
  final Function(Map<String, dynamic>) addRecipe;

  const AddRecipeForm({required this.addRecipe, super.key});

  @override
  State<AddRecipeForm> createState() => _AddRecipeFormState();
}

class _AddRecipeFormState extends State<AddRecipeForm> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  List<TextEditingController> ingredientControllers = [TextEditingController()];
  List<TextEditingController> stepControllers = [TextEditingController()];
  File? _selectedImage;

  void _pickImage() async {
    final image = await UploadPhotoFunction.pickImageFromGallery();
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  void _submitRecipe() {
    if (titleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Title is required!')),
      );
      return;
    }

    final ingredients = ingredientControllers
        .map((controller) => controller.text)
        .where((text) => text.isNotEmpty)
        .toList();

    final steps = stepControllers
        .map((controller) => controller.text)
        .where((text) => text.isNotEmpty)
        .toList();

    final newRecipe = {
      'title': titleController.text,
      'description': descriptionController.text,
      'imagePath': _selectedImage?.path,
      // Explicitly null if no image is selected
      'ingredients': ingredients,
      'steps': steps,
    };

    widget.addRecipe(newRecipe);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onPressed: () {},
        showBackIcon: true,
        title: 'Add Recipe',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            CustomTextField(
              controller: titleController,
              label: 'Name *',
              hintText: 'Enter Recipe Name',
            ),
            SizedBox(height: 10.h),

            // Description
            CustomTextField(
              controller: descriptionController,
              label: 'Description (Optional)',
              maxLines: 5,
              hintText: 'Enter Description',
            ),

            SizedBox(height: 10.h),

            // Image Picker
            Center(
              child: CustomButton(
                onPressed: _pickImage,
                title: 'Upload Image (Optional)',
                titleColor: Colors.white,
                titleSize: 12.sp,
                horizontalSize: 50.w,
                icon: Icons.upload_file_outlined,
                iconSize: 10.r,
              ),
            ),
            SizedBox(height: 7.h),
            if (_selectedImage != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.file(
                  _selectedImage!,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            SizedBox(height: 10.h),

            // Ingredients
            Text(
              'Ingredients',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: ingredientControllers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: ingredientControllers[index],
                          decoration: InputDecoration(
                            hintText: 'Enter ingredient',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.remove_circle, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            ingredientControllers.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            Center(
              child: CustomButton(
                onPressed: () {
                  setState(() {
                    ingredientControllers.add(TextEditingController());
                  });
                },
                title: 'Add Ingredient',
                titleColor: Colors.white,
                titleSize: 12.sp,
                horizontalSize: 50.w,
                icon: Icons.add,
                iconSize: 10.r,
              ),
            ),
            SizedBox(height: 10.h),

            // Steps
            Text(
              'Steps',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: stepControllers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: stepControllers[index],
                          decoration: InputDecoration(
                            hintText: 'Enter step',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.remove_circle, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            stepControllers.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 10.h),

            Center(
              child: CustomButton(
                onPressed: () {
                  setState(() {
                    stepControllers.add(TextEditingController());
                  });
                },
                title: 'Add Step',
                titleColor: Colors.white,
                titleSize: 12.sp,
                horizontalSize: 50.w,
                icon: Icons.add,
                iconSize: 10.r,
              ),
            ),

            SizedBox(height: 10.h),

            // Submit Button
            Center(
              child: CustomButton(
                onPressed: _submitRecipe,
                title: 'Add Recipe',
                titleColor: Colors.white,
                buttonColor: Color(0xFFF4B855),
                titleSize: 12.sp,
                horizontalSize: 50.w,
                icon: Icons.add_task,
                iconSize: 10.r,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
