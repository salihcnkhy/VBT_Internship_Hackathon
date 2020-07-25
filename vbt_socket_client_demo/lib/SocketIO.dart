import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:uuid/uuid.dart';

class SocketIO {
  // Singleton
  static final SocketIO _singleton = SocketIO._internal();
  SocketIO._internal();
  factory SocketIO() {
    return _singleton;
  }
  // End Singleton

  IO.Socket socket;
  var uuid = Uuid().v1();
  void connect(String uri) {
    this.socket = IO.io(uri, <String, dynamic>{
      'transports': ['websocket'],
    });
    socket.on('connect', (_) {
      print('connect');
      socket.emit('msg', 'test');
    });
  }

  void sendMsg(String event, dynamic data) {
    socket.emit(event, data);
  }

  void addListener(String event, Function(dynamic) call) {
    socket.on(event, (data) => call(data));
  }
}
