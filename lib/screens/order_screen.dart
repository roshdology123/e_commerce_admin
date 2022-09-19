import 'package:e_commerce_admin/core/constants.dart';
import 'package:flutter/material.dart';

import '../models/order_model.dart';
import '../widgets/order_card.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

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
            child: ListView.builder(
                itemCount: Order.orders.length,
                itemBuilder: (BuildContext context, int index) {
                  return OrderCard(order: Order.orders[index]);
                }),
          ),
        ],
      ),
    );
  }
}
