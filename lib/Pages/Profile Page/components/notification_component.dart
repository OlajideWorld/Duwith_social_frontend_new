import 'package:duwith_social/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/sizes.dart';

notificationWidget(
    double width, String specialImage, String dataName, String dataDetails) {
  return Container(
    width: width,
    height: heightSize(80),
    padding: EdgeInsets.all(widthSize(15)),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(widthSize(10))),
      color: const Color(0xFF151B2E),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: heightSize(45),
          width: widthSize(45),
          padding: EdgeInsets.all(widthSize(12)),
          decoration: const ShapeDecoration(
            shape: OvalBorder(),
            color: Color(0xFF21293F),
          ),
          child: Image.asset(
            specialImage,
            height: heightSize(42),
            width: widthSize(42),
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(width: widthSize(15)),
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dataName,
                style: GoogleFonts.poppins(
                  fontSize: widthSize(15),
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              SizedBox(
                width: widthSize(271),
                child: Text(
                  dataDetails,
                  style: GoogleFonts.poppins(
                    fontSize: widthSize(12),
                    fontWeight: FontWeight.w400,
                    color: textColor3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
