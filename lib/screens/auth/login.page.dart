import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chat_app/provider/auth.provider.dart';
import 'package:flutter_chat_app/screens/home.page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  bool hidePassword = true;

  navigatorToHomePage() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(40),
            child: Center(
                child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.blueGrey,
                  ),
                ),
                TextField(
                  controller: username,
                  decoration: InputDecoration(
                      hintText: 'username',
                      border: OutlineInputBorder(),
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(top: 6, bottom: 6, right: 16),
                        child: Icon(Icons.person),
                      )),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: password,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    hintText: 'password',
                    border: OutlineInputBorder(),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(top: 6, bottom: 6),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          child: hidePassword
                              ? Icon(Icons.lock)
                              : Icon(
                                  Icons.lock_open,
                                  color: Colors.redAccent,
                                )),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () async {
                      await authProvider.signIn(username.text, password.text);
                      if (authProvider.loginState == LoginState.success) {
                        navigatorToHomePage();
                      }
                    },
                    child: Text('Login',
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                ),
                SizedBox(height: 15),
                authProvider.loginState == LoginState.loading
                    ? CircularProgressIndicator()
                    : authProvider.loginState == LoginState.success
                        ? Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.check_circle_outline_outlined,
                                  size: 50,
                                  color: Colors.green,
                                ),
                                SizedBox(height: 15),
                                Text('Login successfuly',
                                    style: TextStyle(
                                        color: Colors.green[200], fontSize: 18))
                              ],
                            ),
                          )
                        : authProvider.loginState == LoginState.fail
                            ? Text('Login fail')
                            : SizedBox(height: 10)
              ],
            )),
          ),
        ));
  }
}
