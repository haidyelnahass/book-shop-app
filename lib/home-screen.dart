import 'package:flutter/material.dart';

import 'app-bar.dart';
import 'drawer-menu.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(false),
      appBar: MyAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              "Popular Books",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            // width: MediaQuery.of(context).size.width,
            height: 180,
            child: PageView.builder(
                controller: PageController(viewportFraction: 0.5),
                itemCount: 5,
                itemBuilder: (_, i) {
                  return Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/bookcover2.jpg'),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
