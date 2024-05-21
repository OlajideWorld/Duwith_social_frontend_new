import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';

mainprofileAppBar(double width) {
  return Container(
    height: heightSize(88),
    width: width,
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      color: faintColor,
    ),
    padding: EdgeInsets.only(top: heightSize(55)),
    child: const CText(
      text: "Profile",
      size: 13.22,
      color: textColor,
      fontFamily: UsedFonts.poppins,
      fontWeight: FontWeight.w500,
    ),
  );
}

profileWidget(String image, String name, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      height: heightSize(43),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: heightSize(35),
                width: widthSize(179),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: heightSize(35),
                      width: widthSize(35),
                      decoration: BoxDecoration(
                          color: const Color(0xFF343232),
                          borderRadius: BorderRadius.all(
                              Radius.circular(widthSize(19.5)))),
                      child: Padding(
                        padding: EdgeInsets.all(widthSize(9)),
                        child: Image.asset(
                          image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(width: widthSize(8)),
                    CText(
                      text: name,
                      size: 13,
                      color: const Color(0xFFE9E9E9),
                      fontFamily: UsedFonts.poppins,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right_rounded,
                size: heightSize(16),
                color: textColor,
              )
            ],
          ),
          Divider(
              height: heightSize(3),
              thickness: 1,
              color: const Color(0xFF3C3C3C)),
        ],
      ),
    ),
  );
}
