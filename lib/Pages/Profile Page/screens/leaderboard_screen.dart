import "package:duwith_social/Pages/Profile%20Page/components/leaderBoard_componenet.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";
import "package:google_mobile_ads/google_mobile_ads.dart";

import "../../../common/button-widget.dart";
import "../../../utils/color.dart";
import "../../Home Page/controllers/home_controller.dart";

class LeaderBoardScreen extends StatelessWidget {
  LeaderBoardScreen({super.key});

  HomeController homeController = HomeController.instance;

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
                physics: AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: heightSize(20)),
                        backbutton(onTap: () => Get.back()),
                        SizedBox(height: heightSize(29)),
                        leaderAmountContainer(constraints.maxWidth),
                        SizedBox(height: heightSize(10)),
                        leaderWinnerWidget("assets/images/Search/search7.png"),
                        SizedBox(height: heightSize(10)),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: constraints.maxWidth * 0.3,
                                height: heightSize(45),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xFF2666CF1A),
                                  borderRadius:
                                      BorderRadius.circular(widthSize(20)),
                                ),
                                child: Text(
                                  "By Coin",
                                  style: GoogleFonts.poppins(
                                    fontSize: widthSize(18),
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF2666CF),
                                  ),
                                ),
                              ),
                              Container(
                                width: constraints.maxWidth * 0.3,
                                height: heightSize(45),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color(0xFF2666CF1A),
                                    borderRadius:
                                        BorderRadius.circular(widthSize(20))),
                                child: Text(
                                  "By Referrals",
                                  style: GoogleFonts.poppins(
                                    fontSize: widthSize(18),
                                    fontWeight: FontWeight.w400,
                                    color: navbarColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: heightSize(30)),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "TOP USER",
                                style: GoogleFonts.poppins(
                                  fontSize: widthSize(18),
                                  fontWeight: FontWeight.w400,
                                  color: textColor,
                                ),
                              ),
                              Text(
                                "00:58:27",
                                style: GoogleFonts.poppins(
                                  fontSize: widthSize(18),
                                  fontWeight: FontWeight.w400,
                                  color: navbarColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: heightSize(30)),
                        leaderPeopleWidget("assets/images/Search/search7.png",
                            "1", "500k", "Marsha Fisher"),
                        SizedBox(height: heightSize(10)),
                        leaderPeopleWidget("assets/images/Search/search7.png",
                            "2", "500k", "Marsha Fisher"),
                        SizedBox(height: heightSize(10)),
                        leaderPeopleWidget("assets/images/Search/search7.png",
                            "3", "500k", "Marsha Fisher"),
                        SizedBox(height: heightSize(10)),
                        homeController.bannerAd != null
                            ? Container(
                                height: heightSize(70),
                                width: constraints.maxWidth,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(widthSize(10))),
                                child: AdWidget(ad: homeController.bannerAd!))
                            : SizedBox(),
                        SizedBox(height: heightSize(10)),
                        leaderPeopleWidget("assets/images/Search/search7.png",
                            "4", "500k", "Marsha Fisher"),
                        SizedBox(height: heightSize(10)),
                        leaderPeopleWidget("assets/images/Search/search7.png",
                            "5", "500k", "Marsha Fisher"),
                        SizedBox(height: heightSize(30)),
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
