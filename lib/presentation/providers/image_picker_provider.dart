import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImagePickerProvider extends ChangeNotifier {
  String _pickedImageName = "";
  FilePickerResult? _pickedImage;

  FilePickerResult? get pickedImage => _pickedImage;

  String get getPickedImageName => _pickedImageName;

  void clearPreviousState() {
    _pickedImageName = "";
    _pickedImage = null;
    notifyListeners();
  }

  Future<FilePickerResult?> pickImage() async {
    _pickedImage = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (_pickedImage != null) {
      _pickedImageName = _pickedImage!.paths.first!.split("/").last;
    } else {
      _pickedImageName = "";
    }

    notifyListeners();

    return _pickedImage;
  }
}
