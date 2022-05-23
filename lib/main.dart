
// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'Screen/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //debug yazisi kaldirma
      title: 'PetFriends',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.brown[600]),
      home: Scaffold(resizeToAvoidBottomInset: false,
          appBar: AppBar(title: const Text("PetFriends",
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold
            ),
          ),
          ),
          body: LoginHome()),
    );
  }
}
