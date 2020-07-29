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
                FlatButton(
                    onPressed: () {
                      if (wordText.text.toLowerCase() ==
                          widget.gameRoom.words[questionIndex].word
                              .toLowerCase()) {
                        setState(() {
                          if (questionIndex ==
                              widget.gameRoom.words.length - 1) {
                            //TODO game is over
                            endGame();
                            print(
                                "You are finished all words. Wait for other user or wait for time up");
                          } else {
                            questionIndex++;
                            openChars.clear();
                            setWordBoolList();
                            wordText.clear();
                          }
                        });
                      } else {
                        wordText.clear();
                      }
                    },
                    child: Text("Try")),
                FlatButton(
                    onPressed: () {
                      if (coin - 10 >= 0) {
                        int wordSize =
                            widget.gameRoom.words[questionIndex].word.length;
                        int randomCharIndex = Random().nextInt(wordSize);

                        if (!openChars.contains(false)) {
                          //TODO all chars opened
                          setState(() {
                            questionIndex++;
                          });
                        } else {
                          while (openChars[randomCharIndex]) {
                            randomCharIndex = Random().nextInt(wordSize);
                          }
                          setState(() {
                            coin -= 10;
                            openChars[randomCharIndex] = true;
                          });
                        }
                      } else {
                        // TODO Coin bitti
                        print("coin bitti");
                      }
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
            child: openChars[i] ? Text(word[i]) : Text("_"),
          )),
      ],
    );
  }
}
