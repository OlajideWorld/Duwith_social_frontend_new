import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../utils/color.dart";

statusWidget({required String Image, required String text}) {
  return SizedBox(
    height: heightSize(55),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: heightSize(36),
          width: widthSize(36),
          padding: EdgeInsets.all(widthSize(2)),
          decoration: const ShapeDecoration(
            shape: OvalBorder(),
            color: textColor,
          ),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(Image),
          ),
        ),
        Text(
          text,
          style: GoogleFonts.poppins(
            color: textColor,
            fontSize: fontSize(12),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}

numberOfMessages({required String number}) {
  return Container(
    // height: heightSize(15),
    // width: widthSize(15),
    padding: EdgeInsets.all(widthSize(5)),
    decoration: BoxDecoration(
      color: mainColor,
      borderRadius: BorderRadius.circular(widthSize(35)),
    ),
    child: Text(
      number,
      style: GoogleFonts.poppins(
        color: textColor,
        fontSize: fontSize(10),
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

chatwithPeople(
    {required String image,
    required double width,
    required String nameText,
    required String text,
    required String dayTime,
    required Color testColor,
    required int number}) {
  return Container(
    height: heightSize(65),
    width: width,
    padding: EdgeInsets.symmetric(
        horizontal: widthSize(10), vertical: heightSize(10)),
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color(0xFF1F2138),
      ),
      borderRadius: BorderRadius.circular(widthSize(10)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: widthSize(290),
          height: heightSize(40),
          child: Row(
            children: [
              CircleAvatar(
                radius: widthSize(20),
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(image),
              ),
              SizedBox(width: widthSize(8)),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameText,
                    style: GoogleFonts.poppins(
                      color: textColor,
                      fontSize: fontSize(14),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    text,
                    style: GoogleFonts.poppins(
                      color: testColor,
                      fontSize: fontSize(12),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: heightSize(40),
          child: Column(
            children: [
              Text(
                dayTime,
                style: GoogleFonts.poppins(
                  color: textColor,
                  fontSize: fontSize(14),
                  fontWeight: FontWeight.w500,
                ),
              ),
              numberOfMessages(
                number: number.toString(),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
