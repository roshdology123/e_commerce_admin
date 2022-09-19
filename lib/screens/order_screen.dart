import 'package:e_commerce_admin/controllers/order_controller.dart';
import 'package:e_commerce_admin/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/order_card.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);
  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        backgroundColor: kMainColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                  itemCount: orderController.pendingOrders.length,
                  itemBuilder: (BuildContext context, int index) {
                    return OrderCard(order: orderController.orders[index]);
                  });
            }),
          ),
        ],
      ),
    );
  }
}
