import "package:duwith_social/common/button-widget.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../utils/color.dart";
import "../../../utils/sizes.dart";

airdropPhaseOne(double width) {
  return Container(
    height: heightSize(100),
    width: width,
    padding: EdgeInsets.only(
        top: heightSize(10), left: widthSize(25), right: widthSize(10)),
    decoration: BoxDecoration(
        border: const Border(
          top: BorderSide(color: mainColor),
        ),
        borderRadius: BorderRadius.circular(widthSize(10))),
    child: Column(
      children: [
        // First Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Stage One Target",
              style: GoogleFonts.poppins(
                fontSize: widthSize(12),
                fontWeight: FontWeight.w400,
                color: textColor3,
              ),
            ),
            Text(
              "9,233,564,000 DOT",
              style: GoogleFonts.poppins(
                fontSize: widthSize(18),
                fontWeight: FontWeight.w500,
                color: mainColor,
              ),
            ),
          ],
        ),

        // Second Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Stage One Target",
              style: GoogleFonts.poppins(
                fontSize: widthSize(12),
                fontWeight: FontWeight.w400,
                color: textColor3,
              ),
            ),
            Text(
              "3,564,000 DOT",
              style: GoogleFonts.poppins(
                fontSize: widthSize(18),
                fontWeight: FontWeight.w500,
                color: mainColor,
              ),
            ),
          ],
        ),
        // Third Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Stage One Target",
              style: GoogleFonts.poppins(
                fontSize: widthSize(12),
                fontWeight: FontWeight.w400,
                color: textColor3,
              ),
            ),
            Text(
              "9,000 DOT",
              style: GoogleFonts.poppins(
                fontSize: widthSize(18),
                fontWeight: FontWeight.w500,
                color: mainColor,
              ),
            ),
          ],
        )
      ],
    ),
  );
}

airdropGoalsandRewards(double width) {
  return Container(
    width: width,
    padding: EdgeInsets.symmetric(
      horizontal: widthSize(15),
      vertical: heightSize(15),
    ),
    decoration: BoxDecoration(
      color: Color.fromARGB(184, 56, 56, 56),
      borderRadius: BorderRadius.circular(widthSize(15)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Goals and Rewards",
          style: GoogleFonts.poppins(
            fontSize: widthSize(18),
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        SizedBox(height: heightSize(5)),
        Text(
          "Airdrop is being distributed based on users activeness and contrbutions in the community. the more a user is active the higher airdrop allocation",
          style: GoogleFonts.poppins(
            fontSize: widthSize(12),
            fontWeight: FontWeight.w500,
            color: textColor3,
          ),
        ),
        SizedBox(height: heightSize(10)),
        Divider(height: heightSize(3), thickness: 2, color: timeColor),
        SizedBox(height: heightSize(10)),
        Text(
          "Target",
          style: GoogleFonts.poppins(
            fontSize: widthSize(12),
            fontWeight: FontWeight.w500,
            color: textColor3,
          ),
        ),
        SizedBox(height: heightSize(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "0",
              style: GoogleFonts.poppins(
                fontSize: widthSize(12),
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            Text(
              "50M",
              style: GoogleFonts.poppins(
                fontSize: widthSize(12),
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            Text(
              "70M",
              style: GoogleFonts.poppins(
                fontSize: widthSize(12),
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            Text(
              "90M",
              style: GoogleFonts.poppins(
                fontSize: widthSize(12),
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            Text(
              "100M",
              style: GoogleFonts.poppins(
                fontSize: widthSize(12),
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            Text(
              "120M",
              style: GoogleFonts.poppins(
                fontSize: widthSize(12),
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ],
        ),
//
        SizedBox(height: heightSize(10)),
        LinearProgressIndicator(
          value: 0.8,
          borderRadius: BorderRadius.circular(widthSize(10)),
          valueColor: const AlwaysStoppedAnimation(mainColor),
          backgroundColor: Color.fromARGB(147, 39, 40, 80),
          minHeight: heightSize(10),
        ),
        SizedBox(height: heightSize(10)),
        //
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "0",
              style: GoogleFonts.poppins(
                fontSize: widthSize(12),
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            Text(
              "50M",
              style: GoogleFonts.poppins(
                fontSize: widthSize(12),
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            Text(
              "70M",
              style: GoogleFonts.poppins(
                fontSize: widthSize(12),
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            Text(
              "90M",
              style: GoogleFonts.poppins(
                fontSize: widthSize(12),
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            Text(
              "100M",
              style: GoogleFonts.poppins(
                fontSize: widthSize(12),
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            Text(
              "120M",
              style: GoogleFonts.poppins(
                fontSize: widthSize(12),
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ],
        ),

        Text(
          "Airdrop Unlocked",
          style: GoogleFonts.poppins(
            fontSize: widthSize(12),
            fontWeight: FontWeight.w500,
            color: textColor3,
          ),
        ),
      ],
    ),
  );
}

airdropStatus(BuildContext context, double width) {
  return Container(
    width: width,
    padding: EdgeInsets.symmetric(
      horizontal: widthSize(15),
      vertical: heightSize(15),
    ),
    decoration: BoxDecoration(
      color: Color.fromARGB(184, 56, 56, 56),
      borderRadius: BorderRadius.circular(widthSize(15)),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Status",
              style: GoogleFonts.poppins(
                fontSize: widthSize(12),
                fontWeight: FontWeight.w400,
                color: textColor,
              ),
            ),
            buttonsWidget(context, heightSize(20), widthSize(80), "Active",
                Colors.green, fontSize(12), () {}, false, Colors.white)
          ],
        ),
        SizedBox(height: heightSize(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Allocation",
              style: GoogleFonts.poppins(
                fontSize: widthSize(12),
                fontWeight: FontWeight.w400,
                color: textColor,
              ),
            ),
            Text(
              "300,560.12",
              style: GoogleFonts.poppins(
                fontSize: widthSize(18),
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ],
        ),
        SizedBox(height: heightSize(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Point Balance",
              style: GoogleFonts.poppins(
                fontSize: widthSize(12),
                fontWeight: FontWeight.w400,
                color: textColor,
              ),
            ),
            Text(
              "10.34",
              style: GoogleFonts.poppins(
                fontSize: widthSize(18),
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ],
        )
      ],
    ),
  );
}

airdropSurfingButton(BuildContext context, double width) {
  return Container(
    width: width,
    padding: EdgeInsets.symmetric(
      horizontal: widthSize(15),
      vertical: heightSize(15),
    ),
    decoration: BoxDecoration(
      color: Color.fromARGB(184, 56, 56, 56),
      borderRadius: BorderRadius.circular(widthSize(15)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let Your Opinion Count Today!",
          style: GoogleFonts.poppins(
            fontSize: widthSize(18),
            fontWeight: FontWeight.w400,
            color: textColor,
          ),
        ),
        SizedBox(height: heightSize(10)),
        Text(
          "Make Sure your opinion is valid and be REWARDED",
          style: GoogleFonts.poppins(
            fontSize: widthSize(12),
            fontWeight: FontWeight.w400,
            color: textColor3,
          ),
        ),
        SizedBox(height: heightSize(10)),
        buttonsWidget(context, heightSize(40), width, "Continue Surfing",
            mainColor, fontSize(18), () {}, false, Colors.white)
      ],
    ),
  );
}
