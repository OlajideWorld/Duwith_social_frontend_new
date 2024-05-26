// ignore_for_file: unused_import

import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_io_socket/flutter_io_socket.dart';

import '../../../common/getxmessage.dart';
import '../../../models/main_post_model.dart';
import '../../../models/user_data.dart';
import '../controller/auth_controller.dart';

AuthController authController = AuthController.instance;
HomeController homeController = HomeController.instance;

class SocketResources {
  Socket? socket;

  void connectFlutterSocket() {
    try {
      socket ??= io(
          'http://192.168.1.123:3000',
          OptionBuilder()
              .setTransports(['websocket']) // for Flutter or Dart VM
              .disableAutoConnect() // disable auto-connection
              .build());

      socket!.connect();
      socket!.onConnect((data) => print('connect:  $data'));
      socket!.onDisconnect((data) => print('disconnect : $data'));
      socket!.onError((data) => print('error $data'));
      socket!.onConnectError((error) => print('connect Error $error'));
      socket!.onConnectTimeout((data) => print('timeout Error $data'));
    } catch (e) {
      print('ConnectionScreen -> initState -> err ->');
      print(e.toString());
    }
  }

  // Authentication Functions
  void createUser(Map<String, dynamic> userData) {
    socket!.emit('createUser', userData);
    //
    socket!.on('userCreated', (data) {
      // var jsondata = jsonDecode(data);
      authController.userdata.value = User.fromJson(data);
    });
  }

  void getUserData(String userData) {
    socket!.emit('get-user-email', userData);
//
    socket!.on('user-gotten', (data) {
      // var jsondata = jsonDecode(data);
      authController.userdata.value = User.fromJson(data);
    });
  }

  void getUserDataNumber(String userData) {
    socket!.emit('get-user-number', userData);
    //
    socket!.on('user-gotten', (data) {
      // var jsondata = jsonDecode(data);
      authController.userdata.value = User.fromJson(data);
    });
  }

  void updateUser(String userId, Map<String, dynamic> updateData) {
    socket!.emit('update-user', {'userId': userId, 'updateData': updateData});
//
    socket!.on('user-updated', (data) {
      // var jsondata = jsonDecode(data);
      authController.userdata.value = User.fromJson(data);
    });
  }

  void followUser(String userId, String targetUserId) {
    socket!
        .emit('followUser', {'userId': userId, 'targetUserId': targetUserId});
    //
    socket!.on('user-followed', (data) {
      // var jsondata = jsonDecode(data);
      authController.userdata.value = User.fromJson(data['user']);
    });
  }

  void unfollowUser(String userId, String targetUserId) {
    socket!
        .emit('unfollowUser', {'userId': userId, 'targetUserId': targetUserId});
    //
    socket!.on('user-unfollowed', (data) {
      // var jsondata = jsonDecode(data);
      authController.userdata.value = User.fromJson(data['user']);
    });
  }

  void blockUser(String userId, String targetUserId) {
    socket!.emit('blockUser', {'userId': userId, 'targetUserId': targetUserId});
//
    socket!.on('user-blocked', (data) {
      // var jsondata = jsonDecode(data);
      authController.userdata.value = User.fromJson(data);
    });
  }

// Posts Functions

  void getPost(Map<String, dynamic> queryParams) {
    socket!.emit('getPosts', queryParams);

    socket!.on("postsFetched", (data) {
      // var jsondata = jsonDecode(data);
      homeController.postList.value =
          data.map((dynamic item) => Post.fromJson(item)).toList();
    });
  }

  void createPost(Map<String, dynamic> data) {
    socket!.emit("createPost", data);

    socket!.on("postCreated", (data) {
      // var jsondata = jsonDecode(data);
      // debugPrint(jsondata);
      getSuccessSnackBar("Post Created Successfully");
    });
  }

  void updatePost(String postId, Map<String, dynamic> updateData) {
    socket!.emit('updatePost', {'postId': postId, 'updateData': updateData});
//
    socket!.on("postUpdated", (data) {
      // var jsondata = jsonDecode(data);
      getSuccessSnackBar("Post Updated Successfully");
    });
  }

  void likePost(String postId, String userId) {
    socket!.emit("likePost", {'postId': postId, 'userId': userId});

//
    socket!.on("postLiked", (data) {
      getSuccessSnackBar("Post Liked");
    });
  }

  void dislikePost(String postId, String userId) {
    socket!.emit("dislikePost", {
      {'postId': postId, 'userId': userId}
    });
    //
    socket!.on("postDisliked", (data) {
      getSuccessSnackBar("Post disliked SUccessfuly");
    });
  }

  // Comments Functions

  void addComment(Map<String, dynamic> data) {
    socket!.emit("addComment", data);

    //
    socket!.on("commentAdded", (data) {
      getSuccessSnackBar("Comments Added Successfully");
    });
  }

  void updateComment(String commentId, Map<String, dynamic> updateData) {
    socket!.emit(
        "updateComment", {'commentId': commentId, 'updateData': updateData});
    //
    socket!.on("commentUpdated", (data) {
      getSuccessSnackBar("Comment Updated Successfully");
    });
  }

  void getCommentByPostId() {
    socket!.emit("getCommentsByPost", {});
//
    socket!.on("commentsFetched",
        (data) => {getSuccessSnackBar("Comments Fetched successfully")});
  }
}
