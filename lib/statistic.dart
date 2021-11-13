import 'dart:ui';

import 'package:app/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/global.dart' as glob;
import 'dart:math';
import 'package:app/profile.dart';
import 'package:app/signup.dart';

class Statistic extends StatefulWidget {
  const Statistic({Key? key}) : super(key: key);

  @override
  _StatisticState createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
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
      home: StatisticPage(),
    );
  }
}

class StatisticPage extends StatefulWidget {
  @override
  _StatisticPageState createState() => _StatisticPageState();
}

class _StatisticPageState extends State {
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
                  _getStatistic(),
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
    flex: 1,
    child: Container(
      alignment: Alignment.bottomLeft,
      child: Text(
        'Welcome Back, ProfileName!',
        style: TextStyle(color: Colors.black, fontSize: 37),
      ),
    ),
  );
}

_getStatistic() {
  return Expanded(
    flex: 2,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
          Text(
            'Games count: GamesCount',
            textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.black),
              ),
          Text(
            'Wins count: WinsCount',
            textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.black),
              ),
          Text(
            'Loses count: LosesLoses',
            textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.black),
              ),
          Text(
            'W/L %: WinLoses%',
            textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.black),
              ),              
      ],
    ),
  );
}