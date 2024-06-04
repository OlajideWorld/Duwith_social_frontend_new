import "package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart";
import "package:duwith_social/common/button-widget.dart";
import "package:duwith_social/utils/color.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";
import "package:google_mobile_ads/google_mobile_ads.dart";
import "package:startapp_sdk/startapp.dart";

import "../../../common/custom-text.dart";

HomeController homeController = HomeController.instance;

showsocialMediaActivity(BuildContext context, double width) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: heightSize(500),
          padding: EdgeInsets.only(
              top: heightSize(15), left: widthSize(20), right: widthSize(20)),
          decoration: BoxDecoration(
            color: const Color(0xFF151B2E),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(widthSize(15)),
                topRight: Radius.circular(widthSize(15))),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: heightSize(3),
                    width: widthSize(127),
                    decoration: BoxDecoration(
                        color: textColor,
                        borderRadius:
                            BorderRadius.all(Radius.circular(widthSize(5)))),
                  ),
                  SizedBox(height: heightSize(10)),
                  // SizedBox(
                  //   height: heightSize(75),
                  //   width: widthSize(93),
                  //   child: Image.asset("assets/images/Earn/socialmedia.png"),
                  // ),
                  SizedBox(height: heightSize(16)),
                  SizedBox(
                    height: heightSize(44),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CText(
                          text: "Duwith Social task campaign",
                          size: 16,
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                        CText(
                          text: "Follow Duwith Social accounts and get coins",
                          size: 12,
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w400,
                          color: textColor3,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: heightSize(21)),
                  // SizedBox(
                  //     height: heightSize(100),
                  //     width: width,
                  //     child: AdWidget(ad: homeController.bannerAd!)),

                  // SizedBox(height: heightSize(21)),
                  StartAppBanner(homeController.startBannerAd!),
                  SizedBox(height: heightSize(21)),
                  socialWidget(
                      context,
                      width,
                      "assets/images/Earn/facebook.png",
                      "Follow our Facebook "),
                  SizedBox(height: heightSize(6)),
                  socialWidget(
                      context,
                      width,
                      "assets/images/Earn/instagram.png",
                      "Follow our Instagram "),
                  SizedBox(height: heightSize(6)),
                  socialWidget(context, width, "assets/images/Earn/youtube.png",
                      "Subscribe to our channel"),
                  SizedBox(height: heightSize(6)),
                  socialWidget(context, width, "assets/images/Earn/twitter.png",
                      "Follow our X account")
                ],
              ),
            ),
          ),
        );
      });
}

socialWidget(BuildContext context, double width, String image, String name) {
  return Container(
    height: heightSize(65),
    width: width,
    padding: EdgeInsets.symmetric(
        horizontal: widthSize(15), vertical: heightSize(14)),
    decoration: BoxDecoration(
        color: const Color(0xFF1A2137),
        borderRadius: BorderRadius.all(Radius.circular(widthSize(10)))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: widthSize(260),
          child: Row(
            children: [
              Container(
                height: heightSize(36),
                width: widthSize(36),
                decoration: BoxDecoration(
                    color: const Color(0xFF343232),
                    borderRadius:
                        BorderRadius.all(Radius.circular(widthSize(19.5)))),
                child: Padding(
                  padding: EdgeInsets.all(widthSize(9)),
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: widthSize(10)),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CText(
                      text: name,
                      size: 13,
                      color: const Color(0xFFE9E9E9),
                      fontFamily: UsedFonts.poppins,
                      fontWeight: FontWeight.w500,
                    ),
                    Row(
                      children: [
                        const CText(
                          text: "Get 10,000 ",
                          size: 10,
                          color: textColor3,
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: heightSize(12),
                          width: widthSize(12),
                          child: Image.asset(
                            "assets/images/points.png",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        buttonsWidget(context, heightSize(28), widthSize(61), "claim",
            Color(0xFF0AA92D), 12, () {}, false, Colors.white)
      ],
    ),
  );
}
