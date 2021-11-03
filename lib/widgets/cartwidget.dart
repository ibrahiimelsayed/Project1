import 'package:flutter/material.dart';
import 'package:project1/classes/order.dart';
import 'package:project1/classes/product.dart';

import 'package:provider/provider.dart';

class Cartwidget extends StatefulWidget {
  const Cartwidget({Key? key}) : super(key: key);

  @override
  State<Cartwidget> createState() => _CartwidgetState();
}

class _CartwidgetState extends State<Cartwidget> {
  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Order>(context);
    List<Product> products = Provider.of<Products>(context).products;
    return Card(
      elevation: 10,
      child: ListTile(
        contentPadding: const EdgeInsets.all(15),
        title: Text(order.product.title),
        leading: CircleAvatar(
          radius: 30,
          child: Text('\$${order.product.price}'),
        ),
        trailing: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text('${order.num}X', style: const TextStyle(fontSize: 18)),
            const SizedBox(
              width: 12,
            ),
            Container(
              height: 50,
              width: 2,
              color: Colors.black,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    Provider.of<Orders>(context, listen: false)
                        .decreasetotal(order.product.id);
                    if (order.num == 0) {
                      products
                          .firstWhere(
                              (element) => element.id == order.product.id)
                          .isordered = false;
                      Provider.of<Orders>(context, listen: false)
                          .removeorder(order.product.id);
                    }
                  });
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }
}
