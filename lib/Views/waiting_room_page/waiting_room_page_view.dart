import 'package:flutter/material.dart';
import './waiting_room_page_view_model.dart';

class WaitingRoomPageView extends WaitingRoomPageViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
        body: Column(
      children: <Widget>[
        Text(infoText),
      ],
    ));
  }
}
