import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/custom-text.dart';
import '../../../utils/color.dart';

socialBindingAppBar() {
  return SizedBox(
    child: Row(
      children: [
        backbutton(onTap: () => Get.back()),
        SizedBox(width: widthSize(122)),
        const CText(
          text: "Socials",
          size: 13,
          color: textColor,
          fontFamily: UsedFonts.poppins,
          fontWeight: FontWeight.w600,
        ),
      ],
    ),
  );
}

referralAppBar() {
  return SizedBox(
    child: Row(
      children: [
        backbutton(onTap: () => Get.back()),
        SizedBox(width: widthSize(122)),
        const CText(
          text: "Referral",
          size: 13,
          color: textColor,
          fontFamily: UsedFonts.poppins,
          fontWeight: FontWeight.w600,
        ),
      ],
    ),
  );
}

referralCodeContainer(double width) {
  return Container(
    height: heightSize(125),
    width: width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(widthSize(10))),
        color: const Color.fromARGB(255, 29, 36, 61)),
    padding: EdgeInsets.only(
        top: heightSize(21),
        bottom: heightSize(21),
        left: widthSize(13),
        right: widthSize(22)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: widthSize(252),
          height: heightSize(32),
          child: Row(
            children: [
              Image.asset(
                "assets/images/referral1.png",
                fit: BoxFit.fill,
                height: heightSize(32),
                width: widthSize(32),
              ),
              SizedBox(width: widthSize(8)),
              const SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CText(
                      text: "Referral code",
                      size: 17,
                      fontFamily: UsedFonts.poppins,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                    CText(
                      text: "Invite your friends to earn more points",
                      size: 12,
                      fontFamily: UsedFonts.poppins,
                      fontWeight: FontWeight.w500,
                      color: textColor3,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          height: heightSize(34),
          width: width,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 45, 54, 82),
              borderRadius: BorderRadius.all(Radius.circular(widthSize(10)))),
          padding: EdgeInsets.symmetric(
              vertical: heightSize(9), horizontal: widthSize(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CText(
                text: "sorfohofhjkfhjfvgmmmmmmmmmmmmm",
                size: 12,
                fontFamily: UsedFonts.poppins,
                fontWeight: FontWeight.w400,
                color: textColor3,
              ),
              Icon(
                Icons.content_copy_outlined,
                color: const Color(0xFF0BCEDB),
                size: heightSize(16),
              )
            ],
          ),
        )
      ],
    ),
  );
}

logoutDetails(BuildContext context, String headings, String subtext,
    double width, VoidCallback ontap) {
  return showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(
              vertical: heightSize(200), horizontal: widthSize(34)),
          child: Container(
            height: heightSize(300),
            width: width,
            padding: EdgeInsets.symmetric(
                vertical: heightSize(54), horizontal: widthSize(30)),
            decoration: BoxDecoration(
              color: const Color(0xFF151B2E),
              borderRadius: BorderRadius.all(Radius.circular(widthSize(10))),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CText(
                  text: headings,
                  color: Colors.white,
                  size: 19,
                  textAlign: TextAlign.center,
                  fontFamily: UsedFonts.poppins,
                  fontWeight: FontWeight.w600,
                ),
                CText(
                  text: subtext,
                  color: const Color(0xFF979DAD),
                  size: 14,
                  textAlign: TextAlign.center,
                  fontFamily: UsedFonts.poppins,
                  fontWeight: FontWeight.w400,
                ),
                buttonsWidget(
                    context,
                    heightSize(40),
                    width,
                    "Cancel",
                    const Color(0xFF2A2A49),
                    12,
                    () => Get.back(),
                    false,
                    textColor),
                buttonsWidget(context, heightSize(40), width, "Confirm",
                    const Color(0xFFFF381D), 12, ontap, false, textColor)
              ],
            ),
          ),
        );
      });
}
