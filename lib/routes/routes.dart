import 'package:duwith_social/Pages/Auth%20Page/screens/login_screen.dart';
import 'package:duwith_social/Pages/Home%20Page/controllers/home_bindings.dart';
import 'package:duwith_social/Pages/Home%20Page/screens/home_screen.dart';
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
}

class Pages {
  static const splashscreen = MyRoutes.splashScreen;
  static final routes = [
    GetPage(name: MyRoutes.splashScreen, page: () => const SplashScreen()),
    GetPage(name: MyRoutes.loginScreen, page: () => const LoginScreen()),
    GetPage(
        name: MyRoutes.homeScreen,
        page: () => HomeScreen(),
        binding: HomeBindings())
  ];
}
