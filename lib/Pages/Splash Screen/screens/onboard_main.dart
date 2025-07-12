// ignore_for_file: deprecated_member_use

import 'package:duwith_social/Pages/Auth%20Page/screens/login_screen.dart';
import 'package:duwith_social/Pages/Splash%20Screen/components/onboard_components.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/sizes.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: heightSize(100),
                  ),
                  child: Stack(
                    children: [
                      backgroundEcclipse(constraints.maxWidth),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: widthSize(45)),
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              backgroundImageOnboard(),
                              SizedBox(height: heightSize(38)),
                              Text(
                                "Start Your Journey with Us!",
                                style: GoogleFonts.daysOne(
                                  color: textColor,
                                  fontSize: fontSize(23),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: heightSize(8)),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: widthSize(30)),
                                child: Text(
                                  "Sign up now and be part of a vibrant, engaging Web3 social network",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: Color(0xFF9291A4),
                                    fontSize: fontSize(12),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(height: heightSize(20)),
                              GestureDetector(
                                onTap: () => Get.to(() => LoginScreen()),
                                child: Container(
                                  height: heightSize(50),
                                  width: widthSize(264),
                                  decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(widthSize(25)),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      " Get started",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        color: textColor,
                                        fontSize: fontSize(12),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
