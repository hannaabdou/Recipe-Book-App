import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/custom_text_style.dart';
import 'upload_photo_function.dart';

class UploadPhotoButton extends StatefulWidget {
  final String label;
  final String text;
  final double labelSize;
  final double textSize;
  final double width;
  final double height;
  final double iconSize;

  const UploadPhotoButton({
    Key? key,
    this.label = 'Photo',
    this.text = 'Choose From Device',
    this.labelSize = 12,
    this.textSize = 14,
    this.width = double.infinity,
    this.height = 110,
    this.iconSize = 46,
  }) : super(key: key);

  @override
  State<UploadPhotoButton> createState() => _UploadPhotoButtonState();
}

class _UploadPhotoButtonState extends State<UploadPhotoButton> {
  File? _selectedImage;

  void _pickImage() async {
    final image = await UploadPhotoFunction.pickImageFromGallery();
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextStyle(
            text: widget.label,
            textSize: widget.labelSize.sp,
            textFamily: 'Poppins-SemiBold',
            textColor: Colors.black,
          ),
          SizedBox(height: 8.h),
          Container(
            width: widget.width,
            height: widget.height.h,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: _selectedImage == null
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.photo,
                  size: widget.iconSize.r,
                  color: Colors.grey.shade600,
                ),
                SizedBox(height: 5.h),
                CustomTextStyle(
                  text: widget.text,
                  textFamily: 'Poppins-Regular',
                  textSize: widget.textSize.sp,
                  textColor: Colors.grey.shade600,
                ),
              ],
            )
                : ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.file(
                _selectedImage!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
