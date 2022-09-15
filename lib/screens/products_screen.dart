import 'package:e_commerce_admin/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product_model.dart';
import '/models/models.dart';
import '/screens/screens.dart';
import '/controllers/controllers.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

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
            Expanded(
              child: ListView.builder(
                  itemCount: Product.products.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 210,
                      child: ProductCard(
                        product: Product.products[index],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            product.name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
