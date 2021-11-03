import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/classes/order.dart';
import 'package:provider/provider.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Order>(context);
    return Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        shadowColor: const Color.fromRGBO(0, 0, 0, 1),
        child: ExpansionTile(
          title: Text(order.product.price.toString()),
          subtitle: Text(order.date),
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    order.product.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text('${order.num} x \$${order.product.price}')
                ],
              ),
            )
          ],
        ));
  }
}
