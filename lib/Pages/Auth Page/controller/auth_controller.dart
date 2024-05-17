import 'package:duwith_social/Pages/Auth%20Page/screens/login_screen.dart';
import 'package:duwith_social/Pages/Auth%20Page/screens/signup_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  static var instance = Get.find();

  RxBool? isFirstTime = false.obs;
  RxString firstKey = 'Duwith Key'.obs;

  final box = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    await Future.delayed(const Duration(seconds: 5), () {});
  }

  checkStatus() {
    loadValue();
    if (isFirstTime!.value == true) {
      Get.to(() => const LoginScreen());
    } else {
      Get.to(() => const SignUpScreen());
    }
  }

  Future loadValue() async {
    isFirstTime!.value = box.read(firstKey.value) ?? true;
  }

  Future<void> saveCounter() async {
    await GetStorage().write(firstKey.value, isFirstTime!.value);
  }
}
