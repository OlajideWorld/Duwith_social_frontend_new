// ignore_for_file: file_names

import "package:duwith_social/common/custom-text.dart";
import "package:duwith_social/utils/color.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

buttonsWidget(
    BuildContext context,
    double height,
    double? width,
    String text,
    Color colorused,
    double fontsize,
    VoidCallback onTap,
    bool showBorderColor,
    Color fontColor) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: colorused,
        borderRadius: BorderRadius.circular(widthSize(10)),
        border: Border.all(color: showBorderColor ? textColor3 : colorused),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: fontColor,
            fontSize: fontSize(fontsize),
            fontWeight: FontWeight.w600,
            // height: 2.33,
          ),
        ),
      ),
    ),
  );
}

buttonsWidget2(
    BuildContext context,
    double height,
    double? width,
    String text,
    IconData icon,
    Color color,
    Color textColorused,
    VoidCallback onTap,
    bool showBorderColor) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          side: showBorderColor
              ? const BorderSide(color: textColor3)
              : BorderSide(color: color),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: heightSize(16),
              color: textColorused,
            ),
            SizedBox(width: widthSize(3)),
            Text(
              text,
              style: TextStyle(
                color: textColorused,
                fontSize: fontSize(14),
                fontFamily: UsedFonts.poppins,
                fontWeight: FontWeight.w500,
                height: 2.33,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

backbutton({required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: heightSize(32),
      width: widthSize(36),
      padding: EdgeInsets.only(left: widthSize(5)),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: const Color(0xFF717171)),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Center(
        child: Icon(
          Icons.arrow_back_ios,
          color: textColor,
          size: heightSize(18),
        ),
      ),
    ),
  );
}
