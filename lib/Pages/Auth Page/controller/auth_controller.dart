import 'package:duwith_social/Pages/Auth%20Page/screens/login_screen.dart';
import 'package:duwith_social/Pages/Auth%20Page/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  RxBool? isFirstTime = false.obs;
  RxString firstKey = 'Duwith Key'.obs;

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
    loadValue();
    if (isFirstTime!.value == true) {
      Get.to(() => const LoginScreen());
    } else {
      Get.to(() => SignUpScreen());
    }
  }

  Future loadValue() async {
    isFirstTime!.value = box.read(firstKey.value) ?? true;
  }

  Future<void> saveCounter() async {
    await GetStorage().write(firstKey.value, isFirstTime!.value);
  }
}
