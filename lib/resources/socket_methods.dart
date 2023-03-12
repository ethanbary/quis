import 'package:flutter/material.dart';
import 'package:quis/resources/socket_client.dart';
import 'package:quis/screens/game_screen.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      print('emit?');
      _socketClient.emit('createRoom', {
        'nickname': nickname,
      });
      print(nickname);
    }
  }

  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on('createRoomSuccess', (room) {
      print(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }
}
