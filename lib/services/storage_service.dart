import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class StorageService {
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> uploadImage(XFile image) async {
    try {
      if (kDebugMode) {
        print(image.name);
        print(image.path);
      }
      await storage
          .ref('product_images/${image.name}')
          .putFile(File(image.path));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<String> getDownloadURL(String imageName) async {
    String downloadURL =
        await storage.ref('product_images/$imageName').getDownloadURL();

    return downloadURL;
  }
}
