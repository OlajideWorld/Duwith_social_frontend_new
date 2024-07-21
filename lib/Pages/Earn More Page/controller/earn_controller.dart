import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:duwith_social/models/social_task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';

class EarnController extends GetxController {
  static EarnController instance = Get.find();
  RxDouble width = 0.0.obs;

  RxBool earnLoading = false.obs;

  GlobalKey<CartIconKey> cartkey = GlobalKey<CartIconKey>();
  Function(GlobalKey)? runAddtoCartAnimation;
  RxInt cartQuantity = 0.obs;

// Social Task
  RxList<SocialModel> socialTaskList = <SocialModel>[].obs;
  RxInt type = 0.obs;

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
