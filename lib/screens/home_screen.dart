import 'package:e_commerce_admin/controllers/order_stats_controller.dart';
import 'package:e_commerce_admin/core/constants.dart';
import 'package:e_commerce_admin/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/order_stats_model.dart';
import '../widgets/order_stats.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final OrderStatsController orderStatsController =
      Get.put(OrderStatsController());

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
            FutureBuilder(
                future: orderStatsController.stats.value,
                builder: (context, AsyncSnapshot<List<OrderStats>> snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      height: 250,
                      padding: const EdgeInsets.all(10),
                      child: CustomBarChart(
                          orderStats: snapshot.data!
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: kMainColor,
                    ),
                  );
                }
            ),
            // Container(
            //     height: 250,
            //     padding: const EdgeInsets.all(10),
            //     child: CustomBarChart(orderStats: OrderStats.data)),
            Card(
              child: Container(
                width: double.infinity,
                height: 150,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    Get.to(
                          () => ProductsScreen(),
                    );
                  },
                  child: const Center(child: Text('Go To Products')),
                ),
              ),
            ),
            Card(
              child: Container(
                width: double.infinity,
                height: 150,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    Get.to(
                          () => OrderScreen(),
                    );
                  },
                  child: const Center(child: Text('Go To Orders')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
