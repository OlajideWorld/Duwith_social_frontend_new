import "package:duwith_social/Pages/Shop%20Page/controller/shop_controller.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class ShopBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<ShopController>(ShopController());
  }
}
