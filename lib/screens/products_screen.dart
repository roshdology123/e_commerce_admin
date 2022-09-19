import 'package:e_commerce_admin/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/widgets.dart';
import '/controllers/controllers.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Products'),
        backgroundColor: kMainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const CustomAddProductCard(),
            Expanded(
              child: Obx(
                () => ListView.builder(
                    itemCount: productController.products.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 230,
                        child: ProductCard(
                          product: productController.products[index],
                          index: index,
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
