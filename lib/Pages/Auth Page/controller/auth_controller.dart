import 'dart:math';

import 'package:duwith_social/Pages/Auth%20Page/services/socket_sevice.dart';
import 'package:duwith_social/Pages/Splash%20Screen/screens/onboard_main.dart';
import 'package:duwith_social/models/user_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/routes.dart';
import '../../../utils/get_user_key.dart';

SocketService socket = SocketService.instance;

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  Rx<User> userdata = User(
    id: "",
    username: "",
    useruniqueId: '',
    email: "",
    otp: "",
    profileImage: "",
    bio: "",
    gender: "",
    dateOfBirth: DateTime.now(),
    linked: false,
    phoneNumber: "",
    mainBalance: 0,
    gemspoint: 0,
    dailyPoints: 0,
    jar: Jar(points: 0, purchased: false, limit: 0, totalEarned: 0),
    following: [],
    followers: [],
    interests: [],
    socialMediaLinks:
        SocialMediaLinks(facebook: "", youtube: "", instagram: '', twitter: ''),
    blockedUsers: [],
    dog: Dog(dogName: "", dogreward: 0),
  ).obs;

  RxBool isloading = false.obs;

  RxBool? isFirstTime = false.obs;

  RxString userEmail = "".obs;
  RxString userId = "".obs;

  // Sign Up values
  RxString hintText = "".obs;
  Rx<IconData> hintIcon = Icons.account_balance.obs;
  RxInt optionUsed = 1.obs;

  // Text Controllers
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController signupOption = TextEditingController();

// Login Values
  RxBool isEmail = true.obs;
  RxString loginhint = "Email address".obs;
  Rx<IconData> loginprefixIcon = Icons.email_outlined.obs;

  final box = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    await Future.delayed(const Duration(seconds: 5), () {});
    checkStatus();
  }

  checkStatus() async {
    loadValueBool();
    if (isFirstTime!.value == true) {
      Get.to(() => const OnboardScreen());
    } else {
      // Get.to(() => SignUpScreen());
      userEmail.value = box.read(userdataEmail);
      userId.value = box.read(userdataid);
      await socket.getUserData2(userEmail.value);
      Get.toNamed(MyRoutes.homeScreen);
    }
  }

  int generateRandom6DigitNumber() {
    final random = Random();
    return 100000 +
        random.nextInt(900000); // Generates a number between 100000 and 999999
  }

  Future loadValueBool() async {
    isFirstTime!.value = box.read(firstKey) ?? true;
  }

  Future loadEmail() async {
    userEmail.value = box.read(firstKey) ?? "";
  }

  Future<void> saveCounter(var value) async {
    await GetStorage().write(firstKey, value);
  }
}
