import 'dart:ui';

import 'package:app/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/global.dart' as glob;
import 'dart:math';
import 'package:app/forgotpass.dart';
import 'homepage.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
      home: LoginPage(),
      //home: SignUpPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: CustomPaint(
        child: Stack(
          children: <Widget>[
            GestureDetector(
            onTap: () {
              runApp(HomePage());
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
                  _getSingIn(),
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

_getHeader() {
  return Expanded(
    flex: 3,
    child: Container(
      alignment: Alignment.bottomLeft,
      child: Text(
        'Welcome Back',
        style: TextStyle(color: Colors.black, fontSize: 37),
      ),
    ),
  );
}

_getInputs() {
  return Expanded(
    flex: 4,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
          SizedBox(
          height: 15,
            ),
           TextField(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black)
            ),
          labelText: 'Password',
          labelStyle: TextStyle(color: Colors.black),
        ),
      ),
          SizedBox(
          height: 15,
        ),
      ],
    ),
  );
}

_getSingIn() {
   return Expanded(
    flex: 2,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Sign In', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            radius: 40,
            child: Icon(Icons.arrow_forward_ios, color: Colors.white,),
          )
        ],
      ),
   );
}

_getBottomRow(context) {
  return Expanded(
    flex: 1,
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              runApp(SignUp());
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline),
              ),
            ),
          GestureDetector(
            onTap: () {
              runApp(ForgotPass());
            },
            child: Text(
              'Forgot Password',
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