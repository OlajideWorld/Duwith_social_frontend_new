// ignore_for_file: invalid_use_of_protected_member

import 'package:cloudinary/cloudinary.dart';
import 'package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart';
import 'package:duwith_social/Pages/Post%20page/components/post_content_widget.dart';
import 'package:duwith_social/Services/Ads%20Service/start_app_manager.dart';
import 'package:duwith_social/common/getxmessage.dart';
import 'package:duwith_social/models/games_model.dart';
import 'package:duwith_social/models/main_post_model.dart';
import 'package:duwith_social/models/news_models.dart';
import 'package:duwith_social/models/transaction_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_picker/image_picker.dart';

import 'package:intl/intl.dart';
import 'package:startapp_sdk/startapp.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

import '../../../Services/Ads Service/admob_manager.dart';
import '../../../Services/Ads Service/unity_ads_manager.dart';
import '../../../models/post-data.dart';
import '../../Auth Page/services/socket_sevice.dart';

SocketService socketService = SocketService.instance;
AuthController authController = AuthController.instance;

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  var startAppSdk = StartAppSdk();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startAppSdk.setTestAdsEnabled(true);
    UnityAds.init(
      gameId: AdManager.gameId,
      testMode: true,
      onComplete: () {
        debugPrint('Initialization Complete');
        _loadAds();
      },
      onFailed: (error, message) =>
          debugPrint('Initialization Failed: $error $message'),
    );
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    await StartAppAdsClass().loadBannerAds();
    await AdmobAdsClass().loadBannerAd(100, 100);
    await fetchPosts();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    email.dispose();
    amount.dispose();
    bankName.dispose();
    accountnumber.dispose();
    postCaption.dispose();
  }

// Posts Data
  RxInt limit = 10.obs;
  RxInt page = 0.obs;

  // start App Ads
  StartAppBannerAd? startBannerAd;
  StartAppInterstitialAd? startInterstitialAd;
  StartAppRewardedVideoAd? startRewardedVideoAd;

// Admob
  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;
  RewardedAd? rewardedAd;
  RewardedInterstitialAd? rewardedInterstitialAd;

// Unity Ads
  RxMap<String, bool> placements = {
    AdManager.interstitialVideoAdPlacementId: false,
    AdManager.rewardedVideoAdPlacementId: false,
    AdManager.bannerAdPlacementId: false
  }.obs;

  //
  RxBool homeloading = true.obs;
  RxBool continueLoading = false.obs;

  RxInt viewBarOption = 0.obs;
  RxInt viewprofileslide = 0.obs;
  RxInt selectedWithdrawal = 0.obs;
  RxInt selectedIndex = 0.obs;
  RxInt shoptype = 0.obs;

  // WIthdrawal Values
  TextEditingController email = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController accountnumber = TextEditingController();

  // Comments
  RxList<Comment> comments = <Comment>[].obs;

  // Posts objects
  RxList<String> postcategories = <String>[].obs;
  TextEditingController postCaption = TextEditingController();
  final commentingOpton = ValueNotifier<bool>(true);
  final showCaption = ValueNotifier<bool>(true);
  final hideLike = ValueNotifier<bool>(true);
  RxString mediaType = "image".obs;

  RxList<Map> uploadedImageUrl = <Map>[].obs;

  // Posts
  RxList<PostForYou> postList = <PostForYou>[].obs;
  RxList<PostForYou> postListVideo = <PostForYou>[].obs;
  RxList<NewsUpdate> newsUpdateList = <NewsUpdate>[].obs;
  RxList<NewsUpdate> airdropList = <NewsUpdate>[].obs;

  final List<String> allInterests = [
    'Technology',
    'Sports',
    'Music',
    'Movies',
    "Nature",
    "Travels",
    "Pest & Animals",
    "Events",
    "Quotes",
    "Books",
    "Music",
    "Tech",
    "Gadgets",
    "Fitness",
    "Adventures",
    "Food",
    "Fashion",
    "Lifestyles",
    "Arts"
    // Add more interests
  ];

  fetchPosts() async {
    homeloading.value = true;
    await socket.getUserData2(authController.userEmail.value);

    var data = {
      'userId': authController.userId.value,
      'following': authController.userdata.value.following, // Add relevant data
      'interests': [
        'Technology',
        'Sports',
        'Music',
        'Movies',
        "Nature",
        "Travels",
        "Pest & Animals",
        "Events",
        "Quotes",
        "Books",
        "Music",
        "Tech",
        "Gadgets",
        "Fitness",
        "Adventures",
        "Food",
        "Fashion",
        "Lifestyles",
        "Arts"
      ], // Add relevant data
      // 'interests': authController.userdata.value.interests,
      'sortBy': 'createdAt',
      'skip': page.value * limit.value,
      'limit': limit.value,
    };
    await socket.getPost(data);
    await Future.delayed(const Duration(seconds: 2), () {});
    if (postList.value == []) {
      getErrorSnackBar("No post Available now");
    } else {
      homeloading.value = false;
    }
  }

  fetchvideos() async {
    homeloading.value = true;
    await socket.getUserData2(authController.userEmail.value);
    await Future.delayed(const Duration(seconds: 2), () {});
    if (authController.userdata.value.email == "") {
      getErrorSnackBar("Unable to get your details, check internet Connection");
    } else {
      var data = {
        'userId': authController.userId.value,
        'following':
            authController.userdata.value.following, // Add relevant data
        'interests': [
          'Technology',
          'Sports',
          'Music',
          'Movies',
          "Nature",
          "Travels",
          "Pest & Animals",
          "Events",
          "Quotes",
          "Books",
          "Music",
          "Tech",
          "Gadgets",
          "Fitness",
          "Adventures",
          "Food",
          "Fashion",
          "Lifestyles",
          "Arts"
        ], // Add relevant data
        // 'interests': authController.userdata.value.interests,
        'sortBy': 'createdAt',
        'skip': page.value * limit.value,
        'limit': limit.value,
      };
      await socket.getVideos(data);
      await Future.delayed(const Duration(seconds: 2), () {});
      if (postList.value == []) {
        getErrorSnackBar("No post Available now");
      } else {
        homeloading.value = false;
      }
    }
  }

  fetchNews() async {
    homeloading.value = true;
    var data = {
      'sortBy': 'createdAt',
      'skip': page.value * limit.value,
      'limit': limit.value,
    };
    await socket.getNewsList(data);
    if (newsUpdateList.value == []) {
      getErrorSnackBar("No post Available now");
    } else {
      homeloading.value = false;
    }
  }

  fetchAirdrops() async {
    homeloading.value = true;
    var data = {
      'sortBy': 'createdAt',
      'skip': page.value * limit.value,
      'limit': limit.value,
    };
    await socket.getAirdropList(data);
    await Future.delayed(const Duration(seconds: 5), () {});
    if (newsUpdateList.value == []) {
      getErrorSnackBar("No post Available now");
    } else {
      homeloading.value = false;
    }
  }

  _loadAds() {
    for (var placementId in placements.keys) {
      loadAd(placementId);
    }
  }

  void loadAd(String placementId) {
    UnityAds.load(
      placementId: placementId,
      onComplete: (placementId) {
        debugPrint('Load Complete $placementId');

        placements.value[placementId] = true;
      },
      onFailed: (placementId, error, message) =>
          debugPrint('Load Failed $placementId: $error $message'),
    );
  }

  // showBannerAds
  //  UnityBannerAd(
  //             placementId: AdManager.bannerAdPlacementId,
  //             onLoad: (placementId) => print('Banner loaded: $placementId'),
  //             onClick: (placementId) => print('Banner clicked: $placementId'),
  //             onShown: (placementId) => print('Banner shown: $placementId'),
  //             onFailed: (placementId, error, message) =>
  //                 print('Banner Ad $placementId failed: $error $message'),
  //           )

  void showAd(String placementId) {
    placements.value[placementId] = false;

    UnityAds.showVideoAd(
      placementId: placementId,
      onComplete: (placementId) {
        debugPrint('Video Ad $placementId completed');
        loadAd(placementId);
      },
      onFailed: (placementId, error, message) {
        debugPrint('Video Ad $placementId failed: $error $message');
        loadAd(placementId);
      },
      onStart: (placementId) => debugPrint('Video Ad $placementId started'),
      onClick: (placementId) => debugPrint('Video Ad $placementId click'),
      onSkipped: (placementId) {
        debugPrint('Video Ad $placementId skipped');
        loadAd(placementId);
      },
    );
  }

  void toggleCategorySelection(String item) {
    if (postcategories.contains(item)) {
      postcategories.remove(item);
    } else {
      postcategories.add(item);
    }
  }

  String engagementShortened(int number) {
    if (number >= 1000000000) {
      return '${(number / 1000000000).toStringAsFixed(1)}B';
    } else if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}k';
    } else {
      return number.toString();
    }
  }

  uploadImages(List<XFile> images) async {
    try {
      for (var image in images) {
        final response = await cloudinary.upload(
            file: image.path, resourceType: CloudinaryResourceType.image);

        if (response.isSuccessful) {
          final image = {"type": "image", "url": response.secureUrl};
          uploadedImageUrl.add(image);
        } else {
          getErrorSnackBar("Image upload was unsuccesful");
          return false;
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  uploadVideos(List<XFile> images) async {
    try {
      for (var image in images) {
        final response = await cloudinary.upload(
            file: image.path, resourceType: CloudinaryResourceType.video);

        if (response.isSuccessful) {
          final image = {"type": "video", "url": response.secureUrl};
          uploadedImageUrl.add(image);
        } else {
          getErrorSnackBar("Video upload was unsuccesful");
          return false;
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  String formatNumberWithCommasWithDouble(double number) {
    String formattedNumber = NumberFormat.decimalPattern().format(number);
    return formattedNumber;
  }

  final cloudinary = Cloudinary.signedConfig(
    apiKey: "835465682576292",
    apiSecret: "8PE5JLnAugyOstV3EPuE7xrmcbQ",
    cloudName: "dm4eqhtyx",
  );
}
