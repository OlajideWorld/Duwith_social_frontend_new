// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:duwith_social/Services/Ads%20Service/admob_manager.dart';
import 'package:duwith_social/Services/Ads%20Service/unity_ads_manager.dart';
import 'package:duwith_social/common/getxmessage.dart';
import 'package:duwith_social/models/games_model.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../common/button-widget.dart';
import '../../../common/custom-text.dart';
import '../../../utils/color.dart';
import '../components/box_list.dart';

class DogPreviewScreen extends StatelessWidget {
  final ShopModel shopData;
  DogPreviewScreen({super.key, required this.shopData});

  HomeController homeController = HomeController.instance;

  @override
  Widget build(BuildContext context) {
    var amount = double.parse(shopData.amount.toString());
    var digitalAmount = homeController.formatNumberWithCommasWithDouble(amount);
    return WillPopScope(
      onWillPop: () async {
        // homeController.interstitialAd!.show();
        // homeController.rewardedAd!.show(
        //     onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
        //   // Reward the user for watching an ad.
        // });

        // homeController.showAd(AdManager.rewardedVideoAdPlacementId);
        return true;
      },
      child: Scaffold(
        backgroundColor: shopbackground,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: widthSize(27)),
                child: Center(
                  child: Container(
                    height: heightSize(521),
                    width: constraints.maxWidth,
                    padding: EdgeInsets.only(
                        bottom: heightSize(34),
                        left: widthSize(38),
                        right: widthSize(37),
                        top: heightSize(34)),
                    decoration: BoxDecoration(
                      color: const Color(0xFF590274),
                      borderRadius:
                          BorderRadius.all(Radius.circular(widthSize(20))),
                      border: Border.all(color: const Color(0xFF7E30AF)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: heightSize(173),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                imageUrl: shopData.image,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                imageBuilder: (context, imageprovider) {
                                  return Container(
                                    height: heightSize(150),
                                    width: widthSize(198),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: imageprovider,
                                            fit: BoxFit.fill)),
                                  );
                                },
                              ),
                              CText(
                                text: shopData.shopItemName,
                                size: 18,
                                fontFamily: UsedFonts.poppins,
                                fontWeight: FontWeight.w500,
                                color: textColor,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: widthSize(28)),
                          child: SizedBox(
                            height: heightSize(138),
                            width: constraints.maxWidth,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const CText(
                                        text: "Amount",
                                        size: 12,
                                        fontFamily: UsedFonts.poppins,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFEDDAF9),
                                      ),
                                      shopIconwidget("assets/images/points.png",
                                          digitalAmount, 30, 27, 16, textColor)
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: heightSize(2),
                                  thickness: 1,
                                  color: const Color(0xFF7F219D),
                                ),
                                upgradewidget(
                                    "points per Hour",
                                    shopData.shopReward.toString(),
                                    21,
                                    11,
                                    16,
                                    const Color(0xFFC8B5D3),
                                    textColor),
                                Container(
                                  height: heightSize(40),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF590274),
                                      border: Border.all(
                                          color: const Color(0xFF7E30AF)),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CText(
                                        text: "Duwith Coin",
                                        size: 12,
                                        fontFamily: UsedFonts.poppins,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFC8B5D3),
                                      ),
                                      SizedBox(width: widthSize(30)),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        size: heightSize(15),
                                        color: textColor,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: widthSize(10)),
                          child: SizedBox(
                            height: heightSize(90),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buttonsWidget(
                                    context,
                                    heightSize(44),
                                    constraints.maxWidth,
                                    "Buy",
                                    Colors.white,
                                    15, () {
                                  getSuccessSnackBarEdit(
                                      "Notification", "Coming Soon");
                                }, false, Colors.black),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text:
                                        'By continuing you’ve agreed with our ',
                                    style: TextStyle(
                                        color: textColor,
                                        fontFamily: UsedFonts.poppins,
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            fontSize(11)), // Default text style
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'terms and conditions',
                                        style: TextStyle(
                                            color: mainColor,
                                            fontSize: fontSize(13),
                                            fontFamily: UsedFonts.poppins,
                                            fontWeight: FontWeight.w500),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // Handle the link tap here
                                          },
                                      ),
                                    ],
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
              ),
            );
          },
        ),
      ),
    );
  }
}
