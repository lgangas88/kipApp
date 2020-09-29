import 'package:flutter/material.dart';
import 'package:kip_app/pages/add-kip/add-kip.dart';
import 'package:kip_app/pages/home/components/home.dart';
import 'package:kip_app/pages/login/components/login.dart';
import 'package:kip_app/pages/welcome/components/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KIP',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/welcome': (context) => WelcomePage(),
        '/add-kip': (context) => AddKip(),
      },
      theme: ThemeData(
          fontFamily: 'Montserrat'),
      home: WelcomePage(),
    );
  }
}
