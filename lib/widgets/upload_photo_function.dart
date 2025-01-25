import 'dart:io';
import 'package:image_picker/image_picker.dart';

class UploadPhotoFunction {
  static Future<File?> pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}
