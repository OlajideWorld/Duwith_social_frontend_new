import "package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart";
import "package:duwith_social/common/getxmessage.dart";

import "package:get/get.dart";
import "package:socket_io_client/socket_io_client.dart" as IO;

import "../../../models/user_data.dart";

AuthController authController = AuthController.instance;

class SocketService extends GetxService {
  late IO.Socket _socket;

  @override
  void onInit() {
    super.onInit();
    _initSocket();
  }

  void _initSocket() {
    _socket = IO.io(
        'http://localhost:3000',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());

    _socket.onConnect((_) {
      print('Connected to server');
      getSuccessSnackBar("Connected");
    });

    _socket.onDisconnect((_) {
      print('Disconnected from server');
      getErrorSnackBar("Disconnected, check internet");
    });

    // User Events
    _socket.on('userCreated', (data) {
      authController.userdata.value = User.fromJson(data);
    });

    _socket.on('user-gotten', (data) {
      authController.userdata.value = User.fromJson(data);
    });

    _socket.on('user-updated', (data) {
      authController.userdata.value = User.fromJson(data);
    });

    _socket.on('user-followed', (data) {
      authController.userdata.value = User.fromJson(data['user']);
    });

    _socket.on('user-unfollowed', (data) {
      authController.userdata.value = User.fromJson(data['user']);
    });
    _socket.on('user-blocked', (data) {
      authController.userdata.value = User.fromJson(data);
    });

    // Post

    _socket.connect();
  }

  //
  // Functions

  void createUser(Map<String, dynamic> userData) {
    _socket.emit('createUser', userData);
  }

  void getUserData(String userData) {
    _socket.emit('get-user-email', userData);
  }

  void getUserDataNumber(String userData) {
    _socket.emit('get-user-number', userData);
  }

  void updateUser(String userId, Map<String, dynamic> updateData) {
    _socket.emit('update-user', {'userId': userId, 'updateData': updateData});
  }

  void followUser(String userId, String targetUserId) {
    _socket
        .emit('followUser', {'userId': userId, 'targetUserId': targetUserId});
  }

  void unfollowUser(String userId, String targetUserId) {
    _socket
        .emit('unfollowUser', {'userId': userId, 'targetUserId': targetUserId});
  }

  void blockUser(String userId, String targetUserId) {
    _socket.emit('blockUser', {'userId': userId, 'targetUserId': targetUserId});
  }
}
