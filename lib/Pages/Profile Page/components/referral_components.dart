import "dart:ffi";

import "package:duwith_social/common/button-widget.dart";
import "package:duwith_social/utils/color.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

referralContainer(
    {required BuildContext context,
    required double width,
    required String text1,
    required String text2,
    required String text3,
    required String coinImage,
    required bool showImage,
    required Color buttonColor}) {
  return Container(
    width: width * 0.43,
    padding: EdgeInsets.symmetric(
        vertical: heightSize(10), horizontal: widthSize(10)),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widthSize(10)),
        color: Color.fromARGB(16, 232, 232, 213)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: heightSize(50),
          width: widthSize(150),
          child: Row(
            children: [
              Image.asset(
                coinImage,
                height: heightSize(40),
                width: widthSize(40),
                fit: BoxFit.fitHeight,
              ),
              SizedBox(width: widthSize(10)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: GoogleFonts.poppins(
                      fontSize: widthSize(15),
                      fontWeight: FontWeight.w400,
                      color: textColor3,
                    ),
                  ),
                  Row(
                    children: [
                      showImage == true
                          ? SizedBox(
                              height: heightSize(22),
                              width: widthSize(20),
                              child: Image.asset(
                                "assets/images/points.png",
                                fit: BoxFit.fitHeight,
                              ),
                            )
                          : const SizedBox(width: 1),
                      Text(
                        text2,
                        style: GoogleFonts.prata(
                          fontSize: widthSize(18),
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: heightSize(10)),
        Divider(
            height: heightSize(3),
            thickness: 1,
            color: const Color(0xFF2A2D3C)),
        SizedBox(height: heightSize(10)),
        Text(
          text3,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: widthSize(13),
            fontWeight: FontWeight.w400,
            color: Color.fromARGB(46, 232, 232, 213),
          ),
        ),
        SizedBox(height: heightSize(10)),
        Container(
          height: heightSize(30),
          width: widthSize(100),
          padding: EdgeInsets.symmetric(horizontal: widthSize(10)),
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(widthSize(10))),
          child: Center(
            child: Text(
              "Claim",
              style: GoogleFonts.poppins(
                fontSize: widthSize(13),
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    ),
  );
}

// ignore: non_constant_identifier_names
referralPeopleWidget(String imageUsed) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(widthSize(10)),
    decoration: BoxDecoration(
      color: const Color(0xFF1A2137),
      borderRadius: BorderRadius.all(Radius.circular(widthSize(10))),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: heightSize(50),
          width: widthSize(180),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: heightSize(35),
                width: widthSize(40),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A2137),
                  borderRadius:
                      BorderRadius.all(Radius.circular(widthSize(10))),
                  image: DecorationImage(
                    image: AssetImage(imageUsed),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Marsha Fisher",
                    style: GoogleFonts.poppins(
                      fontSize: widthSize(18),
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: heightSize(18),
                        width: widthSize(22),
                        child: Image.asset(
                          "assets/images/points.png",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Text(
                        "500K",
                        style: GoogleFonts.prata(
                          fontSize: widthSize(14),
                          fontWeight: FontWeight.w400,
                          color: Color(0xff9193BB),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        Icon(
          Icons.thumb_up_alt_outlined,
          size: heightSize(18),
          color: textColor,
        )
      ],
    ),
  );
}
