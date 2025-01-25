import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/upload_photo_function.dart';

class ProfileImage extends StatefulWidget {
  final double width;
  final double height;

  const ProfileImage({
    super.key,
    this.width = 120,
    this.height = 120,
  });

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          final image = await UploadPhotoFunction.pickImageFromGallery();
          if (image != null) {
            setState(() {
              _selectedImage = File(image.path); // حفظ الصورة لتحديث الـ UI
            });
          }
        },
        child: Container(
          width: widget.width.w, // العرض
          height: widget.height.h, // الطول
          decoration: BoxDecoration(
            shape: BoxShape.circle, // يجعل الشكل دائريًا
            color: Colors.grey[300], // لون الخلفية
            image: DecorationImage(
              image: _selectedImage != null
                  ? FileImage(_selectedImage!) as ImageProvider
                  : AssetImage('assets/IMG/Icons/Default Profile.png'),
              fit: BoxFit.cover, // لجعل الصورة تحتوي داخل الإطار
            ),
          ),
        ),
      ),
    );
  }
}
