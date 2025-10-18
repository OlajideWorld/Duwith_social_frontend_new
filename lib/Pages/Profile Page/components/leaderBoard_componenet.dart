import "package:duwith_social/utils/color.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

leaderAmountContainer(double width) {
  return Container(
    width: width,
    height: heightSize(150),
    padding: EdgeInsets.symmetric(vertical: heightSize(20)),
    decoration: BoxDecoration(
      color: Color(0xFF201F3D),
      borderRadius: BorderRadius.all(Radius.circular(widthSize(20))),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/images/leader.png",
          height: heightSize(50),
          width: widthSize(250),
          fit: BoxFit.fitWidth,
        ),
        Text(
          "Amounts to be distributed (Monthly) ",
          style: GoogleFonts.poppins(
            fontSize: widthSize(14),
            fontWeight: FontWeight.w500,
            color: Color(0xffFDB4DF),
          ),
        ),
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                "500,000,000",
                style: GoogleFonts.poppins(
                  fontSize: widthSize(30),
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// ignore: non_constant_identifier_names
leaderWinnerWidget(String imageUsed) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(widthSize(10)),
    decoration: BoxDecoration(
      color: const Color(0xFF181B4A),
      borderRadius: BorderRadius.all(Radius.circular(widthSize(10))),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: heightSize(50),
          width: widthSize(160),
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
        SizedBox(
          child: Row(
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
                  color: Color(0xff0BCEDB),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          child: Row(
            children: [
              Text(
                "# 12.3K",
                style: GoogleFonts.prata(
                  fontSize: widthSize(16),
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
              Text(
                "/Your Rank",
                style: GoogleFonts.poppins(
                  fontSize: widthSize(12),
                  fontWeight: FontWeight.w400,
                  color: textColor3,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

// ignore: non_constant_identifier_names
leaderPeopleWidget(
    String imageUsed, String number, String amountUsed, String nameUsed) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(widthSize(10)),
    decoration: BoxDecoration(
      color: const Color(0xFF181B4A),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                number,
                style: GoogleFonts.urbanist(
                  fontSize: widthSize(18),
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
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
                    nameUsed,
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
                        amountUsed,
                        style: GoogleFonts.poppins(
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
        SizedBox(
          child: Row(
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
                "+500K",
                style: GoogleFonts.poppins(
                  fontSize: widthSize(14),
                  fontWeight: FontWeight.w600,
                  color: Color(0xff0BCEDB),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
