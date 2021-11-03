import 'package:flutter/material.dart';
import 'package:project1/classes/product.dart';
import 'package:project1/widgets/editproductwidget.dart';
import 'package:provider/provider.dart';

class ProductFormEdit extends StatefulWidget {
  static const routeNamed = 'edit_product';
  final int index;

  const ProductFormEdit(this.index, {Key? key}) : super(key: key);

  @override
  State<ProductFormEdit> createState() => _ProductFormEditState();
}

class _ProductFormEditState extends State<ProductFormEdit> {
  var titleCont = TextEditingController();
  var descriptionCont = TextEditingController();
  var priceCont = TextEditingController();
  var imgurlCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Product product = Provider.of<Product>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('EDIT PRODUCT'),
          actions: [
            IconButton(
                onPressed: () {
                  Provider.of<Products>(context, listen: false).editproduct(
                      widget.index,
                      product.id,
                      titleCont.text,
                      double.parse(priceCont.text),
                      descriptionCont.text,
                      imgurlCont.text);
                  Navigator.pushNamed(context, 'your_product');
                },
                icon: const Icon(Icons.save))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ChangeNotifierProvider.value(
            value: product,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TxtfieldEdit(titleCont, 'Title', product.title),
                TxtfieldEdit(priceCont, 'Price', '${product.price}'),
                TxtfieldEdit(imgurlCont, 'Image', product.imgurl),
                TxtfieldEdit(
                    descriptionCont, 'Description', product.description),
              ],
            ),
          ),
        ));
  }
}
