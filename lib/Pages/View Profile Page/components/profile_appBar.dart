import "package:duwith_social/common/button-widget.dart";
import "package:duwith_social/common/custom-text.dart";
import "package:duwith_social/utils/color.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:get/get.dart";

profileAppBar() {
  return SizedBox(
    height: heightSize(32),
    child: Row(
      children: [
        backbutton(onTap: () => Get.back()),
        const CText(
          text: "Profile",
          size: 12,
          fontFamily: UsedFonts.poppins,
          fontWeight: FontWeight.w500,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: heightSize(24),
            width: widthSize(24),
            alignment: Alignment.center,
            decoration: const ShapeDecoration(
                color: Color(0xFF1F7BE8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
            child: Icon(
              Icons.more_horiz_outlined,
              color: textColor,
              size: heightSize(16),
            ),
          ),
        )
      ],
    ),
  );
}

profileData(String name, String image, String nickname, String description,
    String followers, String following, String postNumber) {
  return SizedBox(
    height: heightSize(192),
    width: widthSize(201),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: textColor,
          radius: widthSize(30),
          child: CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: widthSize(25),
          ),
        ),
        SizedBox(width: widthSize(8)),
        SizedBox(
          height: heightSize(28),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CText(
                    text: name,
                    size: 13,
                    fontFamily: UsedFonts.poppins,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                  CText(
                    text: nickname,
                    size: 8,
                    fontFamily: UsedFonts.poppins,
                    color: const Color(0xFF84B3EB),
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              SizedBox(width: widthSize(3)),
              SizedBox(
                height: heightSize(16),
                width: widthSize(16),
                child: Image.asset(
                  "assets/images/verified.png",
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
        SizedBox(width: widthSize(8)),
        CText(
          text: description,
          fontFamily: UsedFonts.poppins,
          fontWeight: FontWeight.w500,
          size: 12,
          color: const Color(0xFFC2DDFD),
        ),
        SizedBox(width: widthSize(20)),
        SizedBox(
          height: heightSize(49),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              numbersWidget(followers, "Followers"),
              SizedBox(width: widthSize(20)),
              VerticalDivider(
                width: widthSize(2),
                color: const Color(0xFF171717),
              ),
              SizedBox(width: widthSize(20)),
              numbersWidget(following, "Following"),
              SizedBox(width: widthSize(20)),
              VerticalDivider(
                width: widthSize(2),
                color: const Color(0xFF171717),
              ),
              SizedBox(width: widthSize(20)),
              numbersWidget(postNumber, "Posts")
            ],
          ),
        )
      ],
    ),
  );
}

numbersWidget(String text1, String text2) {
  return SizedBox(
    height: heightSize(31),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CText(
          text: text1,
          size: 15,
          fontFamily: UsedFonts.poppins,
          fontWeight: FontWeight.w600,
        ),
        CText(
          text: text2,
          size: 11,
          fontFamily: UsedFonts.poppins,
          fontWeight: FontWeight.w500,
        )
      ],
    ),
  );
}
