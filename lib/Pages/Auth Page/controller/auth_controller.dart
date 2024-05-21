import 'package:duwith_social/Pages/Auth%20Page/screens/login_screen.dart';
import 'package:duwith_social/Pages/Auth%20Page/screens/signup_screen.dart';
import 'package:duwith_social/models/user_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  Rx<User> userdata = User(
      id: "",
      username: "",
      email: "",
      profileImage: "",
      bio: "",
      gender: "",
      dateOfBirth: DateTime.now(),
      linked: false,
      phoneNumber: "",
      mainBalance: 0.0,
      jar: Jar(points: 0, purchased: false, limit: 0, totalEarned: 0),
      following: [],
      followers: [],
      interests: [],
      socialMediaLinks: SocialMediaLinks(facebook: "", youtube: ""),
      blockedUsers: []).obs;

  RxBool? isFirstTime = false.obs;
  RxString firstKey = 'Duwith Key'.obs;
  RxString userEmail = "".obs;

  // Sign Up values
  RxString hintText = "".obs;
  Rx<IconData> hintIcon = Icons.account_balance.obs;
  RxInt optionUsed = 1.obs;

// Login Values
  RxBool isEmail = true.obs;
  RxString loginhint = "Email address".obs;
  Rx<IconData> loginprefixIcon = Icons.email_outlined.obs;

  final box = GetStorage();

  @override
  void onInit() async {
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

  checkStatus() {
    loadValueBool();
    if (isFirstTime!.value == true) {
      Get.to(() => const LoginScreen());
    } else {
      Get.to(() => SignUpScreen());
      // Get.toNamed(MyRoutes.homeScreen);
    }
  }

  Future loadValueBool() async {
    isFirstTime!.value = box.read(firstKey.value) ?? true;
  }

  Future loadEmail() async {
    userEmail.value = box.read(firstKey.value) ?? "";
  }

  Future<void> saveCounter(var value) async {
    await GetStorage().write(firstKey.value, value);
  }
}
