import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

chooseImagePicker(ImageSource source) async {
  File? file;
  final myfile = await ImagePicker().pickImage(source: source);
  if (myfile != null) {
    file = File(myfile.path);
  }
  return file;
}

chooseImagePickerCamera() async {
  final myfile = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 90);
  if (myfile != null) {
    return File(myfile.path);
  } else {
    return null;
  }
}

chooseImagePickerGallery([isSvg = false]) async {
  final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: isSvg
          ? ["svg", "SVG"]
          : ["png", "PNG", "jpg", "JPG", "jpeg", "JPEG", "gif", "GIF"]);

  //final myfile = await ImagePicker().getImage(source: ImageSource.camera);
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}
