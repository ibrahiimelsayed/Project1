import 'package:flutter/material.dart';
import 'package:project1/classes/order.dart';
import 'package:project1/classes/product.dart';
import 'package:project1/screens/editproduct.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final int index;
  const ProductCard(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product product = Provider.of(context);
    return ListTile(
      contentPadding: const EdgeInsets.all(15),
      title: Text(product.title),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(product.imgurl),
      ),
      trailing: Wrap(
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        ChangeNotifierProvider.value(
                      value: product,
                      child: ProductFormEdit(index),
                    ),
                  ));
            },
            icon: const Icon(
              Icons.edit,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              Provider.of<Products>(context, listen: false)
                  .removeproduct(product.id);
              Provider.of<Orders>(context, listen: false)
                  .removeorder(product.id);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
