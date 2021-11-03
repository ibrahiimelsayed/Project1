import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String title, description, imgurl;
  final String id;
  final double price;
  bool isfav;
  bool isordered;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.imgurl,
      this.isfav = false,
      this.isordered = false});
}

class Products with ChangeNotifier {
  List<Product> products = [
    Product(
      id: '1',
      title: 'title1',
      price: 120,
      description: 'description',
      imgurl:
          'https://img.joomcdn.net/a24f70d27ca2552e92aa45c9005827c82b915156_original.jpeg',
    ),
    Product(
      id: '2',
      title: 'title2',
      price: 120,
      description: 'description',
      imgurl:
          'https://img.joomcdn.net/a24f70d27ca2552e92aa45c9005827c82b915156_original.jpeg',
    )
  ];
  List<Product> fav = [];
  //Map<Product, int> orders = {};
  void addproduct(
      int id, String title, double price, String description, String imgurl) {
    products.add(Product(
        id: id.toString(),
        title: title,
        price: price,
        description: description,
        imgurl: imgurl));
    notifyListeners();
  }

  void editproduct(int index, String id, String title, double price,
      String description, String imgurl) {
    if (products[index].isfav) {
      removeproduct(id.toString());
      products.insert(
          index,
          Product(
              id: id,
              title: title,
              price: price,
              description: description,
              imgurl: imgurl));
      products[index].isfav = true;
      addtofav(products[index].id);
    } else {
      removeproduct(id.toString());
      products.insert(
          index,
          Product(
              id: id,
              title: title,
              price: price,
              description: description,
              imgurl: imgurl));
    }

    notifyListeners();
  }

  void removeproduct(String id) {
    products.remove(products.firstWhere((element) => element.id == id));
    removefromfav(id);
    notifyListeners();
  }

  void addtofav(String id) {
    fav.add(products.firstWhere((element) => element.id == id));
    notifyListeners();
  }

  void removefromfav(String id) {
    fav.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  // void addorder(String id, int num) {
  //   if (orders
  //       .containsKey(products.firstWhere((element) => element.id == id))) {
  //     orders.update(
  //         products.firstWhere((element) => element.id == id), (value) => num);
  //   } else {
  //      orders[products.firstWhere((element) => element.id == id)] = num;
  //   }
  //   notifyListeners();
  // }

  // bool checkdoubles(String id) {
  //   if (orders.contains(products.firstWhere((element) => element.id == id))) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
