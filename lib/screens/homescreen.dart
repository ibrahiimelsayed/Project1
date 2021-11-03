import 'package:flutter/material.dart';
//import 'package:project1/classes/order.dart';
import '../classes/product.dart';
import '../widgets/productbox.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<Products>(context).products;
    //List<Order> orders = Provider.of<Orders>(context).orders;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: products.length,
          itemBuilder: (_, i) => ChangeNotifierProvider.value(
            value: products[i],
            child: const ProductBox(),
          ),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            crossAxisSpacing: 30,
            mainAxisSpacing: 20,
            mainAxisExtent: 200,
          ),
        ),
      ),
    );
  }
}
