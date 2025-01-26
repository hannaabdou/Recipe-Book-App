import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/custom_text_style.dart';
import 'upload_photo_function.dart';

class UploadPhotoButton extends StatefulWidget {
  final String label;
  final double labelSize;
  final String text;
  final double textSize;
  final double width;
  final double height;
  final double iconSize;

  const UploadPhotoButton({
    super.key,
    this.label = 'Photo',
    this.text = 'Choose From Device',
    this.labelSize = 10,
    this.width = double.infinity,
    this.height = 110,
    this.iconSize = 46,
    this.textSize = 16,
  });

  @override
  _UploadPhotoButtonState createState() => _UploadPhotoButtonState();
}

class _UploadPhotoButtonState extends State<UploadPhotoButton> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final image = await UploadPhotoFunction.pickImageFromGallery();
        if (image != null) {
          setState(() {
            _selectedImage = File(image.path);
          });
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextStyle(
            text: widget.label,
            textSize: widget.labelSize.sp,
            textFamily: 'Poppins-SemiBold',
            textColor: Colors.black,
          ),
          SizedBox(height: 2.h),
          Container(
            width: widget.width,
            height: widget.height.h,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
                vertical: 5.h,
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
                        CustomTextStyle(
                          text: widget.text,
                          textFamily: 'Poppins-SemiBold',
                          textSize: widget.textSize.sp,
                          textColor: Colors.grey.shade600,
                        ),
                      ],
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        _selectedImage!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
