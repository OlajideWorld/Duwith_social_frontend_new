// ignore_for_file: must_be_immutable

import 'package:duwith_social/Pages/Earn%20More%20Page/components/spin_wheel_screen.dart';
import 'package:duwith_social/Pages/Earn%20More%20Page/controller/earn_controller.dart';
import 'package:duwith_social/Pages/Earn%20More%20Page/screens/games_screen.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import '../../../common/custom-text.dart';

import '../../../utils/color.dart';

EarnController earnController = EarnController.instance;

earnMoreExtraWidget(Color box1, String headline, String body, String tagline,
    String image, String namegiven) {
  return Expanded(
    child: GestureDetector(
      onTap: () => Get.to(() => GamesScreen(title: namegiven)),
      child: Container(
        height: heightSize(100),
        width: widthSize(174),
        decoration: BoxDecoration(
          color: const Color(0xFF141931),
          border: Border.all(color: Color(0xFF212746)),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(widthSize(10)),
              bottomLeft: Radius.circular(widthSize(10)),
              bottomRight: Radius.circular(widthSize(10))),
        ),
        child: Column(
          children: [
            Container(
              height: heightSize(22),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: box1,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(widthSize(10)),
                    bottomLeft: Radius.circular(widthSize(10)),
                  )),
              child: CText(
                text: headline,
                size: 12,
                fontFamily: UsedFonts.poppins,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFDAF7F9),
              ),
            ),
            SizedBox(height: heightSize(10)),
            Padding(
              padding: EdgeInsets.only(left: widthSize(7)),
              child: SizedBox(
                height: heightSize(32),
                child: Row(
                  children: [
                    SizedBox(
                      height: heightSize(39),
                      width: widthSize(34),
                      child: Image.asset(
                        image,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: widthSize(6),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CText(
                          text: body,
                          size: 14,
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w500,
                          color: textColor,
                        ),
                        CText(
                          text: tagline,
                          size: 10,
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF6D738F),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

earnspinActivity(double width) {
  return SmartDialog.show(builder: (context) {
    return SpinWheelScreen(
      width: width,
    );
  });
}
