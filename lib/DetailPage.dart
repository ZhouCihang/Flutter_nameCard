import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class DetailPage extends StatelessWidget {

  final UserData user;
  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Container(
          width: 370,
          height: 250,
          color: Colors.amberAccent,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(Icons.account_circle, size: 65),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style:TextStyle(
                          fontSize: 18,
                        ),),
                      Text(user.title, style:TextStyle(
                        fontSize: 16,
                      ),overflow: TextOverflow.fade)
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: Text(user.address,
                      style: TextStyle(
                        fontSize: 12,
                      ),overflow: TextOverflow.fade),
                  ),
                  Text(user.phone,
                    style: TextStyle(
                      fontSize: 12,
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
      appBar: AppBar(
        title: Text("Name Card Details"),
      ),
    );
  }
}
