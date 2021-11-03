import 'package:flutter/material.dart';
import 'package:project1/classes/order.dart';
import 'package:project1/widgets/cartwidget.dart';
import 'package:project1/widgets/totalwidget.dart';
import 'package:provider/provider.dart';

class Orderscart extends StatelessWidget {
  const Orderscart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Order> orders = Provider.of<Orders>(context).orders;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Orders'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Total(),
              Expanded(
                child: ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (_, i) => ChangeNotifierProvider.value(
                          value: orders[i],
                          child: const Cartwidget(),
                        )),
              )
            ],
          ),
        ));
  }
}
