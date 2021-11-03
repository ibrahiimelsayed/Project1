import 'package:flutter/material.dart';
import 'package:project1/classes/order.dart';
//import 'package:project1/classes/product.dart';
import 'package:project1/widgets/drawerwidget.dart';
import 'package:project1/widgets/ordercard.dart';
import 'package:provider/provider.dart';

class YourOrders extends StatelessWidget {
  static const routeNamed = 'your_orders';
  const YourOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Order> orders = Provider.of<Orders>(context).orders;
    return Scaffold(
      appBar: AppBar(title: const Text('YOUR ORDERS')),
      drawer: const Drawerwidget(),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 1,
          thickness: 0,
        ),
        itemCount: orders.length,
        itemBuilder: (_, i) => ChangeNotifierProvider.value(
            value: orders[i], child: const OrderCard()),
      ),
    );
  }
}
