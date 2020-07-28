import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vbt_hackathon/Models/Word.dart';
import './game_room_page_view_model.dart';

class GameRoomPageView extends GameRoomPageViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(start.toString()),
                  Text(coin.toString())
                ],
              ),
            ),
            buildWordField(widget.gameRoom.words[questionIndex]),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                    onPressed: () {
                      if (wordText.text.toLowerCase() ==
                          widget.gameRoom.words[questionIndex].word
                              .toLowerCase()) {
                        setState(() {
                          questionIndex++;
                        });
                      } else {
                        wordText.clear();
                      }
                    },
                    child: Text("Try")),
                FlatButton(
                    onPressed: () {
                      int wordSize =
                          widget.gameRoom.words[questionIndex].word.length;
                      int randomCharIndex = Random().nextInt(wordSize);

                      while (openChars[randomCharIndex]) {
                        randomCharIndex = Random().nextInt(wordSize);
                      }
                      setState(() {
                        openChars[randomCharIndex] = true;
                      });
                    },
                    child: Text("Get Letter"))
              ],
            )
          ],
        ),
      ),
    );
  }

  Column buildWordField(Word word) {
    int randomSpec = Random().nextInt(word.specifications.length);
    int randomUsage =
        Random().nextInt(word.specifications[randomSpec].usages.length);
    String randomDefinition =
        word.specifications[randomSpec].usages[randomUsage].defination;
    return Column(
      children: <Widget>[buildWordRow(word.word), Text(randomDefinition)],
    );
  }

  Row buildWordRow(String word) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (var i = 0; i < word.length; i++)
          Expanded(
              child: Container(
            child: openChars[i] ? Text(word[i]) : Text(""),
          )),
      ],
    );
  }
}
