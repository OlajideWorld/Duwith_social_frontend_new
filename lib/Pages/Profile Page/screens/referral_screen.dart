// ignore_for_file: must_be_immutable

import 'package:duwith_social/Pages/Auth%20Page/services/socket_sevice.dart';
import 'package:duwith_social/Pages/Profile%20Page/components/social_binding_widget.dart';
import 'package:duwith_social/Pages/Profile%20Page/controller/profile_controller.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/custom-text.dart';

class ReferralScreen extends StatelessWidget {
  ReferralScreen({super.key});

  ProfileController profileController = ProfileController.instance;

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
                padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
                child: Obx(() {
                  return SizedBox(
                    child: Column(
                      children: [
                        referralAppBar(),
                        SizedBox(height: heightSize(29)),
                        SizedBox(
                          width: widthSize(261),
                          height: heightSize(58),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CText(
                                text: "Invite Your Friends to Join the Fun!",
                                size: 15,
                                fontFamily: UsedFonts.poppins,
                                fontWeight: FontWeight.w600,
                                textAlign: TextAlign.center,
                                color: textColor,
                              ),
                              CText(
                                text:
                                    "Earn rewards for every friend who signs up and joins our community.",
                                size: 12,
                                fontFamily: UsedFonts.poppins,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                                color: Color(0xFF81819A),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: heightSize(48)),
                        SizedBox(
                          height: heightSize(84),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CText(
                                text: "Your referral points",
                                size: 12,
                                fontFamily: UsedFonts.poppins,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.center,
                                color: textColor,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/points.png",
                                    fit: BoxFit.fitHeight,
                                    height: heightSize(22),
                                    width: widthSize(22),
                                  ),
                                  CText(
                                    text: profileController
                                        .viewProfileData.value.dailyPoints
                                        .toString(),
                                    size: 20,
                                    fontFamily: UsedFonts.poppins,
                                    fontWeight: FontWeight.w500,
                                    textAlign: TextAlign.center,
                                    color: textColor,
                                  ),
                                ],
                              ),
                              buttonsWidget(
                                  context,
                                  heightSize(30),
                                  widthSize(87),
                                  "Claim",
                                  textColor,
                                  13,
                                  () {},
                                  false,
                                  const Color(0xFF0E1425))
                            ],
                          ),
                        ),
                        SizedBox(height: heightSize(28)),
                        referralCodeContainer(constraints.maxWidth)
                      ],
                    ),
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}
