import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/custom-text.dart';
import '../../../utils/color.dart';

socialBindingAppBar() {
  return SizedBox(
    child: Row(
      children: [
        backbutton(onTap: () => Get.back()),
        SizedBox(width: widthSize(122)),
        Text(
          "Socials",
          style: GoogleFonts.podkova(
            fontSize: widthSize(18),
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
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
              vertical: heightSize(280), horizontal: widthSize(34)),
          child: Container(
            height: heightSize(100),
            width: width,
            padding: EdgeInsets.symmetric(
                vertical: heightSize(15), horizontal: widthSize(30)),
            decoration: BoxDecoration(
              color: const Color(0xFF121726),
              borderRadius: BorderRadius.all(Radius.circular(widthSize(10))),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.cancel_outlined,
                      color: textColor, size: heightSize(20)),
                ),
                Text(
                  headings,
                  style: GoogleFonts.poppins(
                    fontSize: widthSize(20),
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  subtext,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: widthSize(15),
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF979DAD),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                      height: heightSize(50),
                      width: width,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A49),
                        borderRadius:
                            BorderRadius.all(Radius.circular(widthSize(16))),
                      ),
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.poppins(
                            fontSize: widthSize(12),
                            fontWeight: FontWeight.w400,
                            color: textColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: ontap,
                  child: Container(
                    height: heightSize(50),
                    width: width,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF381D),
                      borderRadius:
                          BorderRadius.all(Radius.circular(widthSize(16))),
                    ),
                    child: Center(
                      child: Text(
                        "Confirm",
                        style: GoogleFonts.poppins(
                          fontSize: widthSize(12),
                          fontWeight: FontWeight.w400,
                          color: textColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}

referralTopWidget(BuildContext context, double width) {
  return Container(
    height: heightSize(150),
    width: width,
    padding: EdgeInsets.symmetric(
        vertical: heightSize(20), horizontal: widthSize(20)),
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xFFBE6D00),
          Color(0xFF741A9E),
          Color(0xFF360E51),
        ],
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: widthSize(250),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Invite Your Friends to Join the Fun!',
                style: GoogleFonts.poppins(
                  fontSize: widthSize(13),
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: heightSize(10)),
              SizedBox(
                width: widthSize(150),
                child: Text(
                  'Earn rewards for every friend who signs up and joins our community..',
                  style: GoogleFonts.poppins(
                    fontSize: widthSize(13),
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Image.asset(
          "assets/images/Earn/gift.png",
          height: heightSize(60),
          width: widthSize(60),
        )
      ],
    ),
  );
}
