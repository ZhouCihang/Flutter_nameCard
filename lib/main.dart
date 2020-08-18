import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';

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
  Future<List<UserData>> _getUsers() async {
    var data = await http
        .get("http://www.json-generator.com/api/json/get/bVigOGpCUO?indent=2");
    var jsonData = json.decode(data.body);

    List<UserData> user = [];
    for (var u in jsonData) {
      UserData userData =
          UserData(u["index"], u["name"], u["title"], u["address"], u["phone"]);
      user.add(userData);
    }
    //print("ABC");
    print(user.length);

    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Container(
          child: FutureBuilder(
            future: _getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                      return Container(
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
                                      Text(snapshot.data[index].title, style:TextStyle(
                                        fontSize: 12,
                                      ),overflow: TextOverflow.fade)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text(snapshot.data[index].address),
                            SizedBox(height: 12),
                            Text(snapshot.data[index].phone)
                          ],
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

class UserData {
  final int index;
  final String name;
  final String title;
  final String address;
  final String phone;

  UserData(this.index, this.name, this.title, this.address, this.phone);
}
/*Row(
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
              ),*/
/*return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(snapshot.data[index].name),
                        );
                      },
                    );*/
