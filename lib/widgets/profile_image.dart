import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatefulWidget {
  final double width;
  final double height;
  final VoidCallback onPressed;

  const ProfileImage({
    super.key,
    this.width = 120,
    this.height = 120,
    required this.onPressed,
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
        onTap: widget.onPressed,
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
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
