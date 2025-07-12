import 'package:duwith_social/Pages/Earn%20More%20Page/controller/earn_controller.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/custom-text.dart';

EarnController earnController = EarnController.instance;

earningPageRowWidgets(
  BuildContext context,
  double width,
) {
  return SizedBox(
    height: heightSize(120),
    width: width,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: earnController.earningPageRowDetails.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: widthSize(20)),
            child: eariningPageRowContainer(
              context,
              earnController.earningPageRowDetails[index]['title']!,
              earnController.earningPageRowDetails[index]['subtitle']!,
              earnController.earningPageRowDetails[index]['button']!,
            ),
          );
        }),
  );
}

eariningPageRowContainer(
    BuildContext context, String text1, String text2, String text3) {
  return Container(
    width: widthSize(120),
    padding: EdgeInsets.all(widthSize(10)),
    decoration: BoxDecoration(
      color: Color(0xFF292933),
      border: Border.all(color: Color(0xFF07A9B4)),
      borderRadius: BorderRadius.all(Radius.circular(widthSize(15))),
    ),
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text1,
          style: GoogleFonts.poppins(
            fontSize: widthSize(15),
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        SizedBox(height: heightSize(8)),
        Text(
          text2,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: widthSize(11),
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        SizedBox(height: heightSize(8)),
        buttonsWidget(context, heightSize(15), widthSize(50), text3,
            const Color(0xFF8C0798), 9, () {}, false, textColor)
      ],
    ),
  );
}

dailyTaskAppBar() {
  return SizedBox(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        backbutton(onTap: () => Get.back()),
        const CText(
          text: "Daily target",
          size: 14,
          fontFamily: UsedFonts.poppins,
          fontWeight: FontWeight.w500,
          color: Color(0xFFB5B2B2),
        ),
        Icon(
          Icons.calendar_month_outlined,
          color: textColor,
          size: heightSize(20),
        )
      ],
    ),
  );
}

dailyTaskChooseType() {
  return Padding(
    padding: EdgeInsets.only(left: widthSize(20)),
    child: SizedBox(
      height: heightSize(30),
      width: widthSize(240),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () async {
              earnController.chooseType.value = 0;
            },
            child: Container(
              height: heightSize(28),
              width: widthSize(57),
              decoration: BoxDecoration(
                color: earnController.chooseType.value == 0
                    ? const Color(0xFF151B2E)
                    : backgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(widthSize(10)),
                ),
              ),
              child: Center(
                child: CText(
                  text: "Daily task",
                  size: 13,
                  fontFamily: UsedFonts.poppins,
                  fontWeight: FontWeight.w500,
                  color: earnController.chooseType.value == 0
                      ? textColor
                      : const Color(0xFFB5B2B2),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              earnController.chooseType.value = 1;
            },
            child: Container(
              height: heightSize(28),
              width: widthSize(52),
              decoration: BoxDecoration(
                color: earnController.chooseType.value == 1
                    ? const Color(0xFF151B2E)
                    : backgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(widthSize(10)),
                ),
              ),
              child: Center(
                child: CText(
                  text: "Streak",
                  size: 13,
                  fontFamily: UsedFonts.poppins,
                  fontWeight: FontWeight.w500,
                  color: earnController.chooseType.value == 1
                      ? textColor
                      : const Color(0xFFB5B2B2),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

dailytaskAdvert(
    {required Color color1,
    required Color color2,
    required Color textColorUsed,
    required String image,
    required BuildContext context}) {
  return GestureDetector(
    // onTap: () => Get.to(() => const ShopUpgradeScreen()),
    child: Container(
      height: heightSize(118),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [color1, color2]),
          borderRadius: BorderRadius.all(Radius.circular(widthSize(15)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: heightSize(24),
                left: widthSize(16),
                bottom: heightSize(34)),
            child: SizedBox(
              height: heightSize(48),
              width: widthSize(200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CText(
                    text: "Daily tasks",
                    size: 16,
                    fontFamily: UsedFonts.poppins,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                  CText(
                    text:
                        "Increase your points by completing all the tasks to claim rewards",
                    size: 12,
                    fontFamily: UsedFonts.poppins,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.start,
                    color: textColorUsed,
                  )
                ],
              ),
            ),
          ),
          Image.asset(
            image,
            fit: BoxFit.fill,
            height: heightSize(113),
          )
        ],
      ),
    ),
  );
}
