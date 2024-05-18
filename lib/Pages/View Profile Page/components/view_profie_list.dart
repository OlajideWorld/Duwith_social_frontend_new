import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';

viewProfilePost(String image, String value) {
  return Container(
    height: heightSize(112),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: heightSize(88),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(widthSize(10)),
                  topRight: Radius.circular(widthSize(10))),
              image: DecorationImage(image: AssetImage(image))),
        ),
        SizedBox(height: heightSize(5)),
        SizedBox(
          height: heightSize(12),
          child: Row(
            children: [
              const Icon(
                Icons.visibility_outlined,
                size: 12,
                color: textColor,
              ),
              SizedBox(width: widthSize(5)),
              CText(
                text: "$value Views",
                color: textColor,
                size: 9,
                fontFamily: UsedFonts.poppins,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        )
      ],
    ),
  );
}
