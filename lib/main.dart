import 'package:flutter/material.dart';
import 'package:project1/classes/order.dart';
import 'package:project1/classes/product.dart';
//import 'package:project1/screens/editproduct.dart';
import 'package:project1/screens/emptyformproduct.dart';
import 'package:project1/screens/yourorders.dart';
import 'package:project1/screens/yourproducts.dart';
import '../screens/tabscreen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Products()),
        ChangeNotifierProvider(create: (_) => Orders())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          //canvasColor: Colors.pink,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const TabScreen(),
          Yourproducts.routeNamed: (context) => const Yourproducts(),
          ProductForm.routeNamed: (context) => const ProductForm(),
          YourOrders.routeNamed: (context) => const YourOrders(),
          //ProductFormEdit.routeNamed: (context) =>  ProductFormEdit(Product product)
          //Profile.routeNamed: (context) => const Profile(),
        },
        //home: const TabScreen(),
      ),
    );
  }
}
