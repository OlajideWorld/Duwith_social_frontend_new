import "package:duwith_social/Pages/Earn%20More%20Page/screens/earn_more_main.dart";
import "package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart";
import "package:duwith_social/Pages/Post%20page/screens/post_page.dart";
import "package:duwith_social/Pages/Profile%20Page/screens/profile_main_screen.dart";
import "package:duwith_social/Pages/Shop%20Page/screens/shop_main_screen.dart";
import "package:duwith_social/common/custom-text.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

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
        Get.to(() => EarnMorePage());
        break;
      case 3:
        Get.to(() => ShoppingMainScreen());
        break;
      case 4:
        Get.to(() => const ProfileScreen());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(90),
      child: Stack(children: [
        Padding(
          padding: EdgeInsets.only(
              top: heightSize(15), left: widthSize(21), right: widthSize(21)),
          child: Container(
            height: heightSize(60),
            decoration: BoxDecoration(
                color: navbarColor2,
                border: Border.all(color: faintColor),
                borderRadius: BorderRadius.all(Radius.circular(widthSize(20))),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 20, spreadRadius: 10, color: backgroundColor)
                ]),
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
                  SizedBox(
                      width: widthSize(135),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          bottomIconData("Home", Icons.other_houses_outlined,
                              homeController.selectedIndex.value == 0, () {
                            setState(() {
                              homeController.selectedIndex.value = 0;
                            });
                            _navigateToPage(0);
                          }),
                          bottomIconData("Earn", Icons.wallet,
                              homeController.selectedIndex.value == 1, () {
                            setState(() {
                              homeController.selectedIndex.value = 1;
                            });
                            _navigateToPage(1);
                          }),
                        ],
                      )),
                  SizedBox(
                      width: widthSize(135),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            bottomIconData("Shop", Icons.shopify,
                                homeController.selectedIndex.value == 3, () {
                              setState(() {
                                homeController.selectedIndex.value = 3;
                              });
                              _navigateToPage(3);
                            }),
                            bottomIconData(
                                "Profile",
                                Icons.account_circle_outlined,
                                homeController.selectedIndex.value == 4, () {
                              setState(() {
                                homeController.selectedIndex.value = 4;
                              });
                              _navigateToPage(4);
                            }),
                          ])),
                ]),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: heightSize(59),
            width: widthSize(47),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    homeController.selectedIndex.value = 2;
                    Get.to(() => const PostContentPage());
                  },
                  child: Container(
                    height: heightSize(47),
                    width: widthSize(47),
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius:
                            BorderRadius.all(Radius.circular(widthSize(20)))),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.add_circle_outline,
                      color: textColor,
                      size: widthSize(21),
                    ),
                  ),
                ),
                CText(
                  text: "Post",
                  size: 10,
                  color: homeController.selectedIndex.value == 2
                      ? textColor
                      : const Color(0xFFA3A2A2),
                  fontFamily: UsedFonts.poppins,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}

bottomIconData(
    String iconName, IconData icon, bool isSelected, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.all(widthSize(9)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: heightSize(26),
            width: widthSize(47),
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
          CText(
            text: iconName,
            size: 12,
            color: isSelected ? textColor : const Color(0xFFA3A2A2),
            fontFamily: UsedFonts.poppins,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    ),
  );
}
