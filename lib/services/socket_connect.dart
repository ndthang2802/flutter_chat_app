import 'package:socket_io_client/socket_io_client.dart';

class SocketConnect {
  static Socket connectToServer() {
    try {
      Socket socket = io('http://192.168.1.9:4000', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false
      });
      socket.connect();
      return socket;
    } catch (e) {
      print(e);
      throw Exception('connect fail');
    }
  }

  static void joinRoom(Socket socket, String idRoom) {
    socket.emit('join_room', idRoom);
  }

  static void sendMessage(Socket socket, dynamic message) {
    socket.emit('send_message', message);
  }
}
