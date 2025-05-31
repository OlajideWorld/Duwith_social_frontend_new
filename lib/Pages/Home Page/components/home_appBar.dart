// ignore_for_file: file_names

import 'package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart';
import 'package:duwith_social/Pages/Home%20Page/screens/search_screen.dart';
import 'package:duwith_social/Pages/Wallet%20Page/screens/wallet_screen.dart';
import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AuthController authController = AuthController.instance;

homeAppBar(double width) {
  return Padding(
    padding: EdgeInsets.only(left: widthSize(18), right: widthSize(30)),
    child: SizedBox(
      height: heightSize(44),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            // onTap: () => Get.to(() => const WalletScreen()),
            child: Container(
              height: heightSize(40),
              width: widthSize(40),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(0xFF222631),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: CText(
                text: authController.userdata.value.username.trim()[0],
                size: fontSize(23),
                fontFamily: UsedFonts.archivo,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFFA2CD7),
              ),
            ),
          ),
          SizedBox(
            height: heightSize(30),
            width: widthSize(100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // GestureDetector(
                //   onTap: () => Get.to(() => const SearchScreen()),
                //   child: Icon(
                //     Icons.search,
                //     size: heightSize(20),
                //     color: textColor,
                //   ),
                // ),
                // Icon(
                //   Icons.mark_unread_chat_alt_rounded,
                //   size: heightSize(20),
                //   color: textColor,
                // )
                SizedBox(
                  height: heightSize(25),
                  width: widthSize(25),
                  child: Image.asset(
                    'assets/images/Home/add-square.png',
                    fit: BoxFit.contain,
                    // color: homeController.viewBarOption.value == 1
                    //     ? const Color(0xFFECECEC)
                    //     : textColor3,
                  ),
                ),
                SizedBox(
                  height: heightSize(25),
                  width: widthSize(25),
                  child: Image.asset(
                    'assets/images/Home/searchglass.png',
                    fit: BoxFit.contain,
                    // color: homeController.viewBarOption.value == 1
                    //     ? const Color(0xFFECECEC)
                    //     : textColor3,
                  ),
                ),
                SizedBox(
                  height: heightSize(25),
                  width: widthSize(25),
                  child: Image.asset(
                    'assets/images/Home/message-2.png',
                    fit: BoxFit.contain,
                    // color: homeController.viewBarOption.value == 1
                    //     ? const Color(0xFFECECEC)
                    //     : textColor3,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
