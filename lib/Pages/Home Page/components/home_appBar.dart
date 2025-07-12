// ignore_for_file: file_names

import 'package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart';
import 'package:duwith_social/Pages/Chat%20Page/screens/chat_history_page.dart';
import 'package:duwith_social/Pages/Home%20Page/screens/search_screen.dart';
import 'package:duwith_social/Pages/Post%20page/screens/post_page.dart';
import 'package:duwith_social/Pages/Wallet%20Page/screens/wallet_screen.dart';
import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

AuthController authController = AuthController.instance;
HomeController homeController = HomeController.instance;

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
                GestureDetector(
                  onTap: () => Get.to(() => PostContentPage()),
                  child: SizedBox(
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
                ),
                GestureDetector(
                  onTap: () => Get.to(() => SearchScreen()),
                  child: SizedBox(
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
                ),
                GestureDetector(
                  onTap: () => Get.to(() => const ChatHistoryPage()),
                  child: SizedBox(
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
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

writeOpinionsPostPage(double width) {
  return Container(
    height: heightSize(150),
    width: width,
    decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(widthSize(20)))),
    child: TextField(
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          color: const Color(0xFFB4B4B4),
          fontSize: fontSize(14)),
      maxLines: 5,
      controller: homeController.postText,
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
        hintText: "Create Your Opinion",
        hintStyle: GoogleFonts.poppins(
            color: Color(0xFF918F99),
            fontSize: fontSize(12),
            fontWeight: FontWeight.w400),
        filled: true,
        fillColor: backgroundColor,
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: backgroundColor),
            borderRadius: BorderRadius.circular(16)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: backgroundColor),
            borderRadius: BorderRadius.circular(16)),
        contentPadding: EdgeInsets.only(
            left: widthSize(15),
            top: heightSize(4),
            right: widthSize(4),
            bottom: heightSize(5)),
      ),
    ),
  );
}
