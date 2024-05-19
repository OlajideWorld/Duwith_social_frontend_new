import 'dart:ui';

import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/common/text-field.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

HomeController homeController = HomeController.instance;

walletWithdrawBalance(double width) {
  return SizedBox(
    height: heightSize(114),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CText(
              text: "Withdrawable Balance",
              size: 9,
              color: Color(0xFF848484),
              fontFamily: UsedFonts.poppins,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(width: widthSize(5)),
            SizedBox(
              height: heightSize(12),
              width: widthSize(12),
              child: SvgPicture.asset(
                "assets/images/circlewarning.svg",
                fit: BoxFit.fitHeight,
              ),
            )
          ],
        ),
        Row(
          children: [
            SizedBox(
              height: heightSize(44),
              width: widthSize(34),
              child: Image.asset(
                "assets/images/points.png",
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(width: widthSize(5)),
            CText(
              text: homeController.formatNumberWithCommasWithDouble(100000),
              size: 28,
              fontFamily: UsedFonts.poppins,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ],
        ),
        const CText(
          text: "\$12,000",
          size: 12,
          fontFamily: UsedFonts.poppins,
          fontWeight: FontWeight.w600,
          color: Color(0xFFC0C0C0),
        ),
        Container(
          height: heightSize(30),
          width: width,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xFF2A303C),
              borderRadius: BorderRadius.all(Radius.circular(widthSize(8)))),
          padding: EdgeInsets.symmetric(horizontal: widthSize(9)),
          child: const CText(
            text: "Only earned coins can be withdrawn. Purchased coins cannot.",
            size: 9,
            fontFamily: UsedFonts.poppins,
            fontWeight: FontWeight.w500,
            color: highlightColor,
          ),
        )
      ],
    ),
  );
}

walletWithdrawMethodDetails(BuildContext context, double width) {
  return SizedBox(
    height: homeController.selectedWithdrawal.value == 0
        ? heightSize(330)
        : heightSize(400),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        selectWidthdrawOption(),
        SizedBox(height: heightSize(16)),
        widthdrawFormDetails(context, width),
      ],
    ),
  );
}

selectWidthdrawOption() {
  return SizedBox(
      height: heightSize(32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              homeController.selectedWithdrawal.value = 0;
            },
            child: Container(
              height: heightSize(32),
              width: widthSize(80),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                color: homeController.selectedWithdrawal.value == 0
                    ? faintColor
                    : backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(
                    widthSize(10),
                  )),
                ),
              ),
              child: CText(
                text: "Paypal",
                size: 12,
                fontFamily: UsedFonts.poppins,
                fontWeight: homeController.selectedWithdrawal.value == 0
                    ? FontWeight.w600
                    : FontWeight.w400,
                color: homeController.selectedWithdrawal.value == 0
                    ? textColor
                    : const Color(0xFFB5B2B2),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              homeController.selectedWithdrawal.value = 1;
            },
            child: Container(
              height: heightSize(32),
              width: widthSize(117),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                color: homeController.selectedWithdrawal.value == 1
                    ? faintColor
                    : backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(
                    widthSize(10),
                  )),
                ),
              ),
              child: CText(
                text: "Bank account",
                size: 12,
                fontFamily: UsedFonts.poppins,
                fontWeight: homeController.selectedWithdrawal.value == 1
                    ? FontWeight.w600
                    : FontWeight.w400,
                color: homeController.selectedWithdrawal.value == 1
                    ? textColor
                    : const Color(0xFFB5B2B2),
              ),
            ),
          )
        ],
      ));
}

widthdrawFormDetails(BuildContext context, double width) {
  return Container(
    height: homeController.selectedWithdrawal.value == 0
        ? heightSize(282)
        : heightSize(352),
    width: width,
    decoration: const BoxDecoration(color: faintColor),
    padding: EdgeInsets.only(
        top: heightSize(21), left: widthSize(25), right: widthSize(25)),
    child: Column(
      children: [
        homeController.selectedWithdrawal.value == 0
            ? widthDrawSelectedForm2(width)
            : widthDrawSelectedForm1(width),
        SizedBox(height: heightSize(16)),
        SizedBox(
          height: heightSize(50),
          child: InputTextField(
              obscureText: false,
              controller: homeController.amount,
              hintText: "Enter amount",
              showPrefixIcon: false,
              innerColor: const Color(0xFF313133),
              textColor: textColor,
              differentiate: 1),
        ),
        SizedBox(height: heightSize(16)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            fixedValueWithdraw(10.00),
            SizedBox(width: widthSize(5)),
            fixedValueWithdraw(15.00),
            SizedBox(width: widthSize(5)),
            fixedValueWithdraw(20.00),
            SizedBox(width: widthSize(5)),
            fixedValueWithdraw(25.00)
          ],
        ),
        SizedBox(height: heightSize(20)),
        buttonsWidget(context, heightSize(50), width, "Continue", mainColor, 10,
            () {}, false)
      ],
    ),
  );
}

widthDrawSelectedForm1(double width) {
  return SizedBox(
    height: heightSize(120),
    width: width,
    child: Column(
      children: [
        SizedBox(
          height: heightSize(50),
          child: InputTextField(
              obscureText: false,
              controller: homeController.accountnumber,
              showPrefixIcon: false,
              hintText: "Account number",
              innerColor: const Color(0xFF313133),
              textColor: textColor,
              differentiate: 1),
        ),
        SizedBox(height: heightSize(16)),
        SizedBox(
          height: heightSize(50),
          child: InputTextField(
              obscureText: false,
              controller: homeController.bankName,
              showPrefixIcon: false,
              hintText: "Bank name",
              innerColor: const Color(0xFF313133),
              textColor: textColor,
              differentiate: 1),
        ),
      ],
    ),
  );
}

widthDrawSelectedForm2(double width) {
  return SizedBox(
    height: heightSize(60),
    width: width,
    child: Column(
      children: [
        SizedBox(
          height: heightSize(50),
          child: InputTextField(
              obscureText: false,
              controller: homeController.email,
              showPrefixIcon: false,
              hintText: "Enter email address",
              innerColor: const Color(0xFF313133),
              textColor: textColor,
              differentiate: 1),
        ),
      ],
    ),
  );
}

fixedValueWithdraw(double value) {
  return Container(
    height: heightSize(32),
    width: widthSize(62),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: const Color(0xFF313133),
        borderRadius: BorderRadius.all(Radius.circular(widthSize(15)))),
    child: CText(
      text: "\$$value",
      size: 12,
      fontFamily: UsedFonts.poppins,
      fontWeight: FontWeight.w400,
      color: textColor,
    ),
  );
}
