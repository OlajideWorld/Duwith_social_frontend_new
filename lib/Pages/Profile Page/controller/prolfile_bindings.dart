import "package:duwith_social/Pages/Profile%20Page/controller/profile_controller.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<ProfileController>(ProfileController());
  }
}
