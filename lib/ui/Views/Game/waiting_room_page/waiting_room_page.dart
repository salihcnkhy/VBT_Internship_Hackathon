import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:vbt_hackathon/Core/Socket.IO/SocketIO.dart';
import 'package:vbt_hackathon/Models/Category.dart';
import './waiting_room_page_view.dart';

class WaitingRoomPage extends StatefulWidget {
  final Category category;
  WaitingRoomPage({@required this.category});

  @override
  WaitingRoomPageView createState() => new WaitingRoomPageView();
}
