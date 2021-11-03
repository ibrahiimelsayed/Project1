import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:project1/classes/product.dart';
//import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';

class Order with ChangeNotifier {
  late final Product product;
  int num;
  final String id;
  String date;

  Order(
      {required this.id,
      required this.product,
      this.num = 1,
      this.date = 'now'});
}

class Orders with ChangeNotifier {
  List<Order> orders = [
    // Order(
    //   id: '1',
    //   product: Product(
    //     id: '1',
    //     title: 'title1',
    //     price: 120,
    //     description: 'description',
    //     imgurl:
    //         'https://img.joomcdn.net/a24f70d27ca2552e92aa45c9005827c82b915156_original.jpeg',
    //   ),
    // )
  ];

  void addorder(Product product) {
    orders.add(Order(
        id: orders.length.toString(),
        product: product,
        date: DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now())));

    notifyListeners();
  }

  void modifyorder(String id) {
    if (orders
        .contains(orders.firstWhere((element) => element.product.id == id))) {
      orders.firstWhere((element) => element.product.id == id).num++;
      orders.firstWhere((element) => element.product.id == id).date ==
          DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
    } else {
      return;
    }

    notifyListeners();
  }

  int ordernumbers(List<Order> orders) {
    int total = 0;
    if (orders.isEmpty) {
      return 0;
    } else {
      for (var item in orders) {
        total += item.num;
      }
      return total;
    }
  }

  double orderprices(List<Order> orders) {
    double total = 0;
    if (orders.isEmpty) {
      return 0;
    } else {
      for (var item in orders) {
        total += item.num * item.product.price;
      }
      return total;
    }
  }

  void removeorder(String id) {
    if (orders.firstWhere((element) => element.product.id == id).num == 0) {
      orders.removeWhere((element) => element.product.id == id);
    }
    notifyListeners();
  }

  void decreasetotal(String id) {
    // if (orders.firstWhere((element) => element.product.id == id).num == 0) {
    //   removeorder(id);
    // } else {
    orders.firstWhere((element) => element.product.id == id).num--;
    //}
    notifyListeners();
  }
}
