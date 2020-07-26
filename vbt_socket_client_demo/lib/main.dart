import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vbt_socket_client_demo/SocketIO.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SocketIO socketIO;
  static String uri = 'http://192.168.1.7:3000';

  List<String> urls = ['http://192.168.1.7:3000', 'http://192.168.1.7:3000/a1'];

  @override
  void initState() {
    super.initState();
    socketIO = SocketIO();
  }

  String roomID = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Socket Game',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Socket Game '),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  onPressed: () => socketIO.connect(urls[0]),
                  child: Text("Connect Default")),
              FlatButton(
                  onPressed: () => socketIO.connect(urls[1]),
                  child: Text("Connect A1")),
              FlatButton(
                  onPressed: () => socketIO.addListener("setRoomInfo", (data) {
                        roomID = json.decode(data)["roomID"].toString();
                        print(roomID + " Oluşturuldu");
                      }),
                  child: Text("AddListener For room info")),
              FlatButton(
                  onPressed: () => socketIO.addListener("setWords", (data) {
                        print("set Words working");
                        print(data as List<dynamic>);
                      }),
                  child: Text("AddListener For get words")),
              FlatButton(
                  onPressed: () => socketIO.sendMsg("sendWords", {
                        "roomID": roomID,
                        "words": [
                          {"def": socketIO.uuid}
                        ]
                      }),
                  child: Text("SendWords Room")),
              FlatButton(
                  onPressed: () =>
                      socketIO.sendMsg("SearchRoom", {"id": socketIO.uuid}),
                  child: Text("StartSearch Room")),
            ],
          ),
        ),
      ),
    );
  }
}
