import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:duwith_social/Pages/Shop%20Page/screens/upgrade_screen.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/custom-text.dart';
import '../../../utils/color.dart';
import '../controller/shop_controller.dart';

HomeController homeController = HomeController.instance;
ShopController shopController = ShopController.instance;

shopAppBar() {
  return Padding(
    padding: EdgeInsets.only(left: widthSize(20)),
    child: SizedBox(
      height: heightSize(30),
      width: widthSize(240),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () async {
              homeController.shoptype.value = 0;
              await shopController.fetchDogsList();
            },
            child: Container(
              height: heightSize(28),
              width: widthSize(57),
              decoration: BoxDecoration(
                color: homeController.shoptype.value == 0
                    ? const Color(0xFF151B2E)
                    : backgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(widthSize(10)),
                ),
              ),
              child: Center(
                child: CText(
                  text: "Dog",
                  size: 13,
                  fontFamily: UsedFonts.poppins,
                  fontWeight: FontWeight.w500,
                  color: homeController.shoptype.value == 0
                      ? textColor
                      : const Color(0xFFB5B2B2),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              homeController.shoptype.value = 1;
              await shopController.fetchJarsList();
            },
            child: Container(
              height: heightSize(28),
              width: widthSize(52),
              decoration: BoxDecoration(
                color: homeController.shoptype.value == 1
                    ? const Color(0xFF151B2E)
                    : backgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(widthSize(10)),
                ),
              ),
              child: Center(
                child: CText(
                  text: "Jar",
                  size: 13,
                  fontFamily: UsedFonts.poppins,
                  fontWeight: FontWeight.w500,
                  color: homeController.shoptype.value == 1
                      ? textColor
                      : const Color(0xFFB5B2B2),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              homeController.shoptype.value = 2;
              await shopController.fetchBoxList();
            },
            child: Container(
              height: heightSize(28),
              width: widthSize(130),
              decoration: BoxDecoration(
                color: homeController.shoptype.value == 2
                    ? const Color(0xFF151B2E)
                    : backgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(widthSize(10)),
                ),
              ),
              child: Center(
                child: CText(
                  text: "Hidden treasure",
                  size: 13,
                  fontFamily: UsedFonts.poppins,
                  fontWeight: FontWeight.w500,
                  color: homeController.shoptype.value == 2
                      ? textColor
                      : const Color(0xFFB5B2B2),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

shoptypeAdvert(
    {required Color color1,
    required Color color2,
    required Color textColorUsed,
    required String type,
    required String image,
    required BuildContext context}) {
  return GestureDetector(
    onTap: () => Get.to(() => const ShopUpgradeScreen()),
    child: Container(
      height: heightSize(80),
      padding: EdgeInsets.symmetric(
        vertical: heightSize(10),
        horizontal: widthSize(31),
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [color1, color2]),
          borderRadius: BorderRadius.all(Radius.circular(widthSize(15)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CText(
                  text: "Upgrade $type",
                  size: 15,
                  fontFamily: UsedFonts.rammetto,
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
                CText(
                  text: "Increase earnings",
                  size: 8,
                  fontFamily: UsedFonts.poppins,
                  fontWeight: FontWeight.w600,
                  color: textColorUsed,
                ),
                buttonsWidget(context, heightSize(22), widthSize(74),
                    "Check in", textColor, 10, () {}, false, Colors.black)
              ],
            ),
          ),
          SizedBox(
            height: heightSize(118),
            child: Image.asset(image, fit: BoxFit.fitHeight),
          )
        ],
      ),
    ),
  );
}

selectQuestions() {
  return Padding(
    padding: EdgeInsets.only(left: widthSize(20)),
    child: SizedBox(
      height: heightSize(40),
      width: widthSize(100),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  homeController.viewprofileslide.value = 0;
                },
                child: Container(
                  height: heightSize(40),
                  width: widthSize(29),
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'FAQ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: homeController.viewprofileslide.value == 0
                              ? const Color(0xFFECECEC)
                              : textColor3,
                          fontSize: fontSize(12),
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Divider(
                          height: heightSize(3),
                          thickness: 2,
                          color: homeController.viewprofileslide.value == 0
                              ? textColor
                              : backgroundColor),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: widthSize(16)),
            //
            Expanded(
              child: GestureDetector(
                onTap: () {
                  homeController.viewprofileslide.value = 1;
                },
                child: Container(
                  height: heightSize(40),
                  width: widthSize(79),
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Email support',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: homeController.viewprofileslide.value == 1
                              ? const Color(0xFFECECEC)
                              : textColor3,
                          fontSize: fontSize(12),
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Divider(
                          height: heightSize(3),
                          thickness: 2,
                          color: homeController.viewprofileslide.value == 1
                              ? const Color(0xFFECECEC)
                              : backgroundColor),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: widthSize(16)),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  homeController.viewprofileslide.value = 2;
                },
                child: Container(
                  height: heightSize(40),
                  width: widthSize(60),
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Whatsapp',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: homeController.viewprofileslide.value == 2
                              ? const Color(0xFFECECEC)
                              : textColor3,
                          fontSize: fontSize(12),
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Divider(
                          height: heightSize(3),
                          thickness: 2,
                          color: homeController.viewprofileslide.value == 2
                              ? const Color(0xFFECECEC)
                              : backgroundColor),
                    ],
                  ),
                ),
              ),
            ),
          ]),
    ),
  );
}
