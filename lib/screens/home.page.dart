import 'package:flutter/material.dart';
import 'chatPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Home Page'), //ChatPage(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.group_work), label: 'Channels'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Profile')
        ],
      ),
    );
  }
}
