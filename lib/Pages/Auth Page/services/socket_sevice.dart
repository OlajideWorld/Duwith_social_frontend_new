import "dart:convert";

import "package:duwith_social/Pages/Auth%20Page/components/login_select.dart";
import "package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart";
import "package:duwith_social/Pages/Home%20Page/components/home_airdrop.dart";
import "package:duwith_social/common/getxmessage.dart";
import "package:flutter/material.dart";

import "package:get/get.dart";
import "package:socket_io_client/socket_io_client.dart" as IO;

import "../../../models/main_post_model.dart";
import "../../../models/user_data.dart";

AuthController authController = AuthController.instance;

class SocketService extends GetxService {
  static SocketService instance = Get.find<SocketService>();

  late IO.Socket _socket;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  Future<SocketService> init() async {
    try {
      _socket = IO.io(
          'http://192.168.1.123:3000',
          IO.OptionBuilder()
              .setTransports(["websocket"])
              .disableAutoConnect()
              .build());

      _socket.connect();
      _socket.onError((data) {
        // ignore: prefer_interpolation_to_compose_strings
        print('socket.onError -> data -> ' + data);
      });

      _socket.onConnect((data) => {print('Connected to server')});
      _socket.emit("connectnow", "Olajide Connected");
    } catch (e) {
      print('ConnectionScreen -> initState -> err ->');
      print(e.toString());
    }
    return this;
  }

  // void connectSocket() async {
  //   try {
  //     _socket = io(
  //         'http://192.168.1.123:3000',
  //         // OptionBuilder()
  //         //   .setTransports(['websocket']) // for Flutter or Dart VM
  //         //   .disableAutoConnect()  // disable auto-connection
  //         //   .setExtraHeaders({'foo': 'bar'}) // optional
  //         //   .build()
  //         <String, dynamic>{
  //           'transports': ['websocket'],
  //           'autoConnect': false,
  //           // 'query': {'token': 'THIS IS MY TOKEN FOR AUTHENTICATION'}
  //         });

  //     _socket.onConnect((_) {
  //       print('connected');
  //       // socket.emit('msg', 'test');
  //     });

  //     _socket
  //         .onDisconnect((_) => getErrorSnackBar("diconnected, check internet"));

  //     _socket.connect();
  //     print(_socket);
  //   } catch (e) {
  //     print('ConnectionScreen -> initState -> err ->');
  //     print(e.toString());
  //   }
  // }

  RxBool isloading = false.obs;

  // Authentication Functions
  void createUser(Map<String, dynamic> userData) {
    _socket.emit('createUser', userData);
    //
    _socket.on('userCreated', (data) {
      authController.userdata.value = User.fromJson(data);
    });
    if (authController.userdata.value == null) {
      isloading.value = false;
      getErrorSnackBar("No user Found");
    }
  }

  void getUserData(String userData) {
    _socket.emit('get-user-email', userData);
//
    _socket.on('user-gotten', (data) {
      authController.userdata.value = User.fromJson(data);
    });

    if (authController.userdata.value == null) {
      isloading.value = false;
      getErrorSnackBar("No user Found");
    }
  }

  void getUserDataNumber(String userData) {
    _socket.emit('get-user-number', userData);
    //
    _socket.on('user-gotten', (data) {
      authController.userdata.value = User.fromJson(data);
    });

    if (authController.userdata.value == null) {
      isloading.value = false;
      getErrorSnackBar("No user Found");
    }
  }

  void updateUser(String userId, Map<String, dynamic> updateData) {
    _socket.emit('update-user', {'userId': userId, 'updateData': updateData});
//
    _socket.on('user-updated', (data) {
      // var jsondata = jsonDecode(data);
      authController.userdata.value = User.fromJson(data);
    });
  }

  void followUser(String userId, String targetUserId) {
    _socket
        .emit('followUser', {'userId': userId, 'targetUserId': targetUserId});
    //
    _socket.on('user-followed', (data) {
      // var jsondata = jsonDecode(data);
      authController.userdata.value = User.fromJson(data['user']);
    });
  }

  void unfollowUser(String userId, String targetUserId) {
    _socket
        .emit('unfollowUser', {'userId': userId, 'targetUserId': targetUserId});
    //
    _socket.on('user-unfollowed', (data) {
      // var jsondata = jsonDecode(data);
      authController.userdata.value = User.fromJson(data['user']);
    });
  }

  void blockUser(String userId, String targetUserId) {
    _socket.emit('blockUser', {'userId': userId, 'targetUserId': targetUserId});
//
    _socket.on('user-blocked', (data) {
      // var jsondata = jsonDecode(data);
      authController.userdata.value = User.fromJson(data);
    });
  }

// Posts Functions

  void getPost(Map<String, dynamic> queryParams) {
    _socket.emit('getPosts', queryParams);

    _socket.on("postsFetched", (data) {
      // var jsondata = jsonDecode(data);
      homeController.postList.value =
          data.map((dynamic item) => Post.fromJson(item)).toList();
    });
  }

  void createPost(Map<String, dynamic> data) {
    _socket.emit("createPost", data);

    _socket.on("postCreated", (data) {
      // var jsondata = jsonDecode(data);
      // debugPrint(jsondata);
      getSuccessSnackBar("Post Created Successfully");
    });
  }

  void updatePost(String postId, Map<String, dynamic> updateData) {
    _socket.emit('updatePost', {'postId': postId, 'updateData': updateData});
//
    _socket.on("postUpdated", (data) {
      // var jsondata = jsonDecode(data);
      getSuccessSnackBar("Post Updated Successfully");
    });
  }

  void likePost(String postId, String userId) {
    _socket.emit("likePost", {'postId': postId, 'userId': userId});

//
    _socket.on("postLiked", (data) {
      getSuccessSnackBar("Post Liked");
    });
  }

  void dislikePost(String postId, String userId) {
    _socket.emit("dislikePost", {
      {'postId': postId, 'userId': userId}
    });
    //
    _socket.on("postDisliked", (data) {
      getSuccessSnackBar("Post disliked SUccessfuly");
    });
  }

  // Comments Functions

  void addComment(Map<String, dynamic> data) {
    _socket.emit("addComment", data);

    //
    _socket.on("commentAdded", (data) {
      getSuccessSnackBar("Comments Added Successfully");
    });
  }

  void updateComment(String commentId, Map<String, dynamic> updateData) {
    _socket.emit(
        "updateComment", {'commentId': commentId, 'updateData': updateData});
    //
    _socket.on("commentUpdated", (data) {
      getSuccessSnackBar("Comment Updated Successfully");
    });
  }

  void getCommentByPostId() {
    _socket.emit("getCommentsByPost", {});
//
    _socket.on("commentsFetched",
        (data) => {getSuccessSnackBar("Comments Fetched successfully")});
  }
}
