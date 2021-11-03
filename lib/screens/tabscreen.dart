import 'package:flutter/material.dart';
import 'package:project1/classes/order.dart';
import 'package:project1/screens/yourcart.dart';
import 'package:project1/widgets/drawerwidget.dart';
import 'package:provider/provider.dart';
import '../screens/favorite.dart';
import '../screens/homescreen.dart';
//import 'package:project1/classes/order.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;
  late List<Map<String, dynamic>> _pages;
  int notification = 0;
  @override
  void initState() {
    _pages = [
      {
        'title': 'MyShop',
        'page': const HomeScreen(),
      },
      {
        'title': 'Favorite ',
        'page': const Favorite(),
      }
    ];
    super.initState();
  }

  void _changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Order> orders = Provider.of<Orders>(context).orders;
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_currentIndex]['title']),
        actions: [
          Center(
            child: Stack(children: <Widget>[
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const Orderscart(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart),
                  iconSize: 30),
              Positioned(
                  top: 0.0,
                  right: 1.5,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                        '${Provider.of<Orders>(context, listen: false).ordernumbers(orders)}'),
                  ))
            ]),
          ),
        ],
      ),
      drawer: const Drawerwidget(),
      body: _pages[_currentIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _changeIndex,
        selectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: const Color.fromRGBO(255, 255, 255, 0.5),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
              size: 30,
            ),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 30,
            ),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
