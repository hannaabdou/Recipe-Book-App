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
              _selectedImage = File(image.path);
            });
          }
        },
        child: Container(
          width: widget.width.w,
          height: widget.height.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
            image: DecorationImage(
              image: _selectedImage != null
                  ? FileImage(_selectedImage!) as ImageProvider
                  : AssetImage('assets/IMG/Icons/Default Profile.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
