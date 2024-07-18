// ignore_for_file: must_be_immutable

import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:duwith_social/Pages/Earn%20More%20Page/components/earn_money_component.dart';
import 'package:duwith_social/Pages/Earn%20More%20Page/controller/earn_controller.dart';
import 'package:duwith_social/Pages/Earn%20More%20Page/screens/games_screen.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../common/button-widget.dart';
import '../../../common/custom-text.dart';
import '../../../common/spindata.dart';
import '../../../utils/color.dart';

class EarnTapMoneyWidget extends StatefulWidget {
  EarnTapMoneyWidget({super.key});

  @override
  State<EarnTapMoneyWidget> createState() => _EarnTapMoneyWidgetState();
}

class _EarnTapMoneyWidgetState extends State<EarnTapMoneyWidget> {
  EarnController earnController = EarnController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        earnController.isAnimating.value = !earnController.isAnimating.value;
        earnController.coinPosition.value = Offset(width - widthSize(59) - 100,
            heightSize(118)); // Position near the jar
      },
      child: Bounceable(
        onTap: () {},
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
    );
  }

  void queueAnimation() {
    earnController.tapCount.value++;
    earnController.animationQueue.add(startAnimation);
    if (!earnController.isAnimating.value) {
      processNextAnimation();
    }
  }

  void startAnimation() {
    earnController.isAnimating.value = true;
    earnController.coinPosition.value = Offset(
        earnController.width.value - widthSize(59) - 20,
        heightSize(118)); // Position near the jar

    Future.delayed(const Duration(seconds: 1), () {
      earnController.isAnimating.value = false;
      earnController.coinPosition.value = const Offset(0, 0); // Reset position
      earnController.tapCount.value--;
      processNextAnimation();
    });
  }

  void processNextAnimation() {
    if (earnController.tapCount.value > 0) {
      final animation = earnController.animationQueue.removeAt(0);
      animation();
    }
  }
}

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
  StreamController<int> controller = StreamController<int>();
  return SmartDialog.show(builder: (context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
      child: Container(
        height: heightSize(456),
        width: width,
        padding: EdgeInsets.only(
            top: heightSize(34),
            left: widthSize(18),
            right: widthSize(20),
            bottom: heightSize(34)),
        decoration: ShapeDecoration(
          color: const Color(0xFF0E1528),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: heightSize(44),
                width: widthSize(179),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CText(
                      text: "Spin and earn",
                      color: Colors.white,
                      size: 20,
                      textAlign: TextAlign.center,
                      fontFamily: UsedFonts.poppins,
                      fontWeight: FontWeight.w600,
                    ),
                    CText(
                      text: "Spin and earn amazing rewards",
                      color: Colors.white,
                      size: 12,
                      textAlign: TextAlign.center,
                      fontFamily: UsedFonts.poppins,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: heightSize(267),
                width: widthSize(300),
                child: FortuneWheel(
                  duration: const Duration(seconds: 5),
                  animateFirst: false,
                  selected: controller.stream,
                  items: wheelitems,
                ),
              ),
              buttonsWidget(
                  context,
                  heightSize(40),
                  widthSize(264),
                  "Spin",
                  mainColor,
                  12,
                  () => controller.add(Random().nextInt(wheelitems.length)),
                  false,
                  Colors.white)
            ]),
      ),
    );
  });
}
