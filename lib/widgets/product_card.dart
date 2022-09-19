import 'package:e_commerce_admin/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants.dart';
import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int index;

  ProductCard({Key? key, required this.product, required this.index})
      : super(key: key);

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              product.description,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                            child: Text(
                              'Price',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          SizedBox(
                            width: 155,
                            child: Slider(
                              value: product.price,
                              min: 0,
                              max: 25,
                              divisions: 100,
                              activeColor: kMainColor,
                              inactiveColor: kMainColor,
                              onChanged: (value) {
                                productController.updateProductPrice(
                                    index, product, value);
                              },
                              onChangeEnd: (value) {
                                productController.saveNewProductPrice(
                                    product, 'price', value);
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            '\$${product.price.toStringAsFixed(1)}',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                            child: Text(
                              'Qty.',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          SizedBox(
                            width: 155,
                            child: Slider(
                              value: product.quantity.toDouble(),
                              min: 0,
                              max: 100,
                              divisions: 20,
                              activeColor: kMainColor,
                              inactiveColor: kMainColor,
                              onChanged: (value) {
                                productController.updateProductQuantity(
                                  index,
                                  product,
                                  value.toInt(),
                                );
                                onChangeEnd:
                                (value) {
                                  productController.saveNewProductQuantity(
                                      product, 'quantity', value);
                                };
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            '${product.quantity.toInt()}',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
