import "package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart";
import "package:duwith_social/Pages/Home%20Page/components/home_airdrop.dart";
import "package:duwith_social/common/getxmessage.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

import "package:get/get.dart";
import "package:socket_io_client/socket_io_client.dart" as IO;

import "../../../models/main_post_model.dart";
import "../../../models/user_data.dart";

AuthController authController = AuthController.instance;

class SocketService {
  // static final SocketService instance = SocketService.internal();

  IO.Socket? _socket;

  // SocketService.internal();

  // factory SocketService() {
  //   return instance;
  // }

  void connectAndListen() {
    _socket ??= IO.io(
        'http://localhost:3000',
        IO.OptionBuilder()
            .setTransports(["websocket"])
            .disableAutoConnect()
            .build());

    _socket!.connect();

    _socket!.onConnect((data) => {print('Connected to server : $data')});

    _socket!.on("connectnow", (data) => {debugPrint(data)});
  }

  RxBool isloading = false.obs;

  // void initSocket() async {
  //   print("Flutter websocket beginning");

  //   _socket = IO.io('http://localhost:3000', <String, dynamic>{
  //     'transports': ['websocket'],
  //     'autoConnect': true,
  //   });

  //   _socket!.connect();

  // _socket.onConnect((_) {
  //   debugPrint('Connected to server');
  //   getSuccessSnackBar("Connected");
  // });

  // _socket.onDisconnect((_) {
  //   debugPrint('Disconnected from server');
  //   getErrorSnackBar("Disconnected, check internet");
  // });

  // _socket.on("error", (data) {
  //   getErrorSnackBar(data);
  // });

  //   print("Flutter ran the websocket");
  // }

  // connectSocket() async {
  //   debugPrint("connect");
  // }

  // Authentication Functions
  void createUser(Map<String, dynamic> userData) {
    _socket!.emit('createUser', userData);
    //
    _socket!.on('userCreated', (data) {
      // var jsondata = jsonDecode(data);
      authController.userdata.value = User.fromJson(data);
    });
  }

  void getUserData(String userData) {
    _socket!.emit('get-user-email', userData);
//
    _socket!.on('user-gotten', (data) {
      // var jsondata = jsonDecode(data);
      authController.userdata.value = User.fromJson(data);
    });
  }

  void getUserDataNumber(String userData) {
    _socket!.emit('get-user-number', userData);
    //
    _socket!.on('user-gotten', (data) {
      // var jsondata = jsonDecode(data);
      authController.userdata.value = User.fromJson(data);
    });
  }

  void updateUser(String userId, Map<String, dynamic> updateData) {
    _socket!.emit('update-user', {'userId': userId, 'updateData': updateData});
//
    _socket!.on('user-updated', (data) {
      // var jsondata = jsonDecode(data);
      authController.userdata.value = User.fromJson(data);
    });
  }

  void followUser(String userId, String targetUserId) {
    _socket!
        .emit('followUser', {'userId': userId, 'targetUserId': targetUserId});
    //
    _socket!.on('user-followed', (data) {
      // var jsondata = jsonDecode(data);
      authController.userdata.value = User.fromJson(data['user']);
    });
  }

  void unfollowUser(String userId, String targetUserId) {
    _socket!
        .emit('unfollowUser', {'userId': userId, 'targetUserId': targetUserId});
    //
    _socket!.on('user-unfollowed', (data) {
      // var jsondata = jsonDecode(data);
      authController.userdata.value = User.fromJson(data['user']);
    });
  }

  void blockUser(String userId, String targetUserId) {
    _socket!
        .emit('blockUser', {'userId': userId, 'targetUserId': targetUserId});
//
    _socket!.on('user-blocked', (data) {
      // var jsondata = jsonDecode(data);
      authController.userdata.value = User.fromJson(data);
    });
  }

// Posts Functions

  void getPost(Map<String, dynamic> queryParams) {
    _socket!.emit('getPosts', queryParams);

    _socket!.on("postsFetched", (data) {
      // var jsondata = jsonDecode(data);
      homeController.postList.value =
          data.map((dynamic item) => Post.fromJson(item)).toList();
    });
  }

  void createPost(Map<String, dynamic> data) {
    _socket!.emit("createPost", data);

    _socket!.on("postCreated", (data) {
      // var jsondata = jsonDecode(data);
      // debugPrint(jsondata);
      getSuccessSnackBar("Post Created Successfully");
    });
  }

  void updatePost(String postId, Map<String, dynamic> updateData) {
    _socket!.emit('updatePost', {'postId': postId, 'updateData': updateData});
//
    _socket!.on("postUpdated", (data) {
      // var jsondata = jsonDecode(data);
      getSuccessSnackBar("Post Updated Successfully");
    });
  }

  void likePost(String postId, String userId) {
    _socket!.emit("likePost", {'postId': postId, 'userId': userId});

//
    _socket!.on("postLiked", (data) {
      getSuccessSnackBar("Post Liked");
    });
  }

  void dislikePost(String postId, String userId) {
    _socket!.emit("dislikePost", {
      {'postId': postId, 'userId': userId}
    });
    //
    _socket!.on("postDisliked", (data) {
      getSuccessSnackBar("Post disliked SUccessfuly");
    });
  }

  // Comments Functions

  void addComment(Map<String, dynamic> data) {
    _socket!.emit("addComment", data);

    //
    _socket!.on("commentAdded", (data) {
      getSuccessSnackBar("Comments Added Successfully");
    });
  }

  void updateComment(String commentId, Map<String, dynamic> updateData) {
    _socket!.emit(
        "updateComment", {'commentId': commentId, 'updateData': updateData});
    //
    _socket!.on("commentUpdated", (data) {
      getSuccessSnackBar("Comment Updated Successfully");
    });
  }

  void getCommentByPostId() {
    _socket!.emit("getCommentsByPost", {});
//
    _socket!.on("commentsFetched",
        (data) => {getSuccessSnackBar("Comments Fetched successfully")});
  }
}
