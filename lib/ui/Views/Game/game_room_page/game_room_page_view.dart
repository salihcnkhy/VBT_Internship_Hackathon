import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vbt_hackathon/Helper/Views/roundedrect_with_shadow.dart';
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
                  Text((questionIndex + 1).toString() +
                      "/" +
                      widget.gameRoom.words.length.toString()),
                  Text(coin.toString())
                ],
              ),
            ),
            buildWordField(widget.gameRoom.words[questionIndex]),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: wordText,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(onPressed: tryButton, child: Text("Try")),
                FlatButton(
                    onPressed: getLetterButton, child: Text("Get Letter"))
              ],
            )
          ],
        ),
      ),
    );
  }

  Column buildWordField(Word word) {
    return Column(
      children: <Widget>[
        buildWordRow(word.word),
        Text(word.specifications.first.usages.first.defination)
      ],
    );
  }

  Row buildWordRow(String word) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (var i = 0; i < word.length; i++)
          Expanded(
              child: RoundedRectWithShadow(
            borderRadius: BorderRadius.circular(2),
            child: openChars[i] ? Text(word[i]) : Text("_"),
          )),
      ],
    );
  }
}
