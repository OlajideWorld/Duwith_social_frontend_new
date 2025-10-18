import 'dart:async';
import 'dart:math';

import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:duwith_social/Pages/Earn%20More%20Page/screens/airdrop+screen.dart';
import 'package:duwith_social/Pages/Earn%20More%20Page/screens/daily_task.dart';
import 'package:duwith_social/Pages/Earn%20More%20Page/screens/social_task_page.dart';
import 'package:duwith_social/Pages/Profile%20Page/screens/leaderboard_screen.dart';
import 'package:duwith_social/Pages/Profile%20Page/screens/streak_page.dart';
import 'package:duwith_social/models/social_task_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Auth Page/controller/auth_controller.dart';
import '../../Auth Page/services/socket_sevice.dart';
import '../../Profile Page/screens/referral_screen.dart';

AuthController authController = AuthController.instance;
SocketService socket = SocketService.instance;

class EarnController extends GetxController {
  static EarnController instance = Get.find();
  RxDouble width = 0.0.obs;

  RxString whichWthdrawal = "first".obs;
  RxString whichWthdrawal2 = "second".obs;
  TextEditingController withdrawalAmount = TextEditingController();

  RxBool earnLoading = false.obs;
  RxInt chooseType = 0.obs;
  RxInt walletType = 0.obs; // 0 for social, 1 for daily, 2 for streak
  RxInt socialOption = 0.obs;

  // Customer support
  RxInt chooseSupport = 0.obs;
  TextEditingController messageInput = TextEditingController();

  // Earnning rate
  double ratePerSec = 2; // coins earned per second
  double maxCoins = 50.0;

  late DateTime resetTime; // when counting started or was last reset
  Timer? timer;

  GlobalKey<CartIconKey> cartkey = GlobalKey<CartIconKey>();
  Function(GlobalKey)? runAddtoCartAnimation;
  RxInt cartQuantity = 0.obs;

// Social Task
  RxList<SocialModel> socialTaskList = <SocialModel>[].obs;
  RxInt type = 0.obs;

  // Daily Task
  RxList<Map> dailyTaskList = <Map>[
    {
      "image": "assets/images/Profile/profile.png",
      "task": "Read article",
      "currentValue": 0.0,
      "limitValue": 3.0,
      "isComplete": false,
      "reward": 200
    },
    {
      "image": "assets/images/Profile/profile2.png",
      "task": "Like a post",
      "currentValue": 2.0,
      "limitValue": 2.0,
      "isComplete": true,
      "reward": 500
    },
    {
      "image": "assets/images/Profile/profile3.png",
      "task": "Share a post",
      "currentValue": 1.0,
      "limitValue": 3.0,
      "isComplete": false,
      "reward": 100
    },
    {
      "image": "assets/images/Profile/profile6.png",
      "task": "Like a post",
      "currentValue": 1.0,
      "limitValue": 3.0,
      "isComplete": false,
      "reward": 250
    },
    {
      "image": "assets/images/Profile/profile4.png",
      "task": "Read article",
      "currentValue": 0.0,
      "limitValue": 3.0,
      "isComplete": false,
      "reward": 400
    },
    {
      "image": "assets/images/Profile/profile5.png",
      "task": "Share a post",
      "currentValue": 2.0,
      "limitValue": 3.0,
      "isComplete": false,
      "reward": 350
    },
  ].obs;
  RxList<Map> streakTaskList = <Map>[
    {
      "task": "3 days streak",
      "remark": "Read article",
      "currentValue": 4.0,
      "limitValue": 12.0,
      "isComplete": false,
      "reward": 200
    },
    {
      "task": "5 days streak",
      "remark": "Read article",
      "currentValue": 4.0,
      "limitValue": 9.0,
      "isComplete": false,
      "reward": 200
    },
    {
      "task": "10 days streak",
      "remark": "Read article",
      "currentValue": 2.0,
      "limitValue": 17.0,
      "isComplete": false,
      "reward": 200
    },
    {
      "task": "15 days streak",
      "remark": "Read article",
      "currentValue": 0.0,
      "limitValue": 3.0,
      "isComplete": false,
      "reward": 200
    },
    {
      "task": "3 days streak",
      "remark": "Read article",
      "currentValue": 0.0,
      "limitValue": 10.0,
      "isComplete": false,
      "reward": 200
    },
    {
      "task": "3 days streak",
      "remark": "Read article",
      "currentValue": 12.0,
      "limitValue": 32.0,
      "isComplete": false,
      "reward": 200
    },
  ].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _loadData();
    _checkIfShouldReset();
    resetTime = DateTime.now();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  // format with string
  String formatNumberWithCommas(int number) {
    String formattedNumber = NumberFormat.decimalPattern().format(number);
    return formattedNumber;
  }

  // Earn Mechanism functions
  Future<void> loadFromPrefs() async {
    earnLoading.value = true;
    final prefs = await SharedPreferences.getInstance();

    // load rate & max if you previously saved them; otherwise keep defaults:
    ratePerSec = prefs.getDouble('ratePerSec') ?? ratePerSec;
    maxCoins = prefs.getDouble('maxCoins') ?? maxCoins;

    final resetMillis = prefs.getInt('resetTime');
    if (resetMillis != null) {
      resetTime = DateTime.fromMillisecondsSinceEpoch(resetMillis);
    } else {
      // first run: set now as resetTime
      resetTime = DateTime.now();
      await prefs.setInt('resetTime', resetTime.millisecondsSinceEpoch);
    }
    earnLoading.value = false;
  }

  final List<PageEarnItem> earningPageRowDetails = [
    PageEarnItem(
      title: "9 POINTS",
      subtitle: "For every friend you invited",
      button: "Get point",
      page: ReferralScreen(),
    ),
    PageEarnItem(
      title: "100k POINTS",
      subtitle: "Be the top earner on the leaderboard and get rewarded",
      button: "Climb Now",
      page: LeaderBoardScreen(),
    ),
    // PageEarnItem(
    //   title: "0/7 Claimed",
    //   subtitle: "Claim your daily rewarded tasks",
    //   button: "Claim",
    //   page: const StreakPageScreen(),
    // ),
    PageEarnItem(
      title: "9 POINTS",
      subtitle: "For every follow you get paid",
      button: "Get point",
      page: const SocialTaskPage(),
    ),
    PageEarnItem(
      title: "Airdrops",
      subtitle: "distribute airdrops",
      button: "share",
      page: AirdropScreen(),
    ),
  ];

// Social Link task
  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> launchInBrowserView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> launchInWebView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> launchInAppWithBrowserOptions(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppBrowserView,
      browserConfiguration: const BrowserConfiguration(showTitle: true),
    )) {
      throw Exception('Could not launch $url');
    }
  }

// Open Whatsapp
  void openWhatsApp(String phoneNumber) async {
    final url =
        "https://wa.me/$phoneNumber?text=${Uri.encodeComponent("Hello, \tI am from Duwith app \tI need help with...")}";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch $url";
    }
  }

  // make a holding mechanism
  final box = GetStorage();
  final maxHolds = 3;
  final resetDuration = Duration(hours: 2);
  var holdCount = 0.obs;
  DateTime? lastHoldTime;

  void _loadData() {
    holdCount.value = box.read('holdCount') ?? 0;
    final storedTime = box.read('lastHoldTime');
    if (storedTime != null) {
      lastHoldTime = DateTime.parse(storedTime);
    }
  }

  void _saveData() {
    box.write('holdCount', holdCount.value);
    box.write('lastHoldTime', lastHoldTime?.toIso8601String());
  }

  void _checkIfShouldReset() {
    if (lastHoldTime == null) return;

    final now = DateTime.now();
    if (now.difference(lastHoldTime!) >= resetDuration) {
      holdCount.value = 0;
      lastHoldTime = null;
      _saveData();
    }
  }

  void onHoldAction() {
    _checkIfShouldReset();

    if (holdCount.value >= maxHolds) {
      Get.snackbar("Limit Reached", "You can only hold 3 times every 2 hours.");
      return;
    }

    holdCount.value++;
    lastHoldTime = DateTime.now();
    _saveData();

    // Trigger your actual action here
    _performYourFunction();
  }

  void _performYourFunction() async {
    var finalEarned = authController.userdata.value.mainBalance + 20;
    final model = {"mainBalance": finalEarned};
    await socket.updateUser(authController.userdata.value.email, model);
    // put your action here
  }
}
