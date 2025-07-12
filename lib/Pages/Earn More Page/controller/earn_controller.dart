import 'dart:async';
import 'dart:math';

import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:duwith_social/models/social_task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EarnController extends GetxController {
  static EarnController instance = Get.find();
  RxDouble width = 0.0.obs;

  RxBool earnLoading = false.obs;
  RxInt chooseType = 0.obs;
  RxInt walletType = 0.obs; // 0 for social, 1 for daily, 2 for streak

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

  final earningPageRowDetails = [
    {
      "title": "9 POINTS",
      "subtitle": "For every friend you invited",
      "button": "Get point",
    },
    {
      "title": "100k POINTS",
      "subtitle": "Be the top earner on the leaderboard and get rewqrded",
      "button": "Climb Now",
    },
    {
      "title": "0/7 Claimed",
      "subtitle": "Claim your daily rewarded tasks ",
      "button": "Claim",
    },
    {
      "title": "9 POINTS",
      "subtitle": "For every friend you invited",
      "button": "Get point",
    },
    {
      "title": "0/7 Claimed",
      "subtitle": "Claim your daily rewarded tasks ",
      "button": "Claim",
    },
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
}
