// ignore_for_file: must_be_immutable

import 'package:duwith_social/Pages/Auth%20Page/components/signup_with.dart';
import 'package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart';
import 'package:duwith_social/Pages/Auth%20Page/screens/login_screen.dart';
import 'package:duwith_social/common/getxmessage.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../common/button-widget.dart';
import '../../../common/custom-text.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  AuthController authController = AuthController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: heightSize(20),
                    top: constraints.maxHeight * 0.2,
                    left: widthSize(65),
                    right: widthSize(65)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CText(
                      text: "DUWITH SOCIAL",
                      size: 15,
                      fontFamily: UsedFonts.stalinistOne,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: heightSize(55)),
                    SizedBox(
                      height: heightSize(58),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CText(
                            text: "Start Your Journey with Us!",
                            fontFamily: UsedFonts.poppins,
                            size: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            width: widthSize(245),
                            child: const CText(
                              text:
                                  "Sign up now and be part of a vibrant, engaging social network",
                              fontFamily: UsedFonts.poppins,
                              textAlign: TextAlign.center,
                              size: 11,
                              color: textColor3,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: heightSize(46)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        socialMedia(FontAwesomeIcons.google),
                        SizedBox(width: widthSize(9.5)),
                        socialMedia(FontAwesomeIcons.facebookF),
                      ],
                    ),
                    SizedBox(height: heightSize(46)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: widthSize(120),
                          child: Divider(
                            height: heightSize(3),
                            thickness: 1,
                            color: Color(0xFF3C3C3C),
                          ),
                        ),
                        SizedBox(width: widthSize(10)),
                        const CText(
                          text: "Or",
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w400,
                          color: textColor,
                        ),
                        SizedBox(width: widthSize(10)),
                        SizedBox(
                          width: widthSize(120),
                          child: Divider(
                              height: heightSize(3),
                              thickness: 1,
                              color: Color(0xFF3C3C3C)),
                        ),
                      ],
                    ),
                    SizedBox(height: heightSize(24)),
                    buttonsWidget2(
                        context,
                        heightSize(45),
                        constraints.maxWidth,
                        "Sign up with Email",
                        Icons.email_rounded,
                        mainColor,
                        textColor, () {
                      authController.hintText.value = "Email address";
                      authController.optionUsed.value = 1;
                      authController.hintIcon.value = Icons.email_outlined;
                      Get.to(() => SignUpWithScreen());
                    }, false),
                    SizedBox(height: heightSize(16)),
                    buttonsWidget2(
                        context,
                        heightSize(45),
                        constraints.maxWidth,
                        "Sign up with wallet",
                        Icons.wallet_outlined,
                        buttonColor2,
                        textColor, () {
                      getSuccessSnackBar("coming soon");
                    }, false),
                    SizedBox(height: heightSize(16)),
                    buttonsWidget2(
                        context,
                        heightSize(45),
                        constraints.maxWidth,
                        "Sign up with number",
                        Icons.wallet_outlined,
                        buttonColor2,
                        textColor, () {
                      authController.hintText.value = "Mobile number";
                      authController.optionUsed.value = 3;
                      authController.hintIcon.value =
                          Icons.phone_iphone_rounded;
                      Get.to(() => SignUpWithScreen());
                    }, false),
                    SizedBox(height: heightSize(20)),
                    ////
                    SizedBox(
                      height: heightSize(22),
                      width: widthSize(260),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline_outlined,
                            size: heightSize(20),
                            color: textColor,
                          ),
                          SizedBox(width: widthSize(5)),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CText(
                                text: "By continuing you’ve agreed with our",
                                color: textColor3,
                                size: 11,
                                fontFamily: UsedFonts.poppins,
                                fontWeight: FontWeight.w500,
                              ),
                              CText(
                                text: "terms and conditions",
                                size: 11,
                                color: highlightColor,
                                fontFamily: UsedFonts.poppins,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: heightSize(21)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CText(
                          text: "Already have an account?",
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w600,
                          size: 12,
                          color: textColor,
                        ),
                        CText(
                          onClick: () => Get.to(() => LoginScreen()),
                          text: "Sign in",
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w400,
                          size: 12,
                          color: mainColor,
                        ),
                      ],
                    ),
                    const Spacer(),
                    const CText(
                      text: "Powered by DUWITH",
                      fontFamily: UsedFonts.poppins,
                      fontWeight: FontWeight.w400,
                      size: 11,
                      color: textColor3,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  socialMedia(IconData icon) {
    return Container(
        height: heightSize(38),
        width: widthSize(38),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xFF3A3A3C),
          borderRadius: BorderRadius.all(Radius.circular(widthSize(20))),
        ),
        child: Icon(
          icon,
          size: heightSize(16),
          color: textColor,
        ));
  }
}
