import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../utils/color.dart";
import "../controllers/home_controller.dart";

HomeController homeController = HomeController.instance;

searchFunction(
    {TextEditingController? controller, Function(String)? onChanged}) {
  return Container(
    height: heightSize(50),
    padding: EdgeInsets.symmetric(
        horizontal: widthSize(20), vertical: heightSize(5)),
    decoration: BoxDecoration(
      color: Color(0xFF1A2137),
      borderRadius: BorderRadius.circular(widthSize(15)),
      border: Border.all(color: Color(0xFF1A2137)),
    ),
    child: Row(
      children: [
        Image.asset(
          'assets/images/Home/MagGlass.png',
          height: heightSize(20),
          width: widthSize(20),
          color: Colors.grey.shade600,
        ),
        SizedBox(width: widthSize(10)),
        Expanded(
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            style: TextStyle(fontSize: fontSize(14), color: Colors.grey),
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: fontSize(13),
              ),
              border: InputBorder.none,
              isCollapsed: true, // removes extra vertical padding
            ),
          ),
        ),
      ],
    ),
  );
}

friendsOption() {
  return SizedBox(
    height: heightSize(150),
    width: widthSize(120),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: heightSize(90),
          width: widthSize(90),
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(widthSize(20))),
          child: Image.asset(
            "assets/images/Search/search0.png",
            height: heightSize(90),
            width: widthSize(90),
          ),
        ),
        Text(
          "Jacob Jones",
          style: GoogleFonts.poppins(
            color: textColor,
            fontSize: fontSize(15),
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: widthSize(52),
              padding: EdgeInsets.all(widthSize(10)),
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(widthSize(20)),
              ),
              child: Text(
                "Follow",
                style: GoogleFonts.poppins(
                  color: textColor,
                  fontSize: fontSize(10),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              width: widthSize(52),
              padding: EdgeInsets.all(widthSize(7)),
              decoration: BoxDecoration(
                color: textColor,
                borderRadius: BorderRadius.circular(widthSize(20)),
              ),
              child: Text(
                "Remove",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: fontSize(10),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
