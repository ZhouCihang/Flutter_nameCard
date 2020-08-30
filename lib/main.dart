import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:name_card/UserList.dart';
import 'dart:convert';
import 'dart:core';
import 'package:path/path.dart';
import 'DetailPage.dart';
import 'UserList.dart';
import 'UserDetail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NameCard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NameCardBasic1(),
    );
  }
}

class NameCardBasic1 extends StatelessWidget {

  Future<List<UserList>> _getUsers() async {
 /*   var data = await http
        .get("http://www.json-generator.com/api/json/get/bVigOGpCUO?indent=2");*/
    //var data = await http.get("http://10.0.2.2:8000/full.json");
    var data = await http.get("http://10.0.2.2:8000/list.json");
    var jsonData = json.decode(data.body);

/*    List<UserData> user = [];
    for (var u in jsonData) {
      UserData userData =
          UserData(u["index"], u["name"], u["title"], u["address"], u["phone"]);
      user.add(userData);
    }*/

    List<UserList> user = [];
    for (var u in jsonData) {
      UserList userList = UserList(u["index"], u["name"]);
      user.add(userList);
    }
    print(user.length);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name Card Content"),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          child: FutureBuilder(
            future: _getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error.toString()}");
              }

              if (snapshot.data == null) {
                return Container(child: Center(child: Text("Loading...")));
              } else {
                return Container(
                  height: 300.0,
                  color: Colors.lightBlue,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                            new MaterialPageRoute(builder: (context) => DetailPage(nameCardId: snapshot.data[index].index.toString()))
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.all(10.0),
                          width: 200.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Icon(Icons.account_circle, size: 50)
                                  ),
                                  Flexible(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data[index].name,
                                          style:TextStyle(
                                          fontSize: 18,
                                        ),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                      //return Text(snapshot.data[index].name);
                      },
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

/*class UserData {
  final int index;
  final String name;
  final String title;
  final String address;
  final String phone;

  UserData(this.index, this.name, this.title, this.address, this.phone);
}*/
