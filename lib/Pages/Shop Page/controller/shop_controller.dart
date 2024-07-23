// ignore_for_file: invalid_use_of_protected_member

import "package:duwith_social/common/getxmessage.dart";
import "package:duwith_social/models/games_model.dart";
import "package:flutter/material.dart";

import "package:get/get.dart";

import "../../Auth Page/services/socket_sevice.dart";

SocketService socketService = SocketService.instance;

class ShopController extends GetxController {
  static ShopController instance = Get.find();

  RxBool shopLoading = false.obs;

  RxList<ShopModel> dogsList = <ShopModel>[].obs;

  RxList<ShopModel> jarList = <ShopModel>[].obs;

  RxList<ShopModel> boxList = <ShopModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    await fetchDogsList();
  }

  fetchDogsList() async {
    shopLoading.value = true;
    await socketService.getShopItems("Dog");
    await Future.delayed(const Duration(seconds: 2), () {});
    if (dogsList.value.isEmpty) {
      shopLoading.value = false;
      getErrorSnackBar("Unable to get the Dogs List, try again later");
    } else {
      shopLoading.value = false;
    }
  }

  fetchJarsList() async {
    shopLoading.value = true;
    await socketService.getShopItems("Jar");
    await Future.delayed(const Duration(seconds: 2), () {});
    if (jarList.value.isEmpty) {
      shopLoading.value = false;
      getErrorSnackBar("Unable to get the Dogs List, try again later");
    } else {
      shopLoading.value = false;
    }
  }

  fetchBoxList() async {
    shopLoading.value = true;
    await socketService.getShopItems("Box");
    await Future.delayed(const Duration(seconds: 2), () {});
    if (boxList.value.isEmpty) {
      shopLoading.value = false;
      getErrorSnackBar("Unable to get the Dogs List, try again later");
    } else {
      shopLoading.value = false;
    }
  }
}
