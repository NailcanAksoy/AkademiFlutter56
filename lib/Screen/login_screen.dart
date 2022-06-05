// ignore_for_file: deprecated_member_use, unused_local_variable, use_key_in_widget_constructors, must_be_immutable, non_constant_identifier_names, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:untitled/Auth/Auth.dart';
import 'package:untitled/Screen/Register.dart';

import 'screen _select_to_adopt_or_advertise.dart';

class LoginHome extends StatefulWidget {
  @override
  State<LoginHome> createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return _LoginHome(context);
  }

  Widget _LoginHome (BuildContext context)
  {
    final emailField = TextFormField(
      controller: _emailController,
      obscureText: false,//yazilani gosterir
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "User Email",
          prefixIcon: Icon(Icons.mail, color: Colors.blue),
          labelStyle: TextStyle(color: Colors.blue.shade200),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
      ),
      validator:(value){ //kullanici adi girilmeme hatasi
        if(value!.isEmpty){
          return "Please enter username";
        }
        else{
          return null;
        }
      },
      onSaved: (value){
        var username=value;},
    );
    SizedBox(height: 4.0);
    final passwordField = TextFormField(
      controller: _passwordController,
      obscureText: true, // yazilani gostermez
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "Password",
          prefixIcon: Icon(Icons.security, color: Colors.blue),
          labelStyle: TextStyle(color: Colors.blue.shade200),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
      ), validator:(value){ //kullanici adi girilmeme hatasi
      if(value!.isEmpty){
        return "Please enter password";
      }
      else{
        return null;
      }
    },
    );
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(21),
      color: Colors.blue[300],
      child: MaterialButton(
        minWidth: MediaQuery //kendi ayarliyor boyutunu
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 15.0),
        onPressed: () {
          _authService.sigin(_nameController.text, _emailController.text, _passwordController.text).then((value){
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) =>SelectionScreen()));
          });
        },
        child: Text("Login",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.normal),),
      ),
    );
    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blue[300],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => RegisterPage(title: '',
                  )
              )
          );
        },
        child: Text("Register",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.normal
          ),
        ),
      ),
    );
    return Center(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/pati.png" ),
              SizedBox(height: 10.0,),
              SizedBox(height: 30.0),
              emailField,
              SizedBox(height: 10.0),
              passwordField,
              SizedBox(height: 5.0,),
              SizedBox(height: 15.0),
              loginButton,
              SizedBox(height: 10.0),
              registerButton
            ],
          ),
        ),
      ),
    );
  }
}