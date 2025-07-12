import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../utils/color.dart";
import "../../../utils/sizes.dart";
import "../../Home Page/controllers/home_controller.dart";

HomeController homeController = HomeController.instance;

mediaPageSelectOption(BuildContext context, double width) {
  return Container(
      width: width,
      height: heightSize(40),
      padding: EdgeInsets.symmetric(
          horizontal: widthSize(6), vertical: heightSize(6)),
      decoration: const BoxDecoration(
        color: backgroundColor,
      ),
      child: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Popular sections
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  homeController.mediaOption.value = 0;
                },
                child: Container(
                  // width: widthSize(176),
                  height: heightSize(30),

                  decoration: const BoxDecoration(color: backgroundColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: homeController.mediaOption.value == 0
                              ? const Color(0xFFECECEC)
                              : textColor3,
                          fontSize: fontSize(15),
                          fontWeight: homeController.mediaOption.value == 0
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ),
                      // SizedBox(height: heightSize(7)),
                      Divider(
                          height: heightSize(3),
                          thickness: 2,
                          color: homeController.mediaOption.value == 0
                              ? const Color(0xFFECECEC)
                              : faintColor),
                    ],
                  ),
                ),
              ),
            ),

            // Anime

            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  homeController.mediaOption.value = 1;
                },
                child: Container(
                  // width: widthSize(176),
                  height: heightSize(30),

                  decoration: const BoxDecoration(color: backgroundColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Anime',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: homeController.mediaOption.value == 1
                              ? const Color(0xFFECECEC)
                              : textColor3,
                          fontSize: fontSize(15),
                          fontWeight: homeController.mediaOption.value == 1
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ),
                      // SizedBox(height: heightSize(7)),
                      Divider(
                          height: heightSize(3),
                          thickness: 2,
                          color: homeController.mediaOption.value == 1
                              ? const Color(0xFFECECEC)
                              : faintColor),
                    ],
                  ),
                ),
              ),
            ),

            // Education Section

            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  homeController.mediaOption.value = 2;
                },
                child: Container(
                  // width: widthSize(176),
                  height: heightSize(30),

                  decoration: const BoxDecoration(color: backgroundColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Education',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: homeController.mediaOption.value == 2
                              ? const Color(0xFFECECEC)
                              : textColor3,
                          fontSize: fontSize(15),
                          fontWeight: homeController.mediaOption.value == 2
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ),
                      // SizedBox(height: heightSize(7)),
                      Divider(
                          height: heightSize(3),
                          thickness: 2,
                          color: homeController.mediaOption.value == 2
                              ? const Color(0xFFECECEC)
                              : faintColor),
                    ],
                  ),
                ),
              ),
            ),

//Action
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  homeController.mediaOption.value = 3;
                },
                child: Container(
                  // width: widthSize(176),
                  height: heightSize(30),

                  decoration: const BoxDecoration(color: backgroundColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Action',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: homeController.mediaOption.value == 3
                              ? const Color(0xFFECECEC)
                              : textColor3,
                          fontSize: fontSize(15),
                          fontWeight: homeController.mediaOption.value == 3
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ),
                      // SizedBox(height: heightSize(7)),
                      Divider(
                          height: heightSize(3),
                          thickness: 2,
                          color: homeController.mediaOption.value == 3
                              ? const Color(0xFFECECEC)
                              : faintColor),
                    ],
                  ),
                ),
              ),
            ),

            // Love
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  homeController.mediaOption.value = 4;
                },
                child: Container(
                  // width: widthSize(176),
                  height: heightSize(30),

                  decoration: const BoxDecoration(color: backgroundColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Love',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: homeController.mediaOption.value == 4
                              ? const Color(0xFFECECEC)
                              : textColor3,
                          fontSize: fontSize(15),
                          fontWeight: homeController.mediaOption.value == 4
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ),
                      // SizedBox(height: heightSize(7)),
                      Divider(
                          height: heightSize(3),
                          thickness: 2,
                          color: homeController.mediaOption.value == 4
                              ? const Color(0xFFECECEC)
                              : faintColor),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }));
}
