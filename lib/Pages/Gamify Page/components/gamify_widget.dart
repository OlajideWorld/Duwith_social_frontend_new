import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../common/button-widget.dart";
import "../../../utils/color.dart";
import "../../../utils/sizes.dart";

gamifyTopBannerWidget(BuildContext context, double width) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: widthSize(15)),
    child: Container(
      height: heightSize(120),
      width: width,
      padding: EdgeInsets.only(
          top: heightSize(20),
          left: widthSize(20),
          right: widthSize(10),
          bottom: heightSize(5)),
      decoration: BoxDecoration(
        color: Color(0xFFFF2929),
        borderRadius: BorderRadius.all(Radius.circular(widthSize(10))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: widthSize(221),
            height: heightSize(90),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Limitless offers for you',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.urbanist(
                    color: textColor,
                    fontSize: fontSize(18),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'DUWITH offers unlimited offers and tasks, play more to win Big',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.urbanist(
                    color: Color(0xFFFFF5DD),
                    fontSize: fontSize(13),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                buttonsWidget(context, heightSize(22), widthSize(87),
                    "Start Now", textColor, 15, () {}, false, Color(0xFFDD8F0B))
              ],
            ),
          ),
          SizedBox(
            width: widthSize(120),
            height: heightSize(120),
            child: Image.asset(
              "assets/images/gamifyImage.png",
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    ),
  );
}
