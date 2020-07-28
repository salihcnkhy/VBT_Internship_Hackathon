import 'package:flutter/material.dart';
import 'package:vbt_hackathon/Core/Http/WordListCall.dart';
import 'package:vbt_hackathon/Helper/Views/future_builder_helper.dart';
import 'package:vbt_hackathon/Helper/Views/progress_bar.dart';
import './waiting_room_page_view_model.dart';

class WaitingRoomPageView extends WaitingRoomPageViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
        body: FutureHelper(
      progressWidget: DefaultProgressBar(),
      future: WordListCaller().fetchWords(widget.category.url),
      hasDataCallback: dataCallBack,
      hasErrorWidget: Text("Error"),
      hasDataWidget: Column(
        children: <Widget>[
          Text(infoText),
        ],
      ),
    ));
  }
}
