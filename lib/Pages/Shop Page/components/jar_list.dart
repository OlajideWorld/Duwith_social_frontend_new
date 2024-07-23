// ignore_for_file: invalid_use_of_protected_member

import 'package:duwith_social/Pages/Shop%20Page/components/dog_list.dart';
import 'package:duwith_social/Pages/Shop%20Page/components/shop_components.dart';
import 'package:duwith_social/Pages/Shop%20Page/screens/jar_preview.dart';
import 'package:duwith_social/Services/Ads%20Service/start_app_manager.dart';
import 'package:duwith_social/utils/demo_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../common/custom-text.dart';
import '../../../utils/color.dart';
import '../../../utils/sizes.dart';
import '../../Home Page/controllers/home_controller.dart';
import '../controller/shop_controller.dart';

HomeController homeController = HomeController.instance;
ShopController shopController = ShopController.instance;

showJarList(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: widthSize(20), right: widthSize(20)),
    child: SizedBox(
      height: heightSize(1070),
      child: Column(
        children: [
          shoptypeAdvert(
              color1: const Color(0xFFE6A94C),
              color2: const Color(0xFFD7350B),
              textColorUsed: const Color(0xFFFBE9CD),
              type: "Jar",
              image: "assets/images/Shop/upgradejar.png",
              context: context),
          SizedBox(height: heightSize(13)),
          shopController.jarList.value.isEmpty
              ? const Center(
                  child: CText(
                    text:
                        "Unable to get the JarList, check internet connection and try again",
                    size: 12,
                    color: timeColor,
                    fontFamily: UsedFonts.poppins,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : Expanded(
                  child: MasonryGridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: shopController.jarList.value.length,
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of items per row
                      ),
                      mainAxisSpacing: widthSize(13),
                      crossAxisSpacing: heightSize(12),
                      itemBuilder: (context, index) {
                        return gridviewWidget(
                            context, shopController.jarList.value[index], () {
                          // StartAppAdsClass().loadInterstitialAd();
                          StartAppAdsClass().loadRewardedVideoAd();
                          Get.to(() => JarPreviewScreen(
                                shopData: shopController.jarList.value[index],
                              ));
                        });
                      }),
                ),
        ],
      ),
    ),
  );
}
