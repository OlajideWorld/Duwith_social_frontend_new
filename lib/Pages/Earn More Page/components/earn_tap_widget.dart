// ignore_for_file: must_be_immutable

import 'package:duwith_social/Pages/Earn%20More%20Page/components/spin_wheel_screen.dart';
import 'package:duwith_social/Pages/Earn%20More%20Page/controller/earn_controller.dart';
import 'package:duwith_social/Pages/Earn%20More%20Page/screens/games_screen.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/custom-text.dart';
import '../../../utils/color.dart';
import '../../Auth Page/controller/auth_controller.dart';
import '../../Profile Page/screens/streak_page.dart';
import '../../Profile Page/screens/view_myprofile_screen.dart';

EarnController earnController = EarnController.instance;
AuthController authController = AuthController.instance;

earnMoreExtraWidget(Color box1, String headline, String body, String tagline,
    String image, String namegiven) {
  return Expanded(
    child: GestureDetector(
      onTap: () => Get.to(() => GamesScreen(title: namegiven)),
      child: Container(
        height: heightSize(100),
        width: widthSize(174),
        decoration: BoxDecoration(
          color: const Color(0xFF141931),
          border: Border.all(color: Color(0xFF212746)),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(widthSize(10)),
              bottomLeft: Radius.circular(widthSize(10)),
              bottomRight: Radius.circular(widthSize(10))),
        ),
        child: Column(
          children: [
            Container(
              height: heightSize(22),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: box1,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(widthSize(10)),
                    bottomLeft: Radius.circular(widthSize(10)),
                  )),
              child: CText(
                text: headline,
                size: 12,
                fontFamily: UsedFonts.poppins,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFDAF7F9),
              ),
            ),
            SizedBox(height: heightSize(10)),
            Padding(
              padding: EdgeInsets.only(left: widthSize(7)),
              child: SizedBox(
                height: heightSize(32),
                child: Row(
                  children: [
                    SizedBox(
                      height: heightSize(39),
                      width: widthSize(34),
                      child: Image.asset(
                        image,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: widthSize(6),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CText(
                          text: body,
                          size: 14,
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w500,
                          color: textColor,
                        ),
                        CText(
                          text: tagline,
                          size: 10,
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF6D738F),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

// earnspinActivity(double width) {
//   return SmartDialog.show(builder: (context) {
//     return SpinWheelScreen(
//       width: width,
//     );
//   });
// }

earnMoreMainPageTopBar() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: widthSize(10)),
    child: SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.to(() => ViewUserProfileScreen(isyou: true)),
            child: Container(
              height: heightSize(40),
              width: widthSize(40),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(0xFF222631),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: CText(
                text: authController.userdata.value.username != null &&
                        authController.userdata.value.username.trim().isNotEmpty
                    ? authController.userdata.value.username.trim()[0]
                    : '',
                size: fontSize(23),
                fontFamily: UsedFonts.archivo,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFFA2CD7),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Get.to(() => const StreakPageScreen()),
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: heightSize(10), horizontal: widthSize(8)),
              decoration: BoxDecoration(
                // border: Border.all(color: Color.fromARGB(255, 60, 60, 60)),
                borderRadius: BorderRadius.all(Radius.circular(widthSize(10))),
                color: Color.fromARGB(109, 79, 78, 78),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/Earn/thunder2.png",
                    height: heightSize(17),
                    width: widthSize(15),
                  ),
                  Text(
                    "7 day Streak",
                    style: GoogleFonts.poppins(
                      fontSize: fontSize(12),
                      fontWeight: FontWeight.w400,
                      color: textColor,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
