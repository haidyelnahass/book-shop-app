import 'package:flutter/material.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('Books'),
          onTap: () {
            Navigator.pushNamed(context, '/books');
          },
        ),
        ListTile(
          title: Text('Cart'),
          onTap: () {},
        ),
        ListTile(
          title: Text('Orders'),
          onTap: () {},
        ),
        ListTile(
          title: Text('Add Book'),
          onTap: () {},
        ),
      ],
    );
  }
}
