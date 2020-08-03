import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vbt_hackathon/Core/EnvironmentObjects/EnvironmentObj.dart';
import 'package:vbt_hackathon/Core/Firebase/Firebase.dart';
import 'package:vbt_hackathon/Models/Word.dart';
import './learned_words_list_page.dart';

abstract class LearnedWordsListPageViewModel extends State<LearnedWordsListPage>
    with FirestoreProcess {
  // Add your state and logic here
  List<WordList> wordsList = EnvironmentObjects().learnedWordList;
  bool isCalled = false;
  void queryCallback(QuerySnapshot snapshot) {
    List<WordList> tempList = List();
    snapshot.documents.forEach((doc) {
      tempList.add(WordList.fromJson(doc.data));
    });
    if (wordsList.isEmpty && snapshot.documents.isNotEmpty) {
      setState(() {
        isCalled = true;
        wordsList = tempList;
        EnvironmentObjects().learnedWordList = wordsList;
      });
    }
  }
}
