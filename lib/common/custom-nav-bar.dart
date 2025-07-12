import "package:duwith_social/Pages/Earn%20More%20Page/screens/earn_more_main.dart";
import "package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart";
import "package:duwith_social/Pages/Media%20Page/screens/media_main_page.dart";
import "package:duwith_social/Pages/Post%20page/screens/post_page.dart";
import "package:duwith_social/Pages/Profile%20Page/screens/profile_main_screen.dart";
import "package:duwith_social/Pages/Shop%20Page/screens/shop_main_screen.dart";
import "package:duwith_social/common/custom-text.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../Pages/For_You Page/screens/for_you_main.dart";
import "../Pages/Gamify Page/screens/gamify_main_screen.dart";
import "../Pages/Home Page/screens/home_screen.dart";
import "../utils/color.dart";

class CustomNavBarWidget extends StatefulWidget {
  const CustomNavBarWidget({super.key});

  @override
  State<CustomNavBarWidget> createState() => _CustomNavBarWidgetState();
}

class _CustomNavBarWidgetState extends State<CustomNavBarWidget> {
  HomeController homeController = HomeController.instance;

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Get.to(() => HomeScreen());
        break;
      case 1:
        Get.to(() => const ForYouMainPage());
        //Get.to(() => EarnMorePage());
        break;
      case 3:
        Get.to(() => const GamifyMainPage());
        // Get.to(() => ShoppingMainScreen());
        break;
      case 4:
        homeController.mediapageisLoading.value = true;
        homeController.fetchNews();
        Get.to(() => MediaMainPage());
        homeController.mediapageisLoading.value = false;
        // Get.to(() => ProfileScreen());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: heightSize(60),
        child: Container(
          height: heightSize(60),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: navbarColor2,
          ),
          padding: EdgeInsets.only(
            left: widthSize(20),
            right: widthSize(10),
            // bottom: heightSize(5),
            // top: heightSize(5)
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                bottomIconData("Home", Icons.other_houses_outlined,
                    homeController.selectedIndex.value == 0, () {
                  setState(() {
                    homeController.selectedIndex.value = 0;
                  });
                  _navigateToPage(0);
                }),
                bottomIconData("For you", Icons.pause_outlined,
                    homeController.selectedIndex.value == 1, () {
                  setState(() {
                    homeController.selectedIndex.value = 1;
                  });
                  _navigateToPage(1);
                  homeController.fetchvideos();
                }),
                GestureDetector(
                  onTap: () {
                    homeController.selectedIndex.value = 2;
                    // Get.to(() => const PostContentPage());
                    Get.to(() => EarnMorePage());
                  },
                  child: SizedBox(
                    height: heightSize(50),
                    width: widthSize(50),
                    child: Image.asset(
                      "assets/images/Home/postImage.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                bottomIconData("Gamify", Icons.games_sharp,
                    homeController.selectedIndex.value == 3, () {
                  setState(() {
                    homeController.selectedIndex.value = 3;
                  });
                  _navigateToPage(3);
                }),
                bottomIconData("Media", Icons.ondemand_video_rounded,
                    homeController.selectedIndex.value == 4, () {
                  setState(() {
                    homeController.selectedIndex.value = 4;
                  });
                  _navigateToPage(4);
                  homeController.fetchvideos();
                }),
              ]),
        ));
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
          Container(
            height: heightSize(23),
            width: widthSize(41),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: isSelected ? textColor : null,
                borderRadius: BorderRadius.all(Radius.circular(widthSize(10)))),
            child: Icon(
              icon,
              color: isSelected ? mainColor : navbarColor,
              size: heightSize(19),
            ),
          ),
          Text(
            iconName,
            style: GoogleFonts.plusJakartaSans(
              fontSize: fontSize(15),
              color: isSelected ? textColor : const Color(0xFF9291A4),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}
