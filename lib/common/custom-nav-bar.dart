import "package:duwith_social/Pages/Earn%20More%20Page/screens/earn_more_main.dart";
import "package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart";
import "package:duwith_social/Pages/Media%20Page/screens/media_main_page.dart";
import "package:duwith_social/Pages/Profile%20Page/screens/New_Profile_screen.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../Pages/For_You Page/screens/for_you_main.dart";
import "../Pages/Gamify Page/screens/gamify_main_screen.dart";
import "../Pages/Home Page/screens/home_screen.dart";
import "../Pages/Profile Page/controller/profile_controller.dart";
import "../utils/color.dart";

class CustomNavBarWidget extends StatefulWidget {
  const CustomNavBarWidget({super.key});

  @override
  State<CustomNavBarWidget> createState() => _CustomNavBarWidgetState();
}

class _CustomNavBarWidgetState extends State<CustomNavBarWidget> {
  HomeController homeController = HomeController.instance;
  ProfileController profileController = ProfileController.instance;

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Get.to(() => HomeScreen());
        break;
      case 1:
        Get.to(() => const ForYouMainPage());
        //Get.to(() => EarnMorePage());
        break;
      case 2:
        Get.to(() => const GamifyMainPage());
        // Get.to(() => ShoppingMainScreen());
        break;
      case 3:
        Get.to(() => EarnMorePage());
        break;
      case 4:
        homeController.mediapageisLoading.value = true;
        homeController.fetchNews();
        Get.to(() => MediaMainPage());
        homeController.mediapageisLoading.value = false;
        // Get.to(() => ProfileScreen());
        break;
      case 5:
        profileController.profileLoading.value = true;
        gotoProfile();
        break;
    }
  }

  gotoProfile() async {
    Get.to(() => NewProfileScreenPage());
    await socketService.getUserWithId(authController.userdata.value.id);
    await socketService.getUserPosts(authController.userdata.value.id);
    await Future.delayed(const Duration(seconds: 2), () {});
    profileController.profileLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSize(68),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(widthSize(10))),
      ),
      padding: EdgeInsets.only(
          // bottom: heightSize(5),
          top: heightSize(5)),
      child: Container(
        height: heightSize(68),
        width: double.infinity,
        padding: EdgeInsets.only(
          left: widthSize(15),
          right: widthSize(15),
        ),
        decoration: const BoxDecoration(
          color: backgroundColor,
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              bottomIconData("Home", Icons.grid_view_sharp,
                  homeController.selectedIndex.value == 0, () {
                setState(() {
                  homeController.selectedIndex.value = 0;
                });
                _navigateToPage(0);
              }),
              bottomIconData("For you", Icons.attach_money,
                  homeController.selectedIndex.value == 1, () {
                setState(() {
                  homeController.selectedIndex.value = 1;
                });
                _navigateToPage(1);
                homeController.fetchvideos();
              }),
              bottomIconData("Games", Icons.games_sharp,
                  homeController.selectedIndex.value == 2, () {
                setState(() {
                  homeController.selectedIndex.value = 2;
                });
                _navigateToPage(3);
                // homeController.fetchvideos();
              }),
              // GestureDetector(
              //   onTap: () {
              //     homeController.selectedIndex.value = 2;
              //     // Get.to(() => const PostContentPage());
              //     Get.to(() => EarnMorePage());
              //   },
              //   child: SizedBox(
              //     height: heightSize(50),
              //     width: widthSize(50),
              //     child: Image.asset(
              //       "assets/images/Home/postImage.png",
              //       fit: BoxFit.fill,
              //     ),
              //   ),
              // ),
              bottomIconData("Wallet", Icons.wallet,
                  homeController.selectedIndex.value == 3, () {
                setState(() {
                  homeController.selectedIndex.value = 3;
                });
                // _navigateToPage(3);
              }),
              bottomIconData("Profile", Icons.manage_accounts,
                  homeController.selectedIndex.value == 4, () {
                setState(() {
                  homeController.selectedIndex.value = 4;
                });
                _navigateToPage(5);
                // homeController.fetchvideos();
              }),
            ]),
      ),
    );
  }
}

bottomIconData(
    String iconName, IconData icon, bool isSelected, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.only(
        top: heightSize(6),
        bottom: heightSize(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: isSelected ? Color(0xFF1F969A) : textColor,
            size: heightSize(25),
          ),
          Text(
            iconName,
            style: GoogleFonts.plusJakartaSans(
              fontSize: fontSize(17),
              color: isSelected ? Color(0xFF1F969A) : textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}
