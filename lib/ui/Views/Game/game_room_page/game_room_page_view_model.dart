import 'dart:math';

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:vbt_hackathon/Models/Word.dart';
import 'package:vbt_hackathon/ui/Views/Home/category_list_page/category_list_page.dart';
import 'package:vbt_hackathon/ui/Views/Home/home_page/home_page.dart';
import './game_room_page.dart';
import 'dart:async';

abstract class GameRoomPageViewModel extends State<GameRoomPage> {
  Timer _timer;
  int start = 200;
  int coin = 100;
  int questionIndex = 0;
  List<bool> openChars = new List();
  TextEditingController wordText = new TextEditingController();
  @override
  void initState() {
    super.initState();
    startTimer();
    setWordBoolList();
    widget.socket.addListener("endGame", (data) {
      print("game ended by other user");
      endGame();
    });
  }

  void suffleEveryWords() {
    var words = widget.gameRoom.words;

    words.shuffle();

    for (var word in words) {
      word.specifications.shuffle();
      for (var spec in word.specifications) {
        spec.usages.shuffle();
      }
    }
    widget.gameRoom.words = words;
  }

  void setWordBoolList() {
    print("Question Number: " + questionIndex.toString());
    openChars.clear();
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
          if (start < 1) {
            endGame();
          } else {
            start = start - 1;
          }
        },
      ),
    );
  }

  void tryButton() {
    if (wordText.text.toLowerCase() ==
        widget.gameRoom.words[questionIndex].word.toLowerCase()) {
      setState(() {
        if (questionIndex == widget.gameRoom.words.length - 1) {
          //TODO game is over
          endGame();
          print(
              "You are finished all words. Wait for other user or wait for time up");
        } else {
          questionIndex++;
          setWordBoolList();
          wordText.clear();
        }
      });
    } else {
      wordText.clear();
    }
  }

  void getLetterButton() {
    if (coin - 10 >= 0) {
      int wordSize = widget.gameRoom.words[questionIndex].word.length;
      int randomCharIndex = Random().nextInt(wordSize);

      while (openChars[randomCharIndex]) {
        randomCharIndex = Random().nextInt(wordSize);
      }
      setState(() {
        coin -= 10;
        openChars[randomCharIndex] = true;
        if (!openChars.contains(false)) {
          goNextWord();
        }
      });
    } else {
      // TODO Coin bitti
      print("coin bitti");
    }
  }

  void goNextWord() {
    setState(() {
      questionIndex++;
      setWordBoolList();
    });
  }

  void endGame() {
    _timer.cancel();
    widget.socket.sendMsg("endGame", {"roomID": widget.gameRoom.id});

    pushNewScreen(context, screen: CategoryListPage());
  }
}
