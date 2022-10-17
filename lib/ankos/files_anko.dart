import 'dart:convert';
import 'dart:io';

extension FileAnko on File {
  ///? Convert File To Base64
  String get toBase64 {
    List<int> imageBytes = readAsBytesSync();
    return base64Encode(imageBytes);
  }
}
