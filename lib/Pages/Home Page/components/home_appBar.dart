import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';

homeAppBar(double width) {
  return SizedBox(
    height: heightSize(44),
    width: width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: heightSize(44),
          width: widthSize(100),
          child: Row(
            children: [
              SizedBox(
                height: heightSize(44),
                width: widthSize(44),
                child: Image.asset(
                  "assets/images/points.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
              const Row(
                children: [
                  CText(
                    text: "1000",
                    size: 11,
                    fontFamily: UsedFonts.poppins,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                  CText(
                    text: "points",
                    color: textColor3,
                    size: 9,
                    fontFamily: UsedFonts.poppins,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: heightSize(20),
          width: widthSize(56),
          child: Row(
            children: [
              Icon(
                Icons.search,
                size: heightSize(20),
                color: textColor,
              ),
              Icon(
                Icons.mark_unread_chat_alt_rounded,
                size: heightSize(20),
                color: textColor,
              )
            ],
          ),
        )
      ],
    ),
  );
}
