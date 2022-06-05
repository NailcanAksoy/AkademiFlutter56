// ignore_for_file: prefer_const_constructors, avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:untitled/Auth/Auth.dart';
import 'package:untitled/Screen/login_screen.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phonenumberController =
  TextEditingController();

  AuthService _authService = AuthService();

  late String email;
  late String username;
  late String password;
  late String phone;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child:SingleChildScrollView(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0), child:
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                onChanged: (value){
                  setState(() {
                    email=value;
                  }
                  );
                },
              ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0), child:
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.verified_user),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                onChanged: (value){
                  setState(() {
                    username=value;
                  }
                  );
                },
              ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0), child:
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.password_rounded),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                onChanged: (value){
                  setState(() {
                    password=value;
                  }
                  );
                },
              ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
                child: MaterialButton(
                  child: Text('Register', textAlign: TextAlign.center,style: TextStyle(
                    color: Colors.white,
                  ),),
                  color: Colors.blue,
                  onPressed: () {
                    _authService.createPerson(_nameController.text,
                        _emailController.text,
                        _phonenumberController.text,
                        _passwordController.text).then((value) {return Navigator.push(context, MaterialPageRoute(builder: (context) => LoginHome()));
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
