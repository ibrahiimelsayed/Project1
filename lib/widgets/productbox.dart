import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/classes/order.dart';
import 'package:project1/screens/productprofile.dart';
import '../classes/product.dart';
import 'package:provider/provider.dart';
//import 'package:intl/intl.dart';

class ProductBox extends StatefulWidget {
  const ProductBox({Key? key}) : super(key: key);

  @override
  State<ProductBox> createState() => _ProductBoxState();
}

class _ProductBoxState extends State<ProductBox> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => ChangeNotifierProvider.value(
              value: product,
              child: const Profile(),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(product.imgurl), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 35,
              color: const Color.fromRGBO(0, 0, 0, 0.7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        if (product.isfav) {
                          Provider.of<Products>(context, listen: false)
                              .removefromfav(product.id);
                        } else {
                          Provider.of<Products>(context, listen: false)
                              .addtofav(product.id);
                        }
                        setState(() {
                          product.isfav = !product.isfav;
                        });
                      },
                      icon: Icon(
                        product.isfav ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      )),
                  Text(
                    product.title,
                    style: const TextStyle(
                        fontSize: 25,
                        //fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (!product.isordered) {
                            Provider.of<Orders>(context, listen: false)
                                .addorder(
                              product,
                            );
                            product.isordered = true;
                          } else {
                            Provider.of<Orders>(context, listen: false)
                                .modifyorder(
                              product.id,
                            );
                          }
                        });
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.red,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
