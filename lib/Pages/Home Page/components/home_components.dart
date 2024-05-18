import 'package:flutter/material.dart';

import '../../../common/custom-text.dart';
import '../../../utils/color.dart';
import '../../../utils/sizes.dart';
import '../../Auth Page/controller/auth_controller.dart';

final AuthController authController = AuthController.instance;

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
                authController.isEmail.value = true;
                authController.loginhint.value = "Email address";
                authController.loginprefixIcon.value = Icons.email_outlined;
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
                        color: authController.isEmail.value == true
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
                        color: authController.isEmail.value == true
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
                authController.isEmail.value = false;
                authController.loginhint.value = "Mobile Number";
                authController.loginprefixIcon.value =
                    Icons.phone_iphone_rounded;
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
                        color: authController.isEmail.value == false
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
                        color: authController.isEmail.value == false
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
                authController.isEmail.value = false;
                authController.loginhint.value = "Mobile Number";
                authController.loginprefixIcon.value =
                    Icons.phone_iphone_rounded;
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
                        color: authController.isEmail.value == false
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
                        color: authController.isEmail.value == false
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
                authController.isEmail.value = false;
                authController.loginhint.value = "Mobile Number";
                authController.loginprefixIcon.value =
                    Icons.phone_iphone_rounded;
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
                        color: authController.isEmail.value == false
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
                        color: authController.isEmail.value == false
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
