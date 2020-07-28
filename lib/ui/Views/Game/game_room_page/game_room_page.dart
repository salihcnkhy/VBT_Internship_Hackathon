import 'package:flutter/material.dart';
import 'package:vbt_hackathon/Core/Socket.IO/SocketIO.dart';
import 'package:vbt_hackathon/Models/GameRoom.dart';
import './game_room_page_view.dart';

class GameRoomPage extends StatefulWidget {
  final GameRoom gameRoom;
  final SocketIO socket;
  const GameRoomPage({Key key, this.gameRoom, this.socket}) : super(key: key);
  @override
  GameRoomPageView createState() => new GameRoomPageView();
}
