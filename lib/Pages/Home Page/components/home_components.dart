import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color.dart';
import '../../../utils/sizes.dart';

HomeController homeController = HomeController.instance;

selectHomeView(BuildContext context, double width) {
  return Container(
    width: width,
    height: heightSize(30),
    // padding:
    //     EdgeInsets.symmetric(horizontal: widthSize(6), vertical: heightSize(6)),
    decoration: const BoxDecoration(
      color: backgroundColor,
    ),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // For You sections
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                homeController.viewBarOption.value = 0;
                homeController.fetchPosts();
              },
              child: Container(
                // width: widthSize(176),
                height: heightSize(30),

                decoration: const BoxDecoration(color: backgroundColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Feed',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: homeController.viewBarOption.value == 0
                            ? const Color(0xFFECECEC)
                            : textColor3,
                      fontSize: fontSize(15),
                        fontWeight: homeController.viewBarOption.value == 0
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                    // SizedBox(height: heightSize(7)),
                    Divider(
                        height: heightSize(3),
                        thickness: 2,
                        color: homeController.viewBarOption.value == 0
                            ? const Color(0xFFECECEC)
                            : faintColor),
                  ],
                ),
              ),
            ),
          ),

          // My Voice sections
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                homeController.viewBarOption.value = 1;
                homeController.fetchvideos();
              },
              child: Container(
                height: heightSize(30),
                decoration: const BoxDecoration(color: backgroundColor),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: heightSize(18),
                      width: widthSize(56),
                      child: Image.asset(
                        'assets/images/Home/myvoice.png',
                        fit: BoxFit.contain,
                        // color: homeController.viewBarOption.value == 1
                        //     ? const Color(0xFFECECEC)
                        //     : textColor3,
                      ),
                    ),
                    // SizedBox(height: heightSize(7)),
                    Divider(
                        height: heightSize(3),
                        thickness: 2,
                        color: homeController.viewBarOption.value == 1
                            ? const Color(0xFFECECEC)
                            : faintColor),
                  ],
                ),
              ),
            ),
          ),

          // Forum

          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                homeController.viewBarOption.value = 2;
                homeController.fetchNews();
              },
              child: Container(
                height: heightSize(30),
                decoration: const BoxDecoration(color: backgroundColor),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Forum',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: homeController.viewBarOption.value == 2
                            ? const Color(0xFFECECEC)
                            : textColor3,
                        fontSize: fontSize(15),
                        fontWeight: homeController.viewBarOption.value == 2
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                    // SizedBox(height: heightSize(7)),
                    Divider(
                        height: heightSize(3),
                        thickness: 2,
                        color: homeController.viewBarOption.value == 2
                            ? const Color(0xFFECECEC)
                            : faintColor),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                homeController.viewBarOption.value = 4;
                homeController.fetchMainQuizList();
              },
              child: Container(
                height: heightSize(30),
                decoration: const BoxDecoration(color: backgroundColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quiz',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: homeController.viewBarOption.value == 4
                            ? const Color(0xFFECECEC)
                            : textColor3,
                        fontSize: fontSize(15),
                        fontWeight: homeController.viewBarOption.value == 4
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                    // SizedBox(height: heightSize(7)),
                    Divider(
                        height: heightSize(3),
                        thickness: 2,
                        color: homeController.viewBarOption.value == 4
                            ? const Color(0xFFECECEC)
                            : faintColor),
                  ],
                ),
              ),
            ),
          ),

// Airdrop Sections
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                homeController.viewBarOption.value = 3;
                homeController.fetchAirdrops();
              },
              child: Container(
                height: heightSize(30),
                decoration: const BoxDecoration(color: backgroundColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Campaign',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: homeController.viewBarOption.value == 3
                            ? const Color(0xFFECECEC)
                            : textColor3,
                        fontSize: fontSize(15),
                        fontWeight: homeController.viewBarOption.value == 3
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                    // SizedBox(height: heightSize(7)),
                    Divider(
                        height: heightSize(3),
                        thickness: 2,
                        color: homeController.viewBarOption.value == 3
                            ? const Color(0xFFECECEC)
                            : faintColor),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: widthSize(5))
        ]),
  );
}
