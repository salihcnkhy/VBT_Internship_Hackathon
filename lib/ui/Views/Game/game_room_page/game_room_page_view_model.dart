import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:vbt_hackathon/Models/Word.dart';
import 'package:vbt_hackathon/ui/Views/Home/home_page/home_page.dart';
import './game_room_page.dart';
import 'dart:async';

abstract class GameRoomPageViewModel extends State<GameRoomPage> {
  Timer _timer;
  int start = 60;
  int coin = 100;
  int questionIndex = 0;
  List<bool> openChars = new List();
  TextEditingController wordText = new TextEditingController();
  @override
  void initState() {
    super.initState();
    startTimer();
    setWordBoolList();
  }

  void setWordBoolList() {
    for (var i = 0; i < widget.gameRoom.words[questionIndex].word.length; i++) {
      openChars.add(false);
    }
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (start < 0) {
            timer.cancel();
            // times up
            endGame();
            pushNewScreen(context, screen: HomePage());
          } else {
            start = start - 1;
          }
        },
      ),
    );
  }

  void endGame() {
    widget.socket.sendMsg("endGame", {"roomID": widget.gameRoom.id});
  }
}
