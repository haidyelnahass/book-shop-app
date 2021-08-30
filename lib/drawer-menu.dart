import 'package:booklibraryapp/login-screen.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  bool isLoggedIn;
  MyDrawer(this.isLoggedIn);
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool loggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            !widget.isLoggedIn
                ? DrawerHeader(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            // fit: BoxFit.fill,
                            image: AssetImage('images/ppblank.png'),
                          ),

                          // borderRadius: BorderRadius.circular(60),
                        ),
                      ),

                      // Text('Login'),
                      // OutlinedButton(
                      //   style: ButtonStyle(
                      //     foregroundColor:
                      //         MaterialStateProperty.all(Colors.black),
                      //   ),
                      //   onPressed: () {
                      //     print('I was clicked!');
                      //   },
                      //   child: Text("Login"),
                      // )
                      FlatButton(
                        onPressed: () async {
                          // setState(() {
                          //   isLoggedIn = true;
                          // });
                          loggedIn = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                          setState(() {
                            widget.isLoggedIn = loggedIn;
                          });
                        },
                        child: Text("Login"),
                      )
                    ],
                  ))
                : UserAccountsDrawerHeader(
                    accountEmail: Text('test@test.com'),
                    accountName: Text('Logged in user'),
                    currentAccountPicture: Image.asset('images/Minho.jpg'),
                  ),
            // SizedBox(
            //   height: 5,
            // ),
            // Divider(
            //   color: Colors.black,
            // ),
            // MyMenuItems(),
          ],
        ),
      ),
    );
  }
}
