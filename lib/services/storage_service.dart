import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StorageService {
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> uploadImage(XFile image) async {
    try {
      print(image.name);
      print(image.path);
      await storage
          .ref()
          .child('product_images')
          .child('/${image.name}')
          .putFile(File(image.path));
    } catch (e) {
      print(e);
    }
  }

  Future<String> getDownloadURL(String imageName) async {
    String downloadURL =
        await storage.ref('product_images/$imageName').getDownloadURL();

    return downloadURL;
  }
}
