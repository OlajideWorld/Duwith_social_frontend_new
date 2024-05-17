import "package:duwith_social/common/custom-text.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";


buttonsWidget(BuildContext context, double height, double width, String text,
    VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Color(0xFF00C4C0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize(15),
            fontFamily: UsedFonts.poppins,
            fontWeight: FontWeight.w700,
            height: 2.33,
          ),
        ),
      ),
    ),
  );
}