import 'package:flutter/material.dart';
import 'package:vbt_hackathon/Helper/Views/progress_bar.dart';
import 'package:vbt_hackathon/Helper/Views/stream_builder_helper.dart';
import './learned_words_list_page_view_model.dart';

class LearnedWordsListPageView extends LearnedWordsListPageViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return isCalled
        ? StreamHelper(
            stream: getWordQuerySnapshot(),
            progressWidget: DefaultProgressBar(),
            hasDataCallback: queryCallback,
            hasDataWidget: buildListView(),
          )
        : buildListView();
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: wordsList.length,
      itemBuilder: (context, index) {
        final wordList = wordsList[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              wordList.id,
              style: Theme.of(context).textTheme.headline5,
            ),
            for (var word in wordList.words) ListTile(title: Text(word.word))
          ],
        );
      },
    );
  }
}
