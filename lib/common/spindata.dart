import 'package:duwith_social/common/custom-text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

import '../utils/color.dart';
import '../utils/sizes.dart';

List<FortuneItem> wheelitems = [
  //0
  FortuneItem(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: heightSize(20),
          width: widthSize(20),
          child: Image.asset(
            "assets/images/points.png",
            fit: BoxFit.fitHeight,
          ),
        ),
        const CText(
          text: "2,000",
          size: 18,
          fontFamily: UsedFonts.archivo,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
      ],
    ),
  ),

  // 1
  FortuneItem(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: heightSize(20),
          width: widthSize(20),
          child: Image.asset(
            "assets/images/points.png",
            fit: BoxFit.fitHeight,
          ),
        ),
        const CText(
          text: "4,000",
          size: 18,
          fontFamily: UsedFonts.archivo,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
      ],
    ),
  ),

  // 2
  FortuneItem(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: heightSize(20),
          width: widthSize(20),
          child: Image.asset(
            "assets/images/points.png",
            fit: BoxFit.fitHeight,
          ),
        ),
        const CText(
          text: "2,000",
          size: 18,
          fontFamily: UsedFonts.archivo,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
      ],
    ),
  ),

  // 3
  FortuneItem(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: heightSize(20),
          width: widthSize(20),
          child: Image.asset(
            "assets/images/points.png",
            fit: BoxFit.fitHeight,
          ),
        ),
        const CText(
          text: "45,000",
          size: 18,
          fontFamily: UsedFonts.archivo,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
      ],
    ),
  ),

  //4
  FortuneItem(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: heightSize(20),
          width: widthSize(20),
          child: Image.asset(
            "assets/images/points.png",
            fit: BoxFit.fitHeight,
          ),
        ),
        const CText(
          text: "1,200",
          size: 18,
          fontFamily: UsedFonts.archivo,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
      ],
    ),
  ),

  // 5
  FortuneItem(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: heightSize(20),
          width: widthSize(20),
          child: Image.asset(
            "assets/images/points.png",
            fit: BoxFit.fitHeight,
          ),
        ),
        const CText(
          text: "23,000",
          size: 18,
          fontFamily: UsedFonts.archivo,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
      ],
    ),
  ),

// 6
  FortuneItem(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: heightSize(20),
          width: widthSize(20),
          child: Image.asset(
            "assets/images/points.png",
            fit: BoxFit.fitHeight,
          ),
        ),
        const CText(
          text: "70,000",
          size: 18,
          fontFamily: UsedFonts.archivo,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
      ],
    ),
  ),
];
