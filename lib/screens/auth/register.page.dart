import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chat_app/provider/auth.provider.dart';
import 'package:flutter_chat_app/screens/auth/profile.setup.page.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  bool hidePassword = true;

  navigatorToLogin() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ProfileSetUp()));
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Register Page'),
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
                  controller: email,
                  decoration: InputDecoration(
                      hintText: 'email',
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
                      await authProvider.signUp(email.text, password.text);
                      if (authProvider.registerState == RegisterState.success) {
                        navigatorToLogin();
                      }
                    },
                    child: Text('Register',
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                ),
                SizedBox(height: 15),
                authProvider.registerState == RegisterState.loading
                    ? CircularProgressIndicator()
                    : authProvider.registerState == RegisterState.success
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
                                Text('Register successfuly',
                                    style: TextStyle(
                                        color: Colors.green[200], fontSize: 18))
                              ],
                            ),
                          )
                        : authProvider.registerState == RegisterState.fail
                            ? Text('register fail')
                            : SizedBox(height: 10)
              ],
            )),
          ),
        ));
  }
}
