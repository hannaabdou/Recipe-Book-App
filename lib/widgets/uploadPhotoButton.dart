import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_book_app/widgets/customTextStyle.dart';
import '../utils/UploadPhotoFunction.dart';

class uploadPhotoButton extends StatefulWidget {
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
            text: 'Photo',
            textSize: 10.sp,
            textFamily: 'Poppins-SemiBold',
            textColor: Colors.black,
          ),
          SizedBox(height: 5.h), // مسافة بين النص والحقل
          Container(
            width: double.infinity, // عرض كامل للـ Container
            height: 110.h, // ارتفاع الـ Container
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
                          size: 46.r,
                          color: Colors.grey.shade600,
                        ),
                        customTextStyle(
                          text: 'Choose From Device',
                          textFamily: 'Poppins-SemiBold',
                          textSize: 16.sp,
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
