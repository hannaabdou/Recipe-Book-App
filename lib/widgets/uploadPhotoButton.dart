import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/customTextStyle.dart';
import 'UploadPhotoFunction.dart';

class uploadPhotoButton extends StatefulWidget {
  final String label;
  final double labelSize;
  final String text;
  final double textSize;
  final double width;
  final double height;
  final double iconSize;

  uploadPhotoButton({
    Key? key,
    this.label = 'Photo',
    this.text = 'Choose From Device',
    this.labelSize = 10,
    this.width = double.infinity,
    this.height = 110,
    this.iconSize = 46,
    this.textSize = 16,
  }) : super(key: key);

  @override
  _uploadPhotoButtonState createState() => _uploadPhotoButtonState();
}

class _uploadPhotoButtonState extends State<uploadPhotoButton> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final image = await UploadPhotoFunction.pickImageFromGallery();
        if (image != null) {
          setState(() {
            _selectedImage = File(image.path); // حفظ الصورة لتحديث الـ UI
          });
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customTextStyle(
            text: widget.label,
            textSize: widget.labelSize.sp,
            textFamily: 'Poppins-SemiBold',
            textColor: Colors.black,
          ),
          SizedBox(height: 2.h), // مسافة بين النص والحقل
          Container(
            width: widget.width, // عرض كامل للـ Container
            height: widget.height.h, // ارتفاع الـ Container
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
                        customTextStyle(
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
                        _selectedImage!, // عرض الصورة المحددة
                        fit: BoxFit.cover, // لتغطية الـ Container
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
