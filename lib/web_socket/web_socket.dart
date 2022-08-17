import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocket{

  static const String CONNECT_URL = "wss://ws.binaryws.com/websockets/v3?app_id=1089";
  static late WebSocketChannel channel;
  static final WebSocket _webSocket = WebSocket._internal();
  static late Function(dynamic event) listener;

  factory WebSocket(Function(dynamic event) listen) {
    listener = listen;
    return _webSocket;
  }

  WebSocket._internal(){
    channel = WebSocketChannel.connect(
      Uri.parse(CONNECT_URL),
    );
    ///Receive data of send request in stream listener
    channel.stream.listen(listener);
  }

  ///send request
  void sendRequest(Map<String,dynamic> request){
    channel.sink.add(jsonEncode(request));
  }

}