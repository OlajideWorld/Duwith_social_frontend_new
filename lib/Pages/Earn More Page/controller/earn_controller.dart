import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';

class EarnController extends GetxController {
  static EarnController instance = Get.find();

  RxBool isAnimating = false.obs;
  Rx<Offset> coinPosition = Offset(0, 0).obs;

  RxInt tapCount = 0.obs;
  RxList<VoidCallback> animationQueue = <VoidCallback>[].obs;
  RxDouble width = 0.0.obs;

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
}
