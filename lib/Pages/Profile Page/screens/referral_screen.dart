// ignore_for_file: must_be_immutable

import 'package:duwith_social/Pages/Auth%20Page/services/socket_sevice.dart';
import 'package:duwith_social/Pages/Profile%20Page/components/referral_components.dart';
import 'package:duwith_social/Pages/Profile%20Page/components/social_binding_widget.dart';
import 'package:duwith_social/Pages/Profile%20Page/controller/profile_controller.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: heightSize(20)),
                        backbutton(onTap: () => Get.back()),
                        SizedBox(height: heightSize(29)),
                        referralTopWidget(context, constraints.maxWidth),
                        SizedBox(height: heightSize(20)),
                        Container(
                          height: heightSize(90),
                          width: constraints.maxWidth,
                          padding: EdgeInsets.symmetric(
                              vertical: heightSize(15),
                              horizontal: widthSize(20)),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: textColor3,
                            ),
                            color: Color(0xFF151532),
                            borderRadius: BorderRadius.all(
                                Radius.circular(widthSize(15))),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Received From Referred Friends',
                                style: GoogleFonts.poppins(
                                  fontSize: widthSize(15),
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: heightSize(34),
                                      width: widthSize(34),
                                      child: Image.asset(
                                        "assets/images/points.png",
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    Text(
                                      // earnController.formatNumberWithCommas(
                                      //     authController.userdata.value.mainBalance),
                                      "40,201.30",
                                      style: GoogleFonts.poppins(
                                        color: textColor,
                                        fontSize: fontSize(20),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: heightSize(20)),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              referralContainer(
                                  context: context,
                                  width: constraints.maxWidth,
                                  text1: "\$DOT",
                                  text2: "2,336",
                                  text3:
                                      "5% Bonus from your friend \n1%  from their refferal",
                                  coinImage: "assets/images/Earn/giftCover.png",
                                  showImage: true,
                                  buttonColor: Color(0xFFB1FC03)),
                              referralContainer(
                                  context: context,
                                  width: constraints.maxWidth,
                                  text1: "\$TON",
                                  text2: "2,336",
                                  text3:
                                      "Earn 0.0005 TON \nFor every invited friend",
                                  coinImage: "assets/images/Earn/tonCoin.png",
                                  showImage: false,
                                  buttonColor: Color(0xFF2666CF))
                            ],
                          ),
                        ),
                        SizedBox(height: heightSize(20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: constraints.maxWidth * 0.8,
                              padding: EdgeInsets.only(
                                  top: heightSize(10), bottom: heightSize(10)),
                              decoration: BoxDecoration(
                                  color: textColor,
                                  borderRadius:
                                      BorderRadius.circular(widthSize(10))),
                              child: Center(
                                child: Text(
                                  "Invite Friends",
                                  style: GoogleFonts.poppins(
                                    fontSize: widthSize(15),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: heightSize(30),
                              width: widthSize(30),
                              decoration: BoxDecoration(
                                  color: Color(0xFF1A2137),
                                  borderRadius:
                                      BorderRadius.circular(widthSize(10))),
                              child: Icon(
                                Icons.copy_all_rounded,
                                size: heightSize(20),
                                color: textColor,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: heightSize(28)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Your referrals",
                              style: GoogleFonts.poppins(
                                fontSize: widthSize(20),
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: textColor,
                              size: heightSize(20),
                            )
                          ],
                        ),
                        SizedBox(height: heightSize(15)),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(widthSize(15)),
                          decoration: BoxDecoration(
                            color: Color(0xFF151B2E),
                            borderRadius: BorderRadius.all(
                                Radius.circular(widthSize(15))),
                          ),
                          child: Column(
                            children: [
                              referralPeopleWidget(
                                  "assets/images/Search/search7.png"),
                              SizedBox(height: heightSize(10)),
                              referralPeopleWidget(
                                  "assets/images/Search/search7.png"),
                              SizedBox(height: heightSize(10)),
                              referralPeopleWidget(
                                  "assets/images/Search/search7.png"),
                              SizedBox(height: heightSize(10)),
                              referralPeopleWidget(
                                  "assets/images/Search/search7.png"),
                            ],
                          ),
                        ),

                        SizedBox(height: heightSize(30))

                        // referralCodeContainer(constraints.maxWidth),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
