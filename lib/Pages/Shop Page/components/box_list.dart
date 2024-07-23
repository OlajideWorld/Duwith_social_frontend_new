// ignore_for_file: invalid_use_of_protected_member

import 'package:duwith_social/Pages/Shop%20Page/components/dog_list.dart';
import 'package:duwith_social/Pages/Shop%20Page/components/shop_components.dart';
import 'package:duwith_social/Pages/Shop%20Page/screens/chest_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../common/custom-text.dart';
import '../../../utils/color.dart';
import '../../../utils/sizes.dart';
import '../../Home Page/controllers/home_controller.dart';
import '../controller/shop_controller.dart';

HomeController homeController = HomeController.instance;
ShopController shopController = ShopController.instance;

showBoxList(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: widthSize(20), right: widthSize(20)),
    child: SizedBox(
      height: heightSize(1200),
      child: Column(
        children: [
          shoptypeAdvert(
              color1: const Color(0xFFE5AC45),
              color2: const Color(0xFFB96400),
              textColorUsed: const Color(0xFFFBE9CD),
              type: "Box",
              image: "assets/images/Shop/upgradebox.png",
              context: context),
          SizedBox(height: heightSize(13)),
          shopController.boxList.value.isEmpty
              ? const Center(
                  child: CText(
                    text:
                        "Unable to get the Treasure Boxes, check internet connection and try again",
                    size: 12,
                    color: timeColor,
                    fontFamily: UsedFonts.poppins,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : Expanded(
                  child: MasonryGridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: shopController.boxList.value.length,
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of items per row
                      ),
                      mainAxisSpacing: widthSize(13),
                      crossAxisSpacing: heightSize(12),
                      itemBuilder: (context, index) {
                        return gridviewWidget(
                            context, shopController.boxList.value[index], () {
                          Get.to(() => ChestPrevieeScreen(
                                shopData: shopController.boxList.value[index],
                              ));
                        });
                      }),
                ),
        ],
      ),
    ),
  );
}

upgrade2widget(double width) {
  return Container(
    height: heightSize(200),
    alignment: Alignment.center,
    width: width,
    padding: EdgeInsets.symmetric(
        horizontal: widthSize(22), vertical: heightSize(18)),
    decoration: BoxDecoration(
      color: const Color(0xFF590274),
      borderRadius: BorderRadius.all(Radius.circular(widthSize(20))),
      border: Border.all(color: const Color(0xFF7E30AF)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: heightSize(65),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CText(
                text: "What you can find here",
                size: 12,
                fontFamily: UsedFonts.poppins,
                fontWeight: FontWeight.w400,
                color: Color(0xFFCCB2DB),
              ),
              Divider(
                height: heightSize(2),
                thickness: 1,
                color: const Color(0xFF7F219D),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  shopIconwidget("assets/images/Shop/shopicon.png",
                      "Duwith Coin(15%)", 20, 18, 12, const Color(0xFFEDDAF9)),
                  shopIconwidget("assets/images/Shop/shopicon2.png",
                      "Duwith Gold(5%)", 20, 18, 12, const Color(0xFFEDDAF9))
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: shopIconwidget("assets/images/points.png",
                    "Duwith Saphire", 20, 18, 12, const Color(0xFFEDDAF9)),
              )
            ],
          ),
        ),
        SizedBox(
          height: heightSize(65),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CText(
                text: "Other assets",
                size: 12,
                fontFamily: UsedFonts.poppins,
                fontWeight: FontWeight.w400,
                color: Color(0xFFCCB2DB),
              ),
              Divider(
                height: heightSize(2),
                thickness: 1,
                color: const Color(0xFF7F219D),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  shopIconwidget("assets/images/Shop/shopicon.png",
                      "Elementary(1.3%)", 20, 18, 12, const Color(0xFFEDDAF9)),
                  shopIconwidget("assets/images/Shop/shopicon2.png",
                      "Smart(5%)", 20, 18, 12, const Color(0xFFEDDAF9))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  shopIconwidget("assets/images/points.png", "Like 2.7", 20, 18,
                      12, const Color(0xFFEDDAF9)),
                  shopIconwidget("assets/images/points.png", "Simple (5.5%)",
                      20, 18, 12, const Color(0xFFEDDAF9)),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}

shopIconwidget(String image, String textUsed, double height, double imageheight,
    double fontsize, Color textusedColor) {
  return SizedBox(
    height: heightSize(height),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: heightSize(imageheight),
            child: Image.asset(
              image,
              fit: BoxFit.fitHeight,
            )),
        CText(
          text: textUsed,
          size: fontsize,
          fontFamily: UsedFonts.poppins,
          fontWeight: FontWeight.w600,
          color: textusedColor,
        ),
      ],
    ),
  );
}

upgradewidget(
    String textused,
    String textused2,
    double height,
    double fontsize1,
    double fontsize2,
    Color textUsedcolor1,
    Color textUsedcolor2) {
  return SizedBox(
    height: heightSize(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CText(
          text: textused,
          size: fontsize1,
          fontFamily: UsedFonts.poppins,
          fontWeight: FontWeight.w600,
          color: textUsedcolor1,
        ),
        CText(
          text: textused2,
          size: fontsize2,
          fontFamily: UsedFonts.poppins,
          fontWeight: FontWeight.w600,
          color: textUsedcolor2,
        ),
      ],
    ),
  );
}
