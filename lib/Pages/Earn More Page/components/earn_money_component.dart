import "package:duwith_social/Pages/Earn%20More%20Page/components/earn_tap_widget.dart";
import "package:duwith_social/Pages/Earn%20More%20Page/components/social_bottom_sheet.dart";
import "package:duwith_social/Services/Ads%20Service/admob_manager.dart";
import "package:duwith_social/Services/Ads%20Service/start_app_manager.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

import "../../../common/custom-text.dart";
import "../../../utils/color.dart";
import "../../../utils/sizes.dart";

earnBalanceWidget() {
  return SizedBox(
    height: heightSize(62),
    child: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            child: Stack(alignment: Alignment.center, children: [
              SizedBox(
                height: heightSize(62),
                width: widthSize(244),
                child: Image.asset(
                  "assets/images/Earn/earn_more5.png",
                  fit: BoxFit.contain,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: heightSize(44),
                      width: widthSize(44),
                      child: Image.asset(
                        "assets/images/points.png",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    SizedBox(width: widthSize(10)),
                    const CText(
                      text: "120,536 ",
                      size: 30,
                      fontFamily: UsedFonts.archivo,
                      fontWeight: FontWeight.w400,
                      color: textColor,
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ],
    ),
  );
}

earnLuckySpin(double width) {
  return GestureDetector(
    onTap: () => earnspinActivity(width),
    child: SizedBox(
      height: heightSize(60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              height: heightSize(48),
              width: widthSize(45),
              child: Image.asset(
                "assets/images/Earn/earn_more6.png",
                fit: BoxFit.contain,
              )),
          const CText(
            text: "Lucky spin",
            size: 10,
            fontFamily: UsedFonts.archivo,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ],
      ),
    ),
  );
}

earnSocialMediaWidget(BuildContext context, double width) {
  return GestureDetector(
    onTap: () {
      AdmobAdsClass().loadBannerAd(width.toInt(), 100);
      // StartAppAdsClass().loadBannerAds();
      showsocialMediaActivity(context, width);
    },
    child: SizedBox(
      height: heightSize(75),
      child: Column(
        children: [
          Container(
            height: heightSize(11),
            width: widthSize(43),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color(0xFF55B188),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(widthSize(5)),
                    topRight: Radius.circular(widthSize(5)))),
            child: SizedBox(
              height: heightSize(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: heightSize(8),
                    child: Image.asset("assets/images/Earn/banknotes.png",
                        fit: BoxFit.contain),
                  ),
                  const CText(
                    text: "+0.003",
                    size: 8,
                    color: textColor,
                    fontFamily: UsedFonts.poppins,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: heightSize(53),
            width: widthSize(44),
            alignment: Alignment.center,
            padding: EdgeInsets.all(widthSize(7)),
            decoration: BoxDecoration(
                color: const Color(0xFF10151C),
                borderRadius: BorderRadius.all(Radius.circular(widthSize(5)))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.facebookF,
                      color: textColor,
                      size: heightSize(15),
                    ),
                    Icon(
                      FontAwesomeIcons.twitter,
                      color: textColor,
                      size: heightSize(15),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.instagram,
                      color: textColor,
                      size: heightSize(15),
                    ),
                    Icon(
                      FontAwesomeIcons.youtube,
                      color: textColor,
                      size: heightSize(15),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

earnTap(double width) {
  return SizedBox(
    height: heightSize(218),
    width: width,
    child: Stack(children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: heightSize(53),
                child: Row(
                  children: [
                    SizedBox(
                      height: heightSize(53),
                      width: widthSize(17),
                      child: Image.asset(
                        "assets/images/Earn/thunder.png",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CText(
                          text: "2,000,000",
                          size: 14,
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                        SizedBox(height: heightSize(4)),
                        const CText(
                          text: "/10,000,000",
                          size: 14,
                          fontFamily: UsedFonts.archivo,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFB57C44),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: heightSize(100),
                width: widthSize(59),
                child: Image.asset("assets/images/Earn/goldjar.png",
                    fit: BoxFit.fitHeight),
              )
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: heightSize(218),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              earnTapMoneyWuidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CText(
                    text: "Dog to produce",
                    size: 10,
                    fontFamily: UsedFonts.archivo,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                  SizedBox(
                    height: heightSize(11),
                    width: widthSize(11),
                    child: Image.asset(
                      "assets/images/points.png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const CText(
                    text: "100/hr ",
                    size: 12,
                    fontFamily: UsedFonts.archivo,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    ]),
  );
}
