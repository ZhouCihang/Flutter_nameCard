import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'UserDetail.dart';
import 'main.dart';

class DetailPage extends StatelessWidget {

  //final UserDetail user;
  //DetailPage(this.user, {nameCardId});

  final String nameCardId;
  DetailPage({Key key, this.nameCardId}) : super(key: key);

  Future<UserDetail> _getUsers() async {
    var data = await http.get("http://10.0.2.2:8000/"+this.nameCardId+".json");
    var jsonData = json.decode(data.body);

    
    
    //UserDetail userDetail = UserDetail(jsonData["index"],jsonData["name"], jsonData["title"], jsonData["address"], jsonData["phone"]);
    return UserDetail.fromJson(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Container(
          width: 370,
          height: 250,
          color: Colors.amberAccent,
          child: FutureBuilder(
            future: _getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if (snapshot.hasError) {
                return Text("${snapshot.error.toString()}");
              }


              if (snapshot.data == null) {
                return Container(child: Center(child: Text("Loading...")));
              } else{
                print("ABC"+ snapshot.data);
                return Container(
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
                                snapshot.data.name,
                                style:TextStyle(
                                  fontSize: 18,
                                ),),
                              Text(snapshot.data.title, style:TextStyle(
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
                            child: Text(snapshot.data.address,
                                style: TextStyle(
                                  fontSize: 12,
                                ),overflow: TextOverflow.fade),
                          ),
                          Text(snapshot.data.phone,
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
                );
              }
            }
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Name Card Details"),
      ),
    );
  }
}
