import 'package:booklibraryapp/widgets/app-bar.dart';
import 'package:booklibraryapp/widgets/drawer-menu.dart';
import 'package:flutter/material.dart';

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
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (_, i) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.3,
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
