import 'package:e_commerce_admin/controllers/order_controller.dart';
import 'package:e_commerce_admin/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../models/models.dart';

class OrderCard extends StatelessWidget {
  OrderCard({Key? key, required this.order}) : super(key: key);

  final Order order;
  final OrderController orderController = Get.find();

  @override
  Widget build(BuildContext context) {
    var products = Product.products
        .where((product) => order.productIds.contains(product.id))
        .toList();

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order ID: ${order.id}",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    DateFormat('dd-MM-yy').format(order.createdAt),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            products[index].imageUrl,
                            fit: BoxFit.cover,
                            height: 50,
                            width: 50,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products[index].name,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            SizedBox(
                              width: 260,
                              child: Text(
                                products[index].description,
                                style: Theme.of(context).textTheme.bodyText2,
                                overflow: TextOverflow.clip,
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Delivery Fee',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        '${order.deliveryFee}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Total',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        '${order.total}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  order.isAccepted
                      ? ElevatedButton(
                          onPressed: () {
                            orderController.updateOrder(
                                order, 'isDelivered', !order.isDelivered);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kMainColor,
                              minimumSize: const Size(140, 40)),
                          child: Text(
                            'Deliver',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.white),
                          ))
                      : ElevatedButton(
                          onPressed: () {
                            orderController.updateOrder(
                                order, 'isAccepted', !order.isAccepted);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kMainColor,
                              minimumSize: const Size(140, 40)),
                          child: Text(
                            'Accept',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.white),
                          )),
                  ElevatedButton(
                      onPressed: () {
                        orderController.updateOrder(
                            order, 'isCancelled', !order.isCancelled);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kMainColor,
                          minimumSize: const Size(140, 40)),
                      child: Text(
                        'Cancel',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.white),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
