// ignore_for_file: must_be_immutable

import "package:add_to_cart_animation/add_to_cart_animation.dart";
import "package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart";
import "package:duwith_social/Pages/Earn%20More%20Page/components/earn_tap_widget.dart";
import "package:duwith_social/Pages/Earn%20More%20Page/components/holdablle_wdget.dart";
import "package:duwith_social/Pages/Earn%20More%20Page/components/social_bottom_sheet.dart";
import "package:duwith_social/Pages/Earn%20More%20Page/controller/earn_controller.dart";
import "package:duwith_social/Pages/Wallet%20Page/screens/new_wallet_screen.dart";
import "package:duwith_social/Pages/Wallet%20Page/screens/wallet_screen.dart";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_bounceable/flutter_bounceable.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../common/custom-text.dart";
import "../../../utils/color.dart";
import "../../../utils/sizes.dart";
import "../../Auth Page/services/socket_sevice.dart";

EarnController earnController = EarnController.instance;
AuthController authController = AuthController.instance;
SocketService socket = SocketService.instance;

earnBalanceWidget() {
  return Obx(() {
    return GestureDetector(
      // onTap: () => Get.to(() => const WalletScreen()),
      onTap: () => Get.to(() => NewWalletMainScreenPage()),
      child: SizedBox(
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
                  Padding(
                    padding: EdgeInsets.only(right: widthSize(20)),
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
                        // SizedBox(width: widthSize(10)),
                        Text(
                          earnController.formatNumberWithCommas(
                              authController.userdata.value.mainBalance),
                          // "1,120,536",
                          style: GoogleFonts.archivoBlack(
                            color: textColor,
                            fontSize: fontSize(30),
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  });
}

earnLuckySpin(double width) {
  return GestureDetector(
    // onTap: () => earnspinActivity(width),
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
      // AdmobAdsClass().loadBannerAd(width.toInt(), 100);
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
                    text: "+100k",
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

class EarnTapWidget extends StatelessWidget {
  final double width;
  GlobalKey widgetKey = GlobalKey();
  final Function(GlobalKey) addtoCartClick;
  EarnTapWidget({super.key, required this.addtoCartClick, required this.width});

  @override
  Widget build(BuildContext context) {
    return HoldableWidget(
      holdDuration: const Duration(seconds: 4), // e.g. 4s threshold
      onLongHold: () => earnController.onHoldAction(),

      child: SizedBox(
        height: heightSize(218),
        width: width,
        child: Stack(children: [
          // AddToCartIcon(
          //   key: earnController.cartkey,
          //   icon: SizedBox(
          //     height: heightSize(100),
          //     width: widthSize(59),
          //     child: Image.asset("assets/images/Earn/goldjar.png",
          //         fit: BoxFit.fitHeight),
          //   ),
          //   badgeOptions: BadgeOptions(
          //       width: widthSize(20),
          //       backgroundColor: mainColor,
          //       foregroundColor: textColor),
          // )

          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: heightSize(218),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // EarnTapMoneyWidget(),
                  SizedBox(
                    height: heightSize(202),
                    child: Stack(children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: widthSize(80), top: heightSize(80)),
                        child: Container(
                          key: widgetKey,
                          child: Image.asset(
                            "assets/images/points.png",
                            fit: BoxFit.fitHeight,
                            height: heightSize(30),
                            width: widthSize(30),
                          ),
                        ),
                      ),
                      Bounceable(
                        onTap: () {
                          // addtoCartClick(widgetKey);
                        },
                        child: SizedBox(
                          height: heightSize(202),
                          width: widthSize(202),
                          child: Stack(
                            children: [
                              SizedBox(
                                height: heightSize(218),
                                width: widthSize(202),
                                child: Image.asset(
                                  "assets/images/Earn/earn_more4.png",
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: heightSize(145),
                                  width: widthSize(143),
                                  child: Image.asset(
                                    "assets/images/Earn/dog_earn.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
