import 'package:flutter/material.dart';
import 'package:project1/classes/product.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  static const routeNamed = '/product_profile';
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(product.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Expanded(child:
                  Image(image: NetworkImage(product.imgurl)),
                  //),
                  Text('\$${product.price}',
                      style: const TextStyle(fontSize: 40)),

                  Text(product.description,
                      style: const TextStyle(fontSize: 40))
                ]),
          ),
        ));
  }
}
