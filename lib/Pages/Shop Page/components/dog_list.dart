// ignore_for_file: invalid_use_of_protected_member

import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:duwith_social/Pages/Shop%20Page/components/shop_components.dart';
import 'package:duwith_social/Pages/Shop%20Page/screens/dog_preview.dart';
import 'package:duwith_social/Pages/Shop%20Page/screens/upgrade_screen.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../common/custom-text.dart';
import '../../../utils/color.dart';
import '../../../utils/sizes.dart';

HomeController homeController = HomeController.instance;

showDogList(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: widthSize(20), right: widthSize(20)),
    child: SizedBox(
      height: heightSize(1070),
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
          Expanded(
            child: MasonryGridView.builder(
                itemCount: homeController.dogsList.value.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of items per row
                ),
                mainAxisSpacing: widthSize(13),
                crossAxisSpacing: heightSize(12),
                itemBuilder: (context, index) {
                  return gridviewWidget(
                      homeController.dogsList.value[index].image,
                      homeController.dogsList.value[index].name,
                      homeController.dogsList.value[index].amount,
                      context,
                      homeController.dogsList.value[index].isBig, () {
                    Get.to(() => DogPreviewScreen());
                  });
                }),
          ),
        ],
      ),
    ),
  );
}

gridviewWidget(String image, String name, String amount, BuildContext context,
    bool isBig, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      height: isBig ? heightSize(250) : heightSize(200),
      padding: EdgeInsets.symmetric(vertical: heightSize(15)),
      decoration: const BoxDecoration(
          color: Color(0xFF151B2E),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: SizedBox(
        child: Column(
          children: [
            SizedBox(
              height: heightSize(100),
              child: Image.asset(image, fit: BoxFit.fitHeight),
            ),
            const Spacer(),
            SizedBox(
              height: heightSize(65),
              width: widthSize(87),
              child: Column(
                children: [
                  SizedBox(
                    height: heightSize(40),
                    width: widthSize(74),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CText(
                          text: name,
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
                              text: amount,
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
                  buttonsWidget(context, heightSize(21), widthSize(87), "Buy",
                      mainColor, 12, () {}, false, textColor)
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
