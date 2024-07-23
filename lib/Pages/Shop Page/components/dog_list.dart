// ignore_for_file: invalid_use_of_protected_member

import 'package:cached_network_image/cached_network_image.dart';
import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:duwith_social/Pages/Shop%20Page/components/shop_components.dart';
import 'package:duwith_social/Pages/Shop%20Page/controller/shop_controller.dart';
import 'package:duwith_social/Pages/Shop%20Page/screens/dog_preview.dart';
import 'package:duwith_social/Services/Ads%20Service/unity_ads_manager.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/models/games_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../common/custom-text.dart';
import '../../../utils/color.dart';
import '../../../utils/sizes.dart';

HomeController homeController = HomeController.instance;
ShopController shopController = ShopController.instance;

showDogList(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: widthSize(20), right: widthSize(20)),
    child: SizedBox(
      height: heightSize(1300),
      child: Column(
        children: [
          shoptypeAdvert(
              color1: const Color(0xFF8B11A9),
              color2: const Color(0xFFA408A7),
              textColorUsed: const Color(0xFFEAB6FC),
              type: "dog",
              image: "assets/images/Shop/opendog.png",
              context: context),
          SizedBox(height: heightSize(13)),
          shopController.dogsList.value.isEmpty
              ? const Center(
                  child: CText(
                    text:
                        "Unable to get the DogsList, check internet connection and try again",
                    size: 12,
                    color: timeColor,
                    fontFamily: UsedFonts.poppins,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : Expanded(
                  child: MasonryGridView.builder(
                      itemCount: shopController.dogsList.value.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of items per row
                      ),
                      mainAxisSpacing: widthSize(13),
                      crossAxisSpacing: heightSize(12),
                      itemBuilder: (context, index) {
                        return gridviewWidget(
                            context, shopController.dogsList.value[index], () {
                          // AdmobAdsClass().loadRewardedAd(
                          //     adUnitId: AdmobAdsClass().rewardedAdsId);
                          homeController
                              .loadAd(AdManager.rewardedVideoAdPlacementId);
                          Get.to(() => DogPreviewScreen(
                                shopData: shopController.dogsList.value[index],
                              ));
                        });
                      }),
                ),
        ],
      ),
    ),
  );
}

gridviewWidget(BuildContext context, ShopModel shopData, VoidCallback onTap) {
  var amount = double.parse(shopData.amount.toString());
  var digitalAmount = homeController.formatNumberWithCommasWithDouble(amount);
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      height: shopData.isItemBig ? heightSize(300) : heightSize(250),
      padding: EdgeInsets.symmetric(vertical: heightSize(15)),
      decoration: const BoxDecoration(
          color: Color(0xFF151B2E),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: SizedBox(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: shopData.image,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              imageBuilder: (context, imageprovider) {
                return Container(
                  height: heightSize(100),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageprovider, fit: BoxFit.fill)),
                );
              },
            ),
            const Spacer(),
            SizedBox(
              height: heightSize(100),
              child: Column(
                children: [
                  SizedBox(
                    height: heightSize(40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CText(
                          text: shopData.shopItemName,
                          color: const Color(0xFFDCDCDC),
                          size: 12,
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w400,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: heightSize(26),
                              width: widthSize(26),
                              child: Image.asset(
                                "assets/images/points.png",
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            CText(
                              text: digitalAmount,
                              size: 15,
                              fontFamily: UsedFonts.archivo,
                              fontWeight: FontWeight.w600,
                              color: textColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  buttonsWidget(context, heightSize(30), widthSize(87), "Buy",
                      mainColor, 12, onTap, false, textColor)
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
