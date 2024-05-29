import "package:duwith_social/routes/routes.dart";
import "package:duwith_social/utils/color.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:get/get.dart";

import "../../../common/button-widget.dart";
import "../../../common/custom-text.dart";
import "../controller/auth_controller.dart";

class VerificationSuccess extends StatelessWidget {
  VerificationSuccess({super.key});

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
                padding: EdgeInsets.symmetric(
                    horizontal: widthSize(30), vertical: heightSize(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: heightSize(120),
                      width: widthSize(120),
                      child: SvgPicture.asset(
                        "assets/images/social-success.svg",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    SizedBox(height: heightSize(10)),
                    const CText(
                      text: "Sign in successful",
                      fontFamily: UsedFonts.poppins,
                      fontWeight: FontWeight.w600,
                      size: 18,
                      color: textColor,
                    ),
                    SizedBox(height: heightSize(10)),
                    const CText(
                      text: "Begin to explore the world of sharing",
                      fontFamily: UsedFonts.poppins,
                      fontWeight: FontWeight.w400,
                      size: 12,
                      color: textColor,
                    ),
                    SizedBox(height: heightSize(36)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: widthSize(40)),
                      child: buttonsWidget(context, heightSize(50),
                          constraints.maxWidth, "Continue", mainColor, 12, () {
                        authController
                            .saveCounter(authController.isFirstTime!.value);
                        Get.toNamed(MyRoutes.homeScreen);
                      }, false, Colors.white),
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
}
