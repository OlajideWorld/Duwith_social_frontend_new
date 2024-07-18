import "package:duwith_social/Pages/Earn%20More%20Page/controller/earn_controller.dart";
import "package:get/get.dart";

class EarnBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<EarnController>(EarnController());
  }
}
