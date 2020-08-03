import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:vbt_hackathon/Core/EnvironmentObjects/EnvironmentObj.dart';
import 'package:vbt_hackathon/Core/Firebase/Firebase.dart';
import 'package:vbt_hackathon/Core/Socket.IO/SocketIO.dart';
import 'package:vbt_hackathon/Helper/Class/uuid_generator.dart';
import 'package:vbt_hackathon/Models/GameRoom.dart';
import 'package:vbt_hackathon/Models/Word.dart';
import 'package:vbt_hackathon/ui/Views/Game/game_room_page/game_room_page.dart';
import './waiting_room_page.dart';

abstract class WaitingRoomPageViewModel extends State<WaitingRoomPage>
    with FirestoreProcess {
  SocketIO socket = SocketIO();
  String infoText;
  var env = EnvironmentObjects();
  GameRoom room;
  @override
  void initState() {
    print("init");
    super.initState();
    infoText = "Connecting to " + widget.category.id + "...";
  }

  void dataCallBack(snapshot) {
    if (room == null) {
      room = GameRoom();
      if (snapshot.data != null) {
        WordList wordList = WordList.fromJson(snapshot.data);
        if (wordList.words.length > 2) {
          wordList.words.shuffle();
          room.words = wordList.words.sublist(0, 3);
          print("Words Size: " + room.words.length.toString());
          print(room.words.map((e) => print(e.word)));
          socket.connect(widget.category.id, _connectionCallBack);
        } else {
          Navigator.pop(context);
        }
      } else {
        Navigator.pop(context);
      }
    }
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
    room.id = map["roomID"];

    socket.addListener("setWords", _setGameRoomWords);
    socket.sendMsg("sendWords", {
      "roomID": room.id,
      "words": room.words.map((e) => e.toJson()).toList()
    });
  }

  void _setGameRoomWords(data) {
    List<Word> words = List();

    for (var doc in data) {
      words.add(Word.fromJson(doc));
    }
    room.words = words;
    pushNewScreen(context,
        screen: GameRoomPage(
          gameRoom: room,
          socket: socket,
        ));
    print(words);
  }

  @override
  void dispose() {
    print("DISPOSE");
    socket.close();
    super.dispose();
  }
}
