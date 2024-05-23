import 'package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart';
import 'package:duwith_social/Pages/Auth%20Page/services/socket_sevice.dart';
import 'package:get/get.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<AuthController>(AuthController());
  }
}
