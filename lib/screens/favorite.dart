import 'package:flutter/material.dart';
//import 'package:project1/classes/order.dart';
import '../classes/product.dart';
import '../widgets/productbox.dart';
import 'package:provider/provider.dart';

class Favorite extends StatelessWidget {
  static const routeName = 'favorite_screen';
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //List<Order> orders = Provider.of<Orders>(context).orders;
    List<Product> favorite = Provider.of<Products>(context).fav;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: favorite.length,
          itemBuilder: (_, i) => ChangeNotifierProvider.value(
            value: favorite[i],
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
