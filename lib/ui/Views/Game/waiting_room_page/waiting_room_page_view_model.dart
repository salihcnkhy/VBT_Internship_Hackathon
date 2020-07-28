import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vbt_hackathon/Core/EnvironmentObjects/EnvironmentObj.dart';
import 'package:vbt_hackathon/Core/Socket.IO/SocketIO.dart';
import 'package:vbt_hackathon/Helper/Class/uuid_generator.dart';
import 'package:vbt_hackathon/Models/GameRoom.dart';
import 'package:vbt_hackathon/Models/Word.dart';
import './waiting_room_page.dart';

abstract class WaitingRoomPageViewModel extends State<WaitingRoomPage> {
  SocketIO socket = SocketIO();
  String infoText;
  var env = EnvironmentObjects();
  GameRoom room;
  @override
  void initState() {
    print("init");
    super.initState();
    infoText = "Connecting to " + widget.category.id + "...";
    socket.connect(widget.category.id, _connectionCallBack);
  }

  void _connectionCallBack() {
    socket.addListener("setRoomInfo", _setRoomInfoCallBack);
    print(env.user.uuid);
    socket.sendMsg("SearchRoom", {"id": env.user.uuid});

    setState(() {
      infoText =
          "Connected to " + widget.category.id + ".\n" + "Searcing for player";
    });
  }

  void _setRoomInfoCallBack(data) {
    print(data);
    Map<String, dynamic> map = jsonDecode(data);

    room = GameRoom(id: map["roomID"]);
    room.words = _createDummy();
    socket.addListener("setWords", _setGameRoomWords);
    socket.sendMsg("sendWords", {
      "roomID": room.id,
      "words": room.words.map((e) => e.toJson()).toList()
    });
  }

  List<Word> _createDummy() {
    List<Word> word = List();
    word.add(Word(word: "Apple"));
    word.add(Word(word: "Hi"));
    word.add(Word(word: "Gool"));
    word.add(Word(word: "Bool"));
    word.add(Word(word: "True"));
    return word;
  }

  void _setGameRoomWords(data) {
    List<Word> words = List();

    for (var doc in data) {
      words.add(Word.fromJson(doc));
    }

    print(words);
  }

  @override
  void dispose() {
    socket.close();
    super.dispose();
  }
}
