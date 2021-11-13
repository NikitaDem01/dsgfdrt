import 'dart:convert';

import 'package:app/profile.dart';
import 'package:flutter/material.dart';
import 'package:app/tasktime.dart';
import 'package:http/http.dart' as http;
import 'package:app/global.dart' as glob;

class HomePage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: Scaffold(
          body: Container(
            decoration:new BoxDecoration(
                image:  new DecorationImage(
                  image: new AssetImage("assets/start.jpg"),
                  fit: BoxFit.cover,)
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 320)),
                        OutlinedButton(
                          onPressed: () async {

                            print("1");
                            var url = Uri.parse('http://mtucitopteam.xyz/random/test');
                            var response = await http.get(url);
                            print('Response status: ${response.statusCode}');
                            Map<String, dynamic> user = jsonDecode(response.body);
                            int a = user['result'];
                            glob.rand = a;
                            runApp(TaskTime());

                          },
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(200, 40)),
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            shadowColor: MaterialStateProperty.all(Colors.black),
                            side: MaterialStateProperty.all(BorderSide(width: 2.0)),
                          ),
                          child: Text('Play', style: TextStyle(fontSize: 30, color: Colors.red),),
                        ),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        OutlinedButton(
                          onPressed: () async {
                            print('Received click');
                            runApp(Profile());
                          },
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(200, 40)),
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            shadowColor: MaterialStateProperty.all(Colors.black),
                            side: MaterialStateProperty.all(BorderSide(width: 2.0)),
                          ),
                          child: Text('Profile', style: TextStyle(fontSize: 30, color: Colors.red),),
                        ),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        OutlinedButton(
                          onPressed: () {
                            print('Received click');
                          },
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(200, 40)),
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            shadowColor: MaterialStateProperty.all(Colors.black),
                            side: MaterialStateProperty.all(BorderSide(width: 2.0)),
                          ),
                          child: Text('Settings', style: TextStyle(fontSize: 30, color: Colors.red),),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
