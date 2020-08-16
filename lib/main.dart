import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NameCard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NameCardBasic1(),
    );
  }
}

class NameCardBasic1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: 370,
          height: 250,
          color: Colors.lightBlue,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(Icons.child_friendly, size: 65)
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Flutter McFlutter',
                        style: TextStyle(
                            fontSize: 30,
                        ),),
                      //Text('Flutter McFlutter', style: Theme.of(context).textTheme.headline,),
                      //Text('Experienced App Developer'),
                      Text('Experienced App Developer',
                        style: TextStyle(
                          fontSize: 20,
                        ),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('123 Main Street',
                    style: TextStyle(
                      fontSize: 20,
                    ),),
                  Text('(415) 555-0198',
                    style: TextStyle(
                      fontSize: 20,
                    ),),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.accessibility, size: 40,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.timer, size: 40,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.phone_android, size: 40,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.phone_iphone, size: 40,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
