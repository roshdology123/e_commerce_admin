import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants.dart';
import '../screens/new_product_screen.dart';

class CustomAddProductCard extends StatelessWidget {
  const CustomAddProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        margin: EdgeInsets.zero,
        color: kMainColor,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Get.to(
                  () => NewProductScreen(),
                  transition: Transition.leftToRight,
                );
              },
              icon: const Icon(
                Icons.add_circle,
                color: Colors.white,
              ),
            ),
            Text(
              'Add a New Product',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
