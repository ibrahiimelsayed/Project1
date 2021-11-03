import 'package:flutter/material.dart';

class Drawerwidget extends StatelessWidget {
  const Drawerwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const DrawerHeader(
                child: Text('MENU',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))),
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('SHOP'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          const Divider(
            thickness: 1.5,
          ),
          ListTile(
            leading: const Icon(Icons.credit_card),
            title: const Text('ORDERS'),
            onTap: () {
              Navigator.pushNamed(context, 'your_orders');
            },
          ),
          const Divider(
            thickness: 1.5,
          ),
          ListTile(
            leading: const Icon(Icons.credit_card),
            title: const Text('MANAGE PRODUCTS'),
            onTap: () {
              Navigator.pushNamed(context, 'your_product');
            },
          ),
          const Divider(
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
