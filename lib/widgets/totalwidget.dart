import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/classes/order.dart';
import 'package:provider/provider.dart';

class Total extends StatelessWidget {
  const Total({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Order> orders = Provider.of<Orders>(context).orders;
    return Card(
      semanticContainer: true,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Expanded(
            child: Text(
              'Total',
              style: TextStyle(fontSize: 25),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '${Provider.of<Orders>(context, listen: false).orderprices(orders)}\$',
                  style: const TextStyle(fontSize: 18)),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text('Order Now',
              style: TextStyle(
                  fontSize: 18,
                  color: orders.isEmpty
                      ? Colors.grey
                      : Theme.of(context).colorScheme.primary))
        ]),
      ),
    );
  }
}
