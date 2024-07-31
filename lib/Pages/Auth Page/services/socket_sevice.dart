// ignore_for_file: prefer_typing_uninitialized_variables, invalid_use_of_protected_member

import "dart:async";

import "package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart";
import "package:duwith_social/Pages/Earn%20More%20Page/controller/earn_controller.dart";
import "package:duwith_social/Pages/Home%20Page/components/home_airdrop.dart";
import "package:duwith_social/Pages/Profile%20Page/controller/profile_controller.dart";
import "package:duwith_social/Pages/Shop%20Page/controller/shop_controller.dart";
import "package:duwith_social/common/getxmessage.dart";
import "package:duwith_social/models/games_model.dart";
import "package:duwith_social/models/questions_model.dart";
import "package:duwith_social/models/quiz_model.dart";
import "package:duwith_social/models/comments_model.dart";
import "package:duwith_social/models/news_models.dart";
import "package:duwith_social/models/post-data.dart";
import "package:duwith_social/models/social_task_model.dart";
import "package:flutter/cupertino.dart";

import "package:get/get.dart";
import "package:socket_io_client/socket_io_client.dart" as IO;

import "../../../models/airdrop_model.dart";
import "../../../models/user_data.dart";
import "../../Home Page/controllers/home_controller.dart";
import "../screens/verify_details.dart";

AuthController authController = AuthController.instance;
HomeController homeController = HomeController.instance;
EarnController earnController = EarnController.instance;
ShopController shopController = ShopController.instance;
ProfileController profileController = ProfileController.instance;

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

  String productionUrl = 'https://duwith-social-backend.onrender.com';
  String testUrl = "http://192.168.1.123:3000";
  String testurl2 = "http://192.168.23.56:3000";

  Future<SocketService> init() async {
    try {
      _socket = IO.io(
          productionUrl,
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

  RxBool isloading = false.obs;

  sendEmailOtp(Map<String, dynamic> userData) {
    _socket.emit('otp-email-request', userData);

    _socket.on("otp-email-done", (data) => {getSuccessSnackBar(data)});
  }

  // Authentication Functions
  createUser(Map<String, dynamic> userData) async {
    _socket.emit('createUser', userData);

    _socket.on('userCreated', (data) {
      if (data != null && data["email"] != null) {
        authController.userdata.value = User.fromJson(data);
        isloading.value = false;
        Get.to(() => VerifyCredentials());
      } else {
        isloading.value = false;
      }
    });
  }

  getUserData(String userData) async {
    _socket.emit('get-user-email', userData);

    _socket.on('user-gotten', (data) {
      if (data != null && data["email"] != null) {
        authController.userdata.value = User.fromJson(data);
        sendEmailOtp({
          "email": authController.userdata.value.email,
          "username": authController.userdata.value.username,
          "otp": authController.userdata.value.otp
        });
        isloading.value = false;
        Get.to(() => VerifyCredentials());
      } else {
        isloading.value = false;
      }
    });
  }

  getUserData2(String userData) async {
    _socket.emit('get-user-email', userData);

    _socket.on('user-gotten', (data) {
      if (data != null && data["email"] != null) {
        authController.userdata.value = User.fromJson(data);
        isloading.value = false;
        // getErrorSnackBar(
        //     "Unable to get your details, check internet Connection");
      } else {
        homeController.homeloading.value = true;
      }
    });
  }

  getUserDataNumber(String userData) {
    _socket.emit('get-user-number', userData);
    //
    _socket.on('user-gotten-number', (data) {
      if (data != null && data["email"] != null) {
        authController.userdata.value = User.fromJson(data);
        isloading.value = false;
        Get.to(() => VerifyCredentials());
      } else {
        isloading.value = false;
      }
    });
  }

  updateUser(String userId, Map<String, dynamic> updateData) {
    _socket.emit('update-user', {'userId': userId, 'updateData': updateData});
//
    _socket.on('user-updated', (data) {
      if (data != null && data["email"] != null) {
        authController.userdata.value = User.fromJson(data);
        profileController.viewProfileData.value = User.fromJson(data);
        isloading.value = false;
      } else {
        isloading.value = false;
      }
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

  getPost(Map<String, dynamic> queryParams) {
    _socket.emit('get-paginated-post', queryParams);

    _socket.on("post-fetched-paginated", (data) {
      List<PostForYou> postList = (data as List)
          .map((item) => PostForYou.fromJson(item as Map<String, dynamic>))
          .toList();
      homeController.postList.value = postList;
      if (homeController.postList.value.isEmpty || data == null) {
        homeController.homeloading.value = true;
        getErrorSnackBar("No post data found");
      } else {
        homeController.homeloading.value = false;
        getSuccessSnackBar("success");
        if (homeController.postList.value.length < homeController.limit.value) {
          homeController.hasmoreData.value = false;
        }
      }
    });
  }

  getVideos(Map<String, dynamic> queryParams) {
    _socket.emit('get-video-post', queryParams);
    //
    _socket.on("post-video-paginated", (data) {
      List<PostForYou> postList = (data as List)
          .map((item) => PostForYou.fromJson(item as Map<String, dynamic>))
          .toList();
      homeController.postListVideo.value = postList;
      if (homeController.postListVideo.value.isEmpty ||
          homeController.postListVideo.value == null) {
        homeController.homeloading.value = true;
        getErrorSnackBar("Not able to videos");
      } else {
        homeController.homeloading.value = false;
        getSuccessSnackBar("success");
      }
    });
  }

  createPost(Map<String, dynamic> data) async {
    _socket.emit("createPost", data);

    _socket.on("postCreated", (data) {
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

  likePost(String postId, String userId, int type) async {
    _socket.emit("likePost", {'postId': postId, 'userId': userId});

//
    _socket.on("postLiked", (data) {
      // getSuccessSnackBar("Post Liked");
      List<Interaction> likes = List<Interaction>.from(
          data['likes'].map((like) => Interaction.fromJson(like)));
      List<Interaction> dislikes = List<Interaction>.from(
          data['dislikes'].map((dislikes) => Interaction.fromJson(dislikes)));
      if (type == 1) {
        int index = homeController.postList.value
            .indexWhere((post) => post.id == postId);

        if (index != -1) {
          homeController.postList.value[index].likes = likes;
          homeController.postList.value[index].dislikes = dislikes;
          homeController.postList.refresh();
        }
      } else {
        int index = homeController.postListVideo.value
            .indexWhere((post) => post.id == postId);

        if (index != -1) {
          homeController.postListVideo.value[index].likes = likes;
          homeController.postListVideo.value[index].dislikes = dislikes;
          homeController.postListVideo.refresh();
        }
      }
    });
  }

  dislikePost(String postId, String userId, int type) {
    _socket.emit("dislikePost", {
      {'postId': postId, 'userId': userId}
    });
    //
    _socket.on("postDisliked", (data) {
      List<Interaction> dislikes = List<Interaction>.from(
          data['dislikes'].map((dislikes) => Interaction.fromJson(dislikes)));
      List<Interaction> likes = List<Interaction>.from(
          data['likes'].map((like) => Interaction.fromJson(like)));
      if (type == 1) {
        int index = homeController.postList.value
            .indexWhere((post) => post.id == postId);

        if (index != -1) {
          homeController.postList.value[index].likes = likes;
          homeController.postList.value[index].dislikes = dislikes;
          homeController.postList.refresh();
        }
      } else {
        int index = homeController.postListVideo.value
            .indexWhere((post) => post.id == postId);

        if (index != -1) {
          homeController.postListVideo.value[index].likes = likes;
          homeController.postListVideo.value[index].dislikes = dislikes;
          homeController.postListVideo.refresh();
        }
      }
    });
  }

  // Comments Functions
  addComment(Map<String, dynamic> data) {
    _socket.emit("addComment", data);

    //
    _socket.on("commentAdded", (data) {
      if (data != null && data["_id"] != "") {
        homeController.isCommenting.value = false;
        getSuccessSnackBar("Comments Added Successfully");
      }
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

  likeComments(String postId, String userId, int type) {
    _socket.emit("like_Post_Comment", {"postId": postId, "userId": userId});
    //
    _socket.on("post_comment_liked", (data) {
      List<LikeModel> likesgotten =
          List<LikeModel>.from(data["likes"].map((x) => LikeModel.fromJson(x)));
      if (type == 1) {
        int index = homeController.commentsList.value
            .indexWhere((post) => post.id == postId);

        if (index != -1) {
          homeController.commentsList.value[index].likes = likesgotten;
          homeController.commentsList.refresh();
        }
      } else {
        int index = homeController.commentsListVideo.value
            .indexWhere((post) => post.id == postId);

        if (index != -1) {
          homeController.commentsListVideo.value[index].likes = likesgotten;
          homeController.commentsListVideo.refresh();
        }
      }
    });
  }

  getCommentByPostId(String postId, int type) {
    _socket.emit("getCommentsByPost", postId);
//
    _socket.on("commentsFetched", (data) {
      List<CommentModel> commentsList = (data as List)
          .map((item) => CommentModel.fromJson(item as Map<String, dynamic>))
          .toList();

      if (type == 1) {
        homeController.commentsList.value = commentsList;
        homeController.commentsList.refresh();
        int index = homeController.postList.value
            .indexWhere((post) => post.id == postId);

        if (index != -1) {
          homeController.postList.value[index].comments =
              homeController.commentsList.length;
          homeController.postList.refresh();
        }
      } else {
        homeController.commentsListVideo.value = commentsList;
        homeController.commentsListVideo.refresh();
        int index = homeController.postListVideo.value
            .indexWhere((post) => post.id == postId);

        if (index != -1) {
          homeController.postListVideo.value[index].comments =
              homeController.commentsList.length;
          homeController.postListVideo.refresh();
        }
      }

      homeController.loadingComment.value = false;
    });
  }

  //
  //
  // News Method

  // News
  getNewsList(Map<String, dynamic> data) async {
    _socket.emit("get-news", data);
    //
    _socket.on("news-gotten", (data) {
      List<NewsUpdate> newsList = (data as List)
          .map((item) => NewsUpdate.fromJson(item as Map<String, dynamic>))
          .toList();

      homeController.newsUpdateList.value = newsList;
      if (homeController.newsUpdateList.value.isEmpty ||
          homeController.newsUpdateList.value == null) {
        // homeController.homeloading.value = true;
        getErrorSnackBar("Not able to news");
      } else {
        homeController.homeloading.value = false;
        // getSuccessSnackBar("success");
      }
    });
  }

  likeNewsPost(String postId, String userId) async {
    _socket.emit("like_news", {'postId': postId, 'userId': userId});

//
    _socket.on("news_post_liked", (data) {
      // getSuccessSnackBar("Post Liked");
      List<NewsInteraction> likes = List<NewsInteraction>.from(
          data['likes'].map((like) => NewsInteraction.fromJson(like)));
      List<NewsInteraction> dislikes = List<NewsInteraction>.from(
          data['dislikes']
              .map((dislikes) => NewsInteraction.fromJson(dislikes)));
      int index = homeController.newsUpdateList.value
          .indexWhere((post) => post.id == postId);

      if (index != -1) {
        homeController.newsUpdateList.value[index].likes = likes;
        homeController.newsUpdateList.value[index].dislikes = dislikes;
        homeController.newsUpdateList.refresh();
      }
    });
  }

  dislikeNewsPost(String postId, String userId) {
    _socket.emit("dislike_news", {
      {'postId': postId, 'userId': userId}
    });
    //
    _socket.on("news_post_disliked", (data) {
      List<NewsInteraction> dislikes = List<NewsInteraction>.from(
          data['dislikes']
              .map((dislikes) => NewsInteraction.fromJson(dislikes)));
      List<NewsInteraction> likes = List<NewsInteraction>.from(
          data['likes'].map((like) => NewsInteraction.fromJson(like)));
      int index = homeController.newsUpdateList.value
          .indexWhere((post) => post.id == postId);

      if (index != -1) {
        homeController.newsUpdateList.value[index].dislikes = dislikes;
        homeController.newsUpdateList.value[index].likes = likes;
        homeController.newsUpdateList.refresh();
      }
    });
  }

  addNewsComment(Map<String, dynamic> data) {
    _socket.emit("add_comment_news", data);

    //
    _socket.on("news_comment_added", (data) {
      if (data != null && data["_id"] != "") {
        homeController.isCommenting.value = false;
        getSuccessSnackBar("Comments Added Successfully");
      }
    });
  }

  likeNewsComment(String postId, String userId) {
    _socket.emit("like_news_comment", {"postId": postId, "userId": userId});
    //
    _socket.on("news_comment_liked", (data) {
      List<LikeModel> likesgotten =
          List<LikeModel>.from(data["likes"].map((x) => LikeModel.fromJson(x)));
      int index = homeController.commentsNews.value
          .indexWhere((post) => post.id == postId);

      if (index != -1) {
        homeController.commentsNews.value[index].likes = likesgotten;
        homeController.commentsNews.refresh();
      }
    });
  }

  getCommentByNewsId(String postId) {
    _socket.emit("get_news_comments", postId);
//
    _socket.on("news_comment_gotten", (data) {
      List<CommentModel> commentsList = (data as List)
          .map((item) => CommentModel.fromJson(item as Map<String, dynamic>))
          .toList();

      homeController.commentsNews.value = commentsList;
      homeController.commentsNews.refresh();
      int index = homeController.newsUpdateList.value
          .indexWhere((post) => post.id == postId);

      if (index != -1) {
        homeController.newsUpdateList.value[index].comments =
            homeController.commentsNews;
        homeController.newsUpdateList.refresh();
      }

      homeController.loadingComment.value = false;
    });
  }

  //
  //  Airdrop Methods

// Air-drop
  getAirdropList(Map<String, dynamic> data) async {
    _socket.emit("get-airdrop", data);
    //
    _socket.on("airdrop-gotten", (data) {
      List<AirdropModel> airdropList = (data as List)
          .map((item) => AirdropModel.fromJson(item as Map<String, dynamic>))
          .toList();

      homeController.airdropList.value = airdropList;
      if (homeController.airdropList.value.isEmpty ||
          homeController.airdropList.value == null) {
        homeController.homeloading.value = false;
        getErrorSnackBar("Not able to get airdrop");
      } else {
        homeController.homeloading.value = false;
        // if (homeController.airdropList.value.length <
        //     homeController.limit.value) {
        //   homeController.hasmoreData.value = false;
        // }
      }
    });
  }

  likeAirdropPost(String postId, String userId) async {
    _socket.emit("like_airdrop", {'postId': postId, 'userId': userId});

//
    _socket.on("airdrop_post_liked", (data) {
      // getSuccessSnackBar("Post Liked");
      List<AirdropInteraction> likes = List<AirdropInteraction>.from(
          data['likes'].map((like) => AirdropInteraction.fromJson(like)));
      List<AirdropInteraction> dislikes = List<AirdropInteraction>.from(
          data['dislikes']
              .map((dislikes) => AirdropInteraction.fromJson(dislikes)));
      int index = homeController.airdropList.value
          .indexWhere((post) => post.id == postId);

      if (index != -1) {
        homeController.airdropList.value[index].likes = likes;
        homeController.airdropList.value[index].dislikes = dislikes;
        homeController.airdropDetails.value.likes = likes;
        homeController.airdropDetails.value.dislikes = dislikes;
        homeController.airdropDetails.refresh();
        homeController.airdropList.refresh();
      }
    });
  }

  dislikeAirdropPost(String postId, String userId) {
    _socket.emit("dislike_airdrop", {
      {'postId': postId, 'userId': userId}
    });
    //
    _socket.on("airdrop_post_disliked", (data) {
      List<AirdropInteraction> dislikes = List<AirdropInteraction>.from(
          data['dislikes']
              .map((dislikes) => AirdropInteraction.fromJson(dislikes)));
      List<AirdropInteraction> likes = List<AirdropInteraction>.from(
          data['likes'].map((like) => AirdropInteraction.fromJson(like)));
      int index = homeController.airdropList.value
          .indexWhere((post) => post.id == postId);

      if (index != -1) {
        homeController.airdropList.value[index].dislikes = dislikes;
        homeController.airdropList.value[index].likes = likes;
        homeController.airdropDetails.value.likes = likes;
        homeController.airdropDetails.value.dislikes = dislikes;
        homeController.airdropDetails.refresh();
        homeController.airdropList.refresh();
      }
    });
  }

  addAirdropComment(Map<String, dynamic> data) {
    _socket.emit("add_airdrop_comment", data);

    //
    _socket.on("airdrop_comment_added", (data) {
      if (data != null && data["_id"] != "") {
        homeController.isCommenting.value = false;
        getSuccessSnackBar("Comments Added Successfully");
      }
    });
  }

  likeAirdropComment(String postId, String userId) {
    _socket.emit("like_airdrop_comment", {"postId": postId, "userId": userId});
    //
    _socket.on("airdrop_comment_liked", (data) {
      List<LikeModel> likesgotten =
          List<LikeModel>.from(data["likes"].map((x) => LikeModel.fromJson(x)));
      int index = homeController.commentsAirdrop.value
          .indexWhere((post) => post.id == postId);

      if (index != -1) {
        homeController.commentsAirdrop.value[index].likes = likesgotten;
        homeController.commentsAirdrop.refresh();
      }
    });
  }

  getCommentByAirdropId(String postId) {
    _socket.emit("get_airdrop_comment", postId);
//
    _socket.on("airdrop_comment_post", (data) {
      List<CommentModel> commentsList = (data as List)
          .map((item) => CommentModel.fromJson(item as Map<String, dynamic>))
          .toList();

      homeController.commentsAirdrop.value = commentsList;
      homeController.commentsAirdrop.refresh();
      int index = homeController.airdropList.value
          .indexWhere((post) => post.id == postId);

      if (index != -1) {
        homeController.airdropList.value[index].comments =
            homeController.commentsAirdrop.length;
        homeController.airdropDetails.value.comments =
            homeController.commentsAirdrop.length;
        homeController.airdropList.refresh();
      }

      homeController.loadingComment.value = false;
    });
  }

////
  // Quiz Methods

  getMainQuizList() {
    _socket.emit("get_quiz");
    //
    _socket.on("quiz_gotten", (data) {
      List<MainQuizModel> mainquizList = (data as List)
          .map((item) => MainQuizModel.fromJson(item as Map<String, dynamic>))
          .toList();

      homeController.mainquizList.value = mainquizList;

      debugPrint(mainquizList.first.quizName.toString());

      if (homeController.mainquizList.value.isEmpty ||
          homeController.mainquizList.value == null) {
        homeController.homeloading.value = false;
        getErrorSnackBar("Not able to get airdrop");
      } else {
        homeController.homeloading.value = false;
      }
    });
  }

  getQuizQuestions(String id) {
    _socket.emit("get_questions", id);
    //
    _socket.on("quiz_questions_gotten", (data) {
      List<QuestionModel> questionsList = (data as List)
          .map((item) => QuestionModel.fromJson(item as Map<String, dynamic>))
          .toList();
      questionsList.shuffle();
      homeController.quizQuestions.value = questionsList.take(3).toList();
      if (homeController.quizQuestions.value.isEmpty ||
          homeController.quizQuestions.value == null) {
        homeController.isgettngQuestions.value = false;
        getErrorSnackBar("Not able to get questions");
      } else {
        homeController.isgettngQuestions.value = false;
      }
    });
  }

  // Social Task

  getSocialTask(int id) {
    _socket.emit("get_social_task", id);
    //
    _socket.on("social_gotten", (data) {
      List<SocialModel> tasksList = (data as List)
          .map((item) => SocialModel.fromJson(item as Map<String, dynamic>))
          .toList();
      earnController.socialTaskList.value = tasksList;
      if (earnController.socialTaskList.value.isEmpty ||
          earnController.socialTaskList.value == null) {
        earnController.earnLoading.value = false;
        getErrorSnackBar("Not able to get social tasks");
      } else {
        earnController.earnLoading.value = false;
      }
    });
  }

  updateSocialTask(Map<String, dynamic> socialData) {
    _socket.emit("update_social_task", socialData);
//
    _socket.on("social_updated", (data) {
      getSuccessSnackBarEdit("Notification", "Task completion, in review");
    });
  }

  // Shop Items Route
  getShopItems(String shopType) {
    _socket.emit("get_shop_items", shopType);
//
    _socket.on("shop_items", (data) {
      List<ShopModel> shopList = (data as List)
          .map((item) => ShopModel.fromJson(item as Map<String, dynamic>))
          .toList();
      if (shopType == "Dog") {
        shopController.dogsList.value = shopList;
        if (shopController.dogsList.value.isEmpty ||
            shopController.dogsList.value == null) {
          shopController.shopLoading.value = false;
          getErrorSnackBar("Not able to get Dog list");
        } else {
          shopController.shopLoading.value = false;
        }
      } else if (shopType == "Box") {
        shopController.boxList.value = shopList;
        if (shopController.boxList.value.isEmpty ||
            shopController.boxList.value == null) {
          shopController.shopLoading.value = false;
          getErrorSnackBar("Not able to get Dog list");
        } else {
          shopController.shopLoading.value = false;
        }
      } else {
        shopController.jarList.value = shopList;
        if (shopController.jarList.value.isEmpty ||
            shopController.jarList.value == null) {
          shopController.shopLoading.value = false;
          getErrorSnackBar("Not able to get Dog list");
        } else {
          shopController.shopLoading.value = false;
        }
      }
    });
  }

  // Notification
  storeNotificationId(Map data) async {
    _socket.emit("store_pushId", data);
//
    _socket.on("pushId_stored", (data) {
      getSuccessSnackBar("Push Id Stored Successfully");
    });
  }

  // My Profile

  getUserWithId(String id) {
    _socket.emit('get_user_Id', id);
    //
    _socket.on("user_gotten_Id", (data) {
      if (data != null && data["email"] != null) {
        profileController.viewProfileData.value = User.fromJson(data);
        profileController.profileLoading.value = false;
        // getErrorSnackBar(
        //     "Unable to get your details, check internet Connection");
      } else {
        profileController.profileLoading.value = false;
      }
    });
  }

  getUserPosts(String id) {
    _socket.emit("postById", id);
//
    _socket.on("postByIdResponse", (data) {
      List<PostForYou> postList = (data as List)
          .map((item) => PostForYou.fromJson(item as Map<String, dynamic>))
          .toList();
      profileController.userPostList.value = postList;
      if (profileController.userPostList.value.isEmpty || data == null) {
        getErrorSnackBar("No post data found");
      } else {
        getSuccessSnackBar("success");
      }
    });
  }

  getUserVideoPosts(String id) {
    _socket.emit("postVideoById", id);
//
    _socket.on("postVideoByIdResponse", (data) {
      List<PostForYou> postList = (data as List)
          .map((item) => PostForYou.fromJson(item as Map<String, dynamic>))
          .toList();
      profileController.userVideoList.value = postList;
      if (profileController.userVideoList.value.isEmpty || data == null) {
        profileController.profileLoading.value = false;
        getErrorSnackBar("No post data found");
      } else {
        profileController.profileLoading.value = false;
        getSuccessSnackBar("success");
      }
    });
  }

  // LeaderBoard Timer
  fetchLeaderBoardTimer() {
    _socket.emit("getResetDate");
//
    _socket.on("postVideoByIdResponse", (data) {
      final nextReset = DateTime.parse(data);
      profileController.startTimer(nextReset);
    });
  }

  // Wallet transaction History
}
