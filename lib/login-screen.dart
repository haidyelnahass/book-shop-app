import 'package:booklibraryapp/services/authenticate.dart';
import 'package:booklibraryapp/signup-screen.dart';
import 'package:flutter/material.dart';

import 'app-bar.dart';
import 'classes/login.dart';
import 'drawer-menu.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loggedIn = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool signedUp = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(loggedIn),
      appBar: MyAppBar(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            signedUp
                ? Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Succesfully signed up! You can log in now.',
                      style: TextStyle(fontSize: 20),
                    ))
                : Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    )),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'E-mail',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                //forgot password screen
              },
              textColor: Colors.purple,
              child: Text('Forgot Password'),
            ),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.purple,
                  child: Text('Login'),
                  onPressed: () {
                    print(emailController.text);
                    print(passwordController.text);
                    // if (emailController.text == 'test@test.com' &&
                    //     passwordController.text == 'example') {
                    //   setState(() {
                    //     loggedIn = true;
                    //   });
                    //   print('You are now logged in!');
                    //   Navigator.pop(context, true);
                    // }
                    Future<Login> _loginResponse =
                        login(emailController.text, passwordController.text);
                    Navigator.pop(context, true);

                    print(_loginResponse);
                  },
                )),
            Container(
                child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Text('Do not have an account yet?'),
                FlatButton(
                  textColor: Colors.purple,
                  child: Text(
                    'Signup',
                  ),
                  onPressed: () async {
                    //signup screen
                    bool result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ));
                    //if signed-up, display success message for user.
                    setState(() {
                      signedUp = result;
                    });
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ))
          ],
        ),
      ),
    );
  }
}
