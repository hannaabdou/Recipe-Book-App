// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:recipe_book_app/widgets/CustomButton.dart';
//
// class UploadPhotoButton extends StatefulWidget {
//   const UploadPhotoButton({super.key});
//
//   @override
//   _UploadPhotoButtonState createState() => _UploadPhotoButtonState();
// }
//
// class _UploadPhotoButtonState extends State<UploadPhotoButton> {
//   File? _image;
//   final ImagePicker _picker = ImagePicker();
//
//   Future<void> _pickImage() async {
//     // طلب الإذن للوصول إلى الملفات
//     var status = await Permission.storage.request();
//
//     if (status.isGranted) {
//       // اختيار الصورة من المعرض
//       final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//       if (image != null) {
//         setState(() {
//           _image = File(image.path);
//         });
//       }
//     } else {
//       // إذا تم رفض الإذن
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Permission denied to access files.'),
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         CustomButton(
//           title: 'Upload Photo',
//           onPressed: _pickImage,
//         ),
//         if (_image != null)
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Image.file(
//               _image!,
//               width: 150,
//               height: 150,
//             ),
//           ),
//       ],
//     );
//   }
// }
