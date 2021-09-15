import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/provider/auth.provider.dart';
import 'package:flutter_chat_app/screens/auth/login.page.dart';
import 'package:flutter_chat_app/screens/auth/profile.setup.page.dart';
//import 'package:flutter_chat_app/screens/auth/register.page.dart';
import 'package:provider/provider.dart';
//import 'screens/home.page.dart';
import 'provider.dart';
//import 'screens/auth/login.page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider())
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: LoginPage()
          // chatProvider.loginStatus == LoginStatus.success
          //     ? new HomePage()
          //     : new LoginPage(),
          ),
    );
  }
}
