import 'package:duwith_social/Pages/Auth%20Page/screens/login_screen.dart';
import 'package:duwith_social/Pages/Earn%20More%20Page/controller/earn_binding.dart';
import 'package:duwith_social/Pages/Home%20Page/controllers/home_bindings.dart';
import 'package:duwith_social/Pages/Home%20Page/screens/home_screen.dart';
import 'package:duwith_social/Pages/Profile%20Page/controller/prolfile_bindings.dart';
import 'package:duwith_social/Pages/Shop%20Page/controller/shop_bindings.dart';
import 'package:duwith_social/Pages/Splash%20Screen/screens/onboard_main.dart';
import 'package:duwith_social/Pages/Splash%20Screen/screens/splash_screen.dart';
import 'package:get/get.dart';

class MyRoutes {
  static const splashScreen = "/splashScreen";
  static const homeScreen = "/homeScreen";
  static const signinScreen = "/signinScreen";
  static const registrationScreen = "/registration";
  static const activityScreen = "/activityScreen";
  static const loginScreen = "/loginScreen";
  static const customNavBar = "/customNavBar";
  static const savingsScreen = "/savingsScreen";
  static const loadingScreen = "/loading";
  static const onboardScreeen = "/onboard";
}

class Pages {
  static const splashscreen = MyRoutes.splashScreen;
  static final routes = [
    GetPage(name: MyRoutes.splashScreen, page: () => const SplashScreen()),
    GetPage(name: MyRoutes.loginScreen, page: () => LoginScreen()),
    GetPage(name: MyRoutes.onboardScreeen, page: () => const OnboardScreen()),
    GetPage(name: MyRoutes.homeScreen, page: () => HomeScreen(), bindings: [
      HomeBindings(),
      EarnBinding(),
      ShopBindings(),
      ProfileBindings()
    ])
  ];
}
