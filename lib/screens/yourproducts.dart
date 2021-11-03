import 'package:flutter/material.dart';
import 'package:project1/classes/product.dart';
//import 'package:project1/screens/emptyformproduct.dart';
import 'package:project1/widgets/drawerwidget.dart';
import 'package:project1/widgets/productcard.dart';
import 'package:provider/provider.dart';

class Yourproducts extends StatelessWidget {
  static const routeNamed = 'your_product';
  const Yourproducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<Products>(context).products;
    return Scaffold(
      appBar: AppBar(
        title: const Text('YOUR PRODUCTS'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'empty_product_form');
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: const Drawerwidget(),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 1,
          thickness: 2,
        ),
        itemCount: products.length,
        itemBuilder: (_, i) => ChangeNotifierProvider.value(
          value: products[i],
          child: ProductCard(i),
        ),
      ),
    );
  }
}
