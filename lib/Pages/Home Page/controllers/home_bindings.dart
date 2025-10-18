import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../Earn More Page/controller/earn_controller.dart';
import '../../Profile Page/controller/profile_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<HomeController>(HomeController());
  }
}
