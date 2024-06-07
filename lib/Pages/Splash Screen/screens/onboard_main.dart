import 'package:duwith_social/Pages/Auth%20Page/screens/login_screen.dart';
import 'package:duwith_social/Pages/Splash%20Screen/components/onboard_components.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                              const CText(
                                text: "Start Your Journey with Us!",
                                fontFamily: UsedFonts.poppins,
                                fontWeight: FontWeight.w400,
                                size: 20,
                                color: textColor,
                              ),
                              SizedBox(height: heightSize(8)),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: widthSize(29)),
                                child: const CText(
                                  text:
                                      "Sign up now and be part of a vibrant, engaging Web3 social network",
                                  textAlign: TextAlign.center,
                                  fontFamily: UsedFonts.poppins,
                                  fontWeight: FontWeight.w400,
                                  size: 12,
                                  color: Color(0xFF9291A4),
                                ),
                              ),
                              SizedBox(height: heightSize(20)),
                              buttonsWidget(
                                  context,
                                  heightSize(45),
                                  constraints.maxWidth,
                                  "Get started",
                                  mainColor,
                                  14, () {
                                Get.to(() => LoginScreen());
                              }, false, textColor)
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
