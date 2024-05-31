// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_io_socket/flutter_io_socket.dart';

import '../../../common/getxmessage.dart';
import '../../../models/main_post_model.dart';
import '../../../models/user_data.dart';

class SocketResources {
  Socket? socket;

  // void connectFlutterSocket() {
  //   try {
  //     socket ??= io(
  //         'http://192.168.1.123:3000',
  //         OptionBuilder()
  //             .setTransports(['websocket']) // for Flutter or Dart VM
  //             .disableAutoConnect() // disable auto-connection
  //             .build());

  //     socket!.connect();
  //     socket!.onConnect((data) => print('connect:  $data'));
  //     socket!.onDisconnect((data) => print('disconnect : $data'));
  //     socket!.onError((data) => print('error $data'));
  //     socket!.onConnectError((error) => print('connect Error $error'));
  //     socket!.onConnectTimeout((data) => print('timeout Error $data'));
  //   } catch (e) {
  //     print('ConnectionScreen -> initState -> err ->');
  //     print(e.toString());
  //   }
  // }
}
