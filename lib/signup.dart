import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/global.dart' as glob;
import 'dart:math';
import 'package:app/profile.dart';
import 'package:app/homepage.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
int o = 0;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: LoginPage(),
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: CustomPaint(
        child: Stack(
          children: <Widget>[
            GestureDetector(
            onTap: () {
              runApp(Profile());
            },              
              child: Container(   
                padding: const EdgeInsets.only(left: 25.0, top: 35.0),
                child: Icon(Icons.arrow_back_ios, color: Colors.black,),
              ),
              
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: <Widget>[
                 _getHeader(),
                 _getInputs(),
                 _getSignUp(),
                 _getBottomRow(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_getHeader(){
   return Expanded(
    flex: 3,
    child: Container(
      alignment: Alignment.bottomLeft,
      child: Text(
        'Register',
        style: TextStyle(color: Colors.black, fontSize: 37),
      ),
    ),
  );
}

_getInputs(){
   return Expanded(
    flex: 4,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black)
            ),
          labelText: 'Login',
          labelStyle: TextStyle(color: Colors.black),
        ),
      ),
      SizedBox(height: 15,),
      TextField(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black)
          ),
          labelText: 'Email',
          labelStyle: TextStyle(color: Colors.black),
        ),
      ),
      SizedBox(height: 15,),
      TextField(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black)
          ),
          labelText: 'Password',
          labelStyle: TextStyle(color: Colors.black),
        ),
      ),
      SizedBox(height: 15,),
    ],
  ),
  );
}

_getSignUp(){
  return  Expanded(
    flex: 2,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: <Widget>[
          Text(
            'Register',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.black),
              ),
GestureDetector(
            onTap: () {
              runApp(Profile());
            },
            child: CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            radius: 40,
            child: Icon(Icons.arrow_forward_ios, color: Colors.white,),
          ),
        ),
      ],
    ),
  );
}

_getBottomRow(context){
  return  Expanded(
    flex: 1,
    child: Row(
      children: <Widget>[
        GestureDetector(
            onTap: () {
              runApp(Profile());
            },
            child: Text(
              'Sign In',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline),
              ),
            ),   
      ],
    ),
  );
}