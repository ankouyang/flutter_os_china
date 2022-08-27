import 'dart:convert';
import 'package:image_picker/image_picker.dart';
ImagePicker imagePicker = ImagePicker();

class ImagePickerUntil{
   static   chooseImage() async {
     XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
     if (file == null) return;
     List<int> imageBytes = await file.readAsBytes();

     String base64 = base64Encode(imageBytes);
     print(base64);
     String base64Image = "data:image/png;base64,$base64";
     return  base64Image;
   }

}