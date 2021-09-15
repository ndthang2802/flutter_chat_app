import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chat_app/provider/auth.provider.dart';
import 'package:flutter_chat_app/screens/auth/login.page.dart';
import 'package:provider/provider.dart';

class ProfileSetUp extends StatefulWidget {
  @override
  _ProfileSetUpState createState() => new _ProfileSetUpState();
}

class _ProfileSetUpState extends State<ProfileSetUp> {
  TextEditingController displayname = new TextEditingController();
  TextEditingController date = new TextEditingController();
  TextEditingController month = new TextEditingController();
  TextEditingController year = new TextEditingController();

  navigatorToLogin() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
        appBar: AppBar(title: Text('Set up your profile')),
        body: SingleChildScrollView(
          child: Center(
              child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 10, left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.person,
                        size: 80,
                        color: Colors.blueGrey,
                      ),
                    ))
                  ],
                ),
                Text('Display name: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                TextField(
                  controller: displayname,
                  decoration: InputDecoration(
                      hintText: 'Enter your display name',
                      labelText: 'Display name',
                      border: OutlineInputBorder()),
                ),
                SizedBox(height: 8),
                Text('Date of birth: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 40,
                          child: TextField(
                            controller: date,
                            decoration: InputDecoration(
                                hintText: 'Date', border: OutlineInputBorder()),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Text('/'),
                      ),
                      Expanded(
                          child: Container(
                        height: 40,
                        child: TextField(
                          controller: month,
                          decoration: InputDecoration(
                              hintText: 'Month', border: OutlineInputBorder()),
                        ),
                      )),
                      Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Text('/'),
                      ),
                      Expanded(
                          child: Container(
                        height: 40,
                        child: TextField(
                          controller: year,
                          decoration: InputDecoration(
                              hintText: 'Year', border: OutlineInputBorder()),
                        ),
                      ))
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: SizedBox()),
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      width: 170,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                        onPressed: () {
                          Map<String, String> userInfo = {
                            "displayname": displayname.text,
                            "dob":
                                date.text + '/' + month.text + '/' + year.text
                          };
                          authProvider.updateProfile(userInfo);
                          navigatorToLogin();
                        },
                        child: Text('Done',
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                      ),
                    )),
                    Expanded(child: SizedBox()),
                  ],
                )
              ],
            ),
          )),
        ));
  }
}
