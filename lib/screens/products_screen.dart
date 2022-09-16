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
                      height: 230,
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
            const SizedBox(height: 10,),
            Text(
              product.description,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(height: 10,),
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
                const SizedBox(width: 15,),

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
                            width: 165,
                            child: Slider(
                              value: product.price,
                              min: 0,max: 25,
                              divisions: 10,
                              activeColor: kMainColor,
                              inactiveColor: kMainColor,
                              onChanged: (value){

                            },
                            ),
                          ),
                          Text(
                            '\$${product.price.toStringAsFixed(1)}',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        children: [
                           SizedBox(
                            width: 40,
                            child: Text(
                              'Qty',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          const SizedBox(width: 5,),
                          SizedBox(
                            width: 160,
                            child: Slider(
                              value: product.quantity.toDouble(),
                              min: 0,max: 100,
                              divisions: 10,
                              activeColor: kMainColor,
                              inactiveColor: kMainColor,
                              onChanged: (value){

                              },
                            ),
                          ),
                          Text(
                            '\$${product.quantity.toInt()}',
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
