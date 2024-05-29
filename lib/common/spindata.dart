import 'package:duwith_social/common/custom-text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

import '../utils/color.dart';
import '../utils/sizes.dart';

List<FortuneItem> wheelitems = [
  FortuneItem(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CText(
          text: "90",
          size: 18,
          fontFamily: UsedFonts.archivo,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
        SizedBox(width: widthSize(10)),
        SizedBox(
          height: heightSize(44),
          width: widthSize(44),
          child: Image.asset(
            "assets/images/points.png",
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    ),
  ),
  FortuneItem(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CText(
          text: "20",
          size: 18,
          fontFamily: UsedFonts.archivo,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
        SizedBox(width: widthSize(10)),
        SizedBox(
          height: heightSize(44),
          width: widthSize(44),
          child: Image.asset(
            "assets/images/points.png",
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    ),
  ),
  FortuneItem(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CText(
          text: "45",
          size: 18,
          fontFamily: UsedFonts.archivo,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
        SizedBox(width: widthSize(10)),
        SizedBox(
          height: heightSize(44),
          width: widthSize(44),
          child: Image.asset(
            "assets/images/points.png",
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    ),
  ),
  FortuneItem(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CText(
          text: "12",
          size: 18,
          fontFamily: UsedFonts.archivo,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
        SizedBox(width: widthSize(10)),
        SizedBox(
          height: heightSize(44),
          width: widthSize(44),
          child: Image.asset(
            "assets/images/points.png",
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    ),
  ),
  FortuneItem(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CText(
          text: "23",
          size: 18,
          fontFamily: UsedFonts.archivo,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
        SizedBox(width: widthSize(10)),
        SizedBox(
          height: heightSize(44),
          width: widthSize(44),
          child: Image.asset(
            "assets/images/points.png",
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    ),
  )
];
