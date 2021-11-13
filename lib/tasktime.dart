import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/global.dart' as glob;
import 'dart:math';


class TaskTime extends StatefulWidget {
  const TaskTime({Key? key}) : super(key: key);

  @override
  _TaskTimeState createState() => _TaskTimeState();
}

class _TaskTimeState extends State<TaskTime> {
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
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: Scaffold(
          body: RandomTask()
        )
    );
  }
  Container RandomTask(){
    var rng = new Random();
    int m = 0;//rng.nextInt(2);
    switch(m) {
      case 0:
        return Container(
            padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TasksvsImage(glob.rand),//34589
                new TextField(
                  onTap: (){

                  },
                  controller: _controller,
                  decoration: new InputDecoration(labelText: "Enter your number"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r"[0-9.,\-]"))],
                  onSubmitted: (String value) {
                    if(o.toString()==value){
                      print("dsfgsdf");
                    }
                    print(o.toString());
                  },
                ),
              ],
            )
        );
      case 1:
        return Container(
            padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TasksnoImage(),
                new TextField(
                  controller: _controller,
                  decoration: new InputDecoration(labelText: "Enter your number"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                  onSubmitted: (String value) {
                  },
                ),
              ],
            )
        );
    }
    return Container(

    );
  }
  Container TasksvsImage(int k){
    int a, b,c,d, m;
    String s = "";
    m = k%10;
    k=(k/10).round();
    m=(m%5);
    d = k%10;
    k=(k/10).round();
    d=(d%4);
    c = k%10;
    k=(k/10).round();
    b = k%10;
    k=(k/10).round();
    a = k%10;
    k=(k/10).round();
    switch(d){
      case 0:       // 0 - *, 1 - -, 2 - +, 3 - *
        if(m==0){ // a*b*c
          s = "$a * $b * $c = ";
          o = a*b*c;
        }
        if(m==1){ // a*b-c
          s = "$a * $b - $c = ";
          o = a*b-c;
        }
        if(m==2){ // a*b+c
          s = "$a * $b + $c = ";
          o = a*b+c;
        }
        if(m==3){ // a*b/c
          if(c==0){
            c = ((a+b+d+m)/5).round()+1;
          }
          s = "$a * $b / $c = ";
          o =  (a*b/c).round();
        }
        break;
      case 1:
        if(m==0){ // a-b*c
          s = "$a - $b * $c = ";
          o = a-b*c;
        }
        if(m==1){ // a-b-c
          s = "$a - $b - $c = ";
          o = a-b-c;
        }
        if(m==2){ // a-b+c
          s = "$a - $b + $c = ";
          o = a-b+c;
        }
        if(m==3){ // a-b/c
          if(c==0){
            c = ((a+b+d+m)/5).round()+1;
          }
          s = "$a - $b / $c = ";
          o = (a-b/c).round();
        }
        break;
      case 2:
        if(m==0){ // a+b*c
          s = "$a + $b * $c = ";
          o = a+b*c;
        }
        if(m==1){ // a+b-c
          s = "$a + $b - $c = ";
          o = a+b-c;
        }
        if(m==2){ // a+b+c
          s = "$a + $b + $c = ";
          o = a+b+c;
        }
        if(m==3){ // a+b/c
          if(c==0){
            c = ((a+b+d+m)/5).round()+1;
          }
          s = "$a + $b / $c = ";
          o = (a+b/c).round();
        }
        break;
    }
    return Container(
      child: Text(s, style: TextStyle(fontSize: 30, color: Colors.red)),
    );
  }
  Container TasksnoImage(){
    return Container(

    );
  }
}
