import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../utils/color.dart";
import "../../Earn More Page/controller/earn_controller.dart";
import "../controller/profile_controller.dart";

EarnController earnController = EarnController.instance;

selectStreakView(BuildContext context) {
  return Obx(() {
    return SizedBox(
      width: widthSize(180),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              earnController.chooseType.value = 0;
            },
            child: Container(
              width: widthSize(56),
              height: heightSize(30),
              decoration: const BoxDecoration(color: backgroundColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Daily',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: earnController.chooseType.value == 0
                          ? const Color(0xFFECECEC)
                          : textColor3,
                      fontSize: earnController.chooseType.value == 0
                          ? fontSize(17)
                          : fontSize(15),
                      fontWeight: earnController.chooseType.value == 0
                          ? FontWeight.w600
                          : FontWeight.w500,
                    ),
                  ),
                  // SizedBox(height: heightSize(7)),
                  earnController.chooseType.value == 0
                      ? Divider(
                          height: heightSize(3),
                          thickness: 2,
                          color: const Color(0xFFECECEC))
                      : Divider(
                          height: heightSize(3),
                          thickness: 2,
                          color: Color.fromARGB(65, 236, 236, 236))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              earnController.chooseType.value = 1;
            },
            child: Container(
              width: widthSize(56),
              height: heightSize(30),
              decoration: const BoxDecoration(color: backgroundColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Streak',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: earnController.chooseType.value == 1
                          ? const Color(0xFFECECEC)
                          : textColor3,
                      fontSize: earnController.chooseType.value == 1
                          ? fontSize(17)
                          : fontSize(15),
                      fontWeight: earnController.chooseType.value == 1
                          ? FontWeight.w600
                          : FontWeight.w500,
                    ),
                  ),
                  // SizedBox(height: heightSize(7)),
                  earnController.chooseType.value == 1
                      ? Divider(
                          height: heightSize(3),
                          thickness: 2,
                          color: const Color(0xFFECECEC))
                      : Divider(
                          height: heightSize(3),
                          thickness: 2,
                          color: Color.fromARGB(65, 236, 236, 236))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  });
}
