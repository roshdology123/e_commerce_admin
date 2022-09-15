import 'package:e_commerce_admin/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '/controllers/controllers.dart';
class NewProductScreen extends StatelessWidget {
  const NewProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add a Product'),
        backgroundColor: kMainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: const [

          ],
        ),
      ),
    );
  }
}