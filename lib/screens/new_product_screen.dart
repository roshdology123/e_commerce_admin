import 'package:e_commerce_admin/core/constants.dart';
import 'package:e_commerce_admin/services/storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '/controllers/controllers.dart';

class NewProductScreen extends StatelessWidget {
  NewProductScreen({Key? key}) : super(key: key);

  final ProductController productController = Get.find();
  StorageService storageService = StorageService();

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
        child: Obx(() {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: kMainColor,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            ImagePicker picker = ImagePicker();
                            final XFile? image = await picker.pickImage(
                                source: ImageSource.gallery);

                            if (image == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('No Image Was Selected')));
                            }
                            if (image != null) {
                              await storageService.uploadImage(image);

                              // var imageUrl = await storageService
                              //     .getDownloadURL(image.name);
                              // productController.newProduct.update(
                              //     'imageUrl', (_) => imageUrl,
                              //     ifAbsent: () => imageUrl);
                              // if (kDebugMode) {
                              //   print(productController.newProduct['imageUrl']);
                              // }
                            }
                          },
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Add an Image',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Product Information',
                  style: Theme.of(context).textTheme.headline6,
                ),
                _buildTextFormField('Product ID', 'id', productController,
                    FilteringTextInputFormatter.digitsOnly),
                _buildTextFormField('Product Name', 'name', productController,
                    FilteringTextInputFormatter.singleLineFormatter),
                _buildTextFormField(
                    'Product Description',
                    'description',
                    productController,
                    FilteringTextInputFormatter.singleLineFormatter),
                _buildTextFormField(
                    'Product Category',
                    'category',
                    productController,
                    FilteringTextInputFormatter.singleLineFormatter),
                const SizedBox(
                  height: 10,
                ),
                _buildTextFormField(
                  'Price',
                  'price',
                  productController,
                  FilteringTextInputFormatter.digitsOnly,
                ),
                _buildTextFormField('Quantity', 'quantity', productController,
                    FilteringTextInputFormatter.singleLineFormatter),
                _buildCheckbox(context, 'Recommended', 'isRecommended',
                    productController, productController.isRecommended),
                _buildCheckbox(context, 'Popular', 'isPopular',
                    productController, productController.isPopular),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (kDebugMode) {
                        print(productController.newProduct);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: kMainColor,
                    ),
                    child: Text(
                      'Save',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Row _buildCheckbox(BuildContext context, String title, String name,
      ProductController productController, bool? controllerValue) {
    return Row(
      children: [
        SizedBox(
          width: 125,
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Checkbox(
          value: (controllerValue == null) ? false : controllerValue,
          onChanged: (value) {
            productController.newProduct
                .update(name, (_) => value, ifAbsent: () => value);
          },
          activeColor: Colors.black12,
          checkColor: kMainColor,
        ),
      ],
    );
  }

  Row _buildSlider(
    BuildContext context,
    String title,
    String name,
    ProductController productController,
    double? controllerValue,
  ) {
    return Row(
      children: [
        SizedBox(
          width: 75,
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Slider(
            value: (controllerValue == null) ? 0 : controllerValue,
            min: 0,
            max: 25,
            divisions: 100,
            activeColor: kMainColor,
            inactiveColor: kMainColor,
            onChanged: (value) {
              productController.newProduct
                  .update(name, (_) => value, ifAbsent: () => value);
            },
          ),
        ),
        Text(
          (controllerValue == null) ? '0' : controllerValue.toStringAsFixed(1),
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }

  TextFormField _buildTextFormField(String hintText, String name,
      ProductController productController, var filteringTextInputFormatter) {
    return TextFormField(
      inputFormatters: [filteringTextInputFormatter],
      decoration: InputDecoration(hintText: hintText),
      onChanged: (value) {
        productController.newProduct
            .update(name, (_) => value, ifAbsent: () => value);
      },
    );
  }
}
