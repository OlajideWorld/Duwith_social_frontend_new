import 'package:flutter/material.dart';

import '../../../common/custom-text.dart';
import '../../../utils/color.dart';
import '../../../utils/sizes.dart';
import '../../Home Page/controllers/home_controller.dart';

HomeController homeController = HomeController.instance;

selectViewProfile(BuildContext context, double width) {
  return Container(
    width: width,
    height: heightSize(50),
    padding:
        EdgeInsets.symmetric(horizontal: widthSize(6), vertical: heightSize(6)),
    decoration: const BoxDecoration(
      color: Colors.transparent,
    ),
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
                // width: widthSize(176),
                height: heightSize(50),

                decoration: const BoxDecoration(color: Colors.transparent),
                child: Column(
                  children: [
                    Text(
                      'Posts',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: homeController.viewprofileslide.value == 0
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
                        color: homeController.viewprofileslide.value == 0
                            ? const Color(0xFFECECEC)
                            : faintColor),
                  ],
                ),
              ),
            ),
          ),
          //
          Expanded(
            child: GestureDetector(
              onTap: () {
                homeController.viewprofileslide.value = 1;
              },
              child: Container(
                height: heightSize(50),
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Stories',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: homeController.viewprofileslide.value == 1
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
                        color: homeController.viewprofileslide.value == 1
                            ? const Color(0xFFECECEC)
                            : faintColor),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: GestureDetector(
              onTap: () {
                homeController.viewprofileslide.value = 2;
              },
              child: Container(
                height: heightSize(50),
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Videos',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: homeController.viewprofileslide.value == 2
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
                        color: homeController.viewprofileslide.value == 2
                            ? const Color(0xFFECECEC)
                            : faintColor),
                  ],
                ),
              ),
            ),
          ),
        ]),
  );
}
