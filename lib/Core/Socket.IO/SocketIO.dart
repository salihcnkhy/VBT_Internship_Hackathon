import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketIO {
  // Singleton
  static final SocketIO _singleton = SocketIO._internal();
  SocketIO._internal();
  factory SocketIO() {
    return _singleton;
  }
  // End Singleton

  IO.Socket socket;

  void connect(String uri) {
    this.socket = IO.io(uri, <String, dynamic>{
      'transports': ['websocket'],
    });
    socket.on('connect', (_) {
      print('connect');
      socket.emit('msg', 'test');
    });
    socket.connect();
  }

  void sendMsg(String event, dynamic data) {
    socket.emit(event, data);
  }

  void addListener(String event, Function call) {
    socket.on(event, (data) => call(data));
  }
}
