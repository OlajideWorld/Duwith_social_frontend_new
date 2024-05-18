import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import '../../../common/custom-text.dart';
import '../../../utils/color.dart';
import '../../../utils/sizes.dart';

HomeController homeController = HomeController.instance;

selectHomeView(BuildContext context, double width) {
  return Container(
    width: width,
    height: heightSize(50),
    padding:
        EdgeInsets.symmetric(horizontal: widthSize(6), vertical: heightSize(6)),
    decoration: const BoxDecoration(
      color: backgroundColor,
    ),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                homeController.viewBarOption.value = 0;
              },
              child: Container(
                // width: widthSize(176),
                height: heightSize(50),

                decoration: const BoxDecoration(color: backgroundColor),
                child: Column(
                  children: [
                    Text(
                      'For you',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: homeController.viewBarOption.value == 0
                            ? const Color(0xFFECECEC)
                            : textColor3,
                        fontSize: fontSize(14),
                        fontFamily: UsedFonts.poppins,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: heightSize(7)),
                    Divider(
                        height: heightSize(3),
                        thickness: 2,
                        color: homeController.viewBarOption.value == 0
                            ? const Color(0xFFECECEC)
                            : textColor3),
                  ],
                ),
              ),
            ),
          ),
          //
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                homeController.viewBarOption.value = 1;
              },
              child: Container(
                height: heightSize(50),
                decoration: const BoxDecoration(color: backgroundColor),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Video',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: homeController.viewBarOption.value == 1
                            ? const Color(0xFFECECEC)
                            : textColor3,
                        fontSize: fontSize(14),
                        fontFamily: UsedFonts.poppins,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: heightSize(7)),
                    Divider(
                        height: heightSize(3),
                        thickness: 2,
                        color: homeController.viewBarOption.value == 1
                            ? const Color(0xFFECECEC)
                            : textColor3),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                homeController.viewBarOption.value = 2;
              },
              child: Container(
                height: heightSize(50),
                decoration: const BoxDecoration(color: backgroundColor),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'News',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: homeController.viewBarOption.value == 2
                            ? const Color(0xFFECECEC)
                            : textColor3,
                        fontSize: fontSize(14),
                        fontFamily: UsedFonts.poppins,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: heightSize(7)),
                    Divider(
                        height: heightSize(3),
                        thickness: 2,
                        color: homeController.viewBarOption.value == 2
                            ? const Color(0xFFECECEC)
                            : textColor3),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                homeController.viewBarOption.value = 3;
              },
              child: Container(
                height: heightSize(50),
                decoration: const BoxDecoration(color: backgroundColor),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Airdrops',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: homeController.viewBarOption.value == 3
                            ? const Color(0xFFECECEC)
                            : textColor3,
                        fontSize: fontSize(14),
                        fontFamily: UsedFonts.poppins,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: heightSize(7)),
                    Divider(
                        height: heightSize(3),
                        thickness: 2,
                        color: homeController.viewBarOption.value == 3
                            ? const Color(0xFFECECEC)
                            : textColor3),
                  ],
                ),
              ),
            ),
          )
        ]),
  );
}
