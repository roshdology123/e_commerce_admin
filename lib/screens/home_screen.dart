import 'package:e_commerce_admin/core/constants.dart';
import 'package:e_commerce_admin/screens/order_screen.dart';
import 'package:e_commerce_admin/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Admin Panel'),
        backgroundColor: kMainColor,
      ),
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  Get.to(
                    () => ProductsScreen(),
                  );
                },
                child: const Center(
                  child: Card(
                    child: Text('Go To Products'),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  Get.to(
                    () => OrderScreen(),
                  );
                },
                child: const Center(
                  child: Card(
                    child: Text('Go To Orders'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
