import 'package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart';
import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:duwith_social/Pages/Profile%20Page/controller/profile_controller.dart';
import 'package:get/get.dart';

import '../../Earn More Page/controller/earn_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<AuthController>(AuthController());
    // Get.put<HomeController>(HomeController());
    Get.put<ProfileController>(ProfileController());
    Get.lazyPut<EarnController>(() => EarnController(), fenix: true);
  }
}
