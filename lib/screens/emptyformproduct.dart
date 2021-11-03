import 'package:flutter/material.dart';
import 'package:project1/classes/product.dart';
import 'package:project1/widgets/textfldwidget.dart';
import 'package:provider/provider.dart';

class ProductForm extends StatefulWidget {
  static const routeNamed = 'empty_product_form';
  //final int id;

  const ProductForm({Key? key}) : super(key: key);

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  var titleCont = TextEditingController();
  var descriptionCont = TextEditingController();
  var priceCont = TextEditingController();
  var imgurlCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<Products>(context).products;

    return Scaffold(
        appBar: AppBar(
          title: const Text('ADD PRODUCT'),
          actions: [
            IconButton(
                onPressed: () {
                  Provider.of<Products>(context, listen: false).addproduct(
                    products.length + 1,
                    titleCont.text,
                    double.parse(priceCont.text),
                    descriptionCont.text,
                    imgurlCont.text,
                  );
                  Navigator.pushNamed(context, 'your_product');
                },
                icon: const Icon(Icons.save))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Txtfield(titleCont, 'Title', 'Enter Product title'),
              Txtfield(priceCont, 'Price', 'Enter Product price'),
              Txtfield(imgurlCont, 'Image', 'Enter Product imgurl'),
              Txtfield(
                  descriptionCont, 'Description', 'Enter Product Description'),
            ],
          ),
        ));
  }
}
