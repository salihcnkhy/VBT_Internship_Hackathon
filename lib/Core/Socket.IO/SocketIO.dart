import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketIO {
  IO.Socket socket;
  static const url = "http://192.168.1.7:3000/";
  void connect(String nsp, Function callBack) {
    this.socket = IO.io(url + nsp, <String, dynamic>{
      'transports': ['websocket'],
    });
    socket.on('connect', (_) {
      callBack();
    });
    socket.connect();
  }

void close(){
  socket.close();
}
  void sendMsg(String event, dynamic data) {
    socket.emit(event, data);
  }

  void addListener(String event, Function call) {
    socket.on(event, (data) => call(data));
  }
}
