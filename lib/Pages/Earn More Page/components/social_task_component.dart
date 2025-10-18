import "package:duwith_social/Pages/Earn%20More%20Page/controller/earn_controller.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../common/button-widget.dart";
import "../../../utils/Size-config.dart";
import "../../../utils/color.dart";
import "../../../utils/sizes.dart";

EarnController earnController = EarnController.instance;

socialSelectOption(double width) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        // Special
        GestureDetector(
          onTap: () => earnController.socialOption.value = 0,
          child: Container(
            alignment: Alignment.center,
            width: widthSize(95),
            padding: EdgeInsets.all(widthSize(5)),
            decoration: BoxDecoration(
              color: earnController.socialOption.value == 0
                  ? const Color(0xFF3D0084)
                  : Colors.transparent,
              border: Border.all(color: const Color(0xFF1F2138)),
              borderRadius: BorderRadius.all(Radius.circular(widthSize(15))),
            ),
            child: Text(
              "Special",
              style: GoogleFonts.poppins(
                fontSize: widthSize(15),
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ),
        ),
        SizedBox(width: widthSize(15)),
        //Campaigns
        GestureDetector(
          onTap: () => earnController.socialOption.value = 1,
          child: Container(
            alignment: Alignment.center,
            width: widthSize(120),
            padding: EdgeInsets.all(widthSize(5)),
            decoration: BoxDecoration(
              color: earnController.socialOption.value == 1
                  ? const Color(0xFF3D0084)
                  : Colors.transparent,
              border: Border.all(color: const Color(0xFF1F2138)),
              borderRadius: BorderRadius.all(Radius.circular(widthSize(15))),
            ),
            child: Text(
              "Campaigns",
              style: GoogleFonts.poppins(
                fontSize: widthSize(15),
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ),
        ),
        SizedBox(width: widthSize(15)),
        //Partnerships
        GestureDetector(
          onTap: () => earnController.socialOption.value = 2,
          child: Container(
            alignment: Alignment.center,
            width: widthSize(125),
            padding: EdgeInsets.all(widthSize(5)),
            decoration: BoxDecoration(
              color: earnController.socialOption.value == 2
                  ? const Color(0xFF3D0084)
                  : Colors.transparent,
              border: Border.all(color: const Color(0xFF1F2138)),
              borderRadius: BorderRadius.all(Radius.circular(widthSize(15))),
            ),
            child: Text(
              "Partnerships",
              style: GoogleFonts.poppins(
                fontSize: widthSize(15),
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ),
        ),
        SizedBox(width: widthSize(15)),
        //Education
        GestureDetector(
          onTap: () => earnController.socialOption.value = 3,
          child: Container(
            width: widthSize(110),
            alignment: Alignment.center,
            padding: EdgeInsets.all(widthSize(5)),
            decoration: BoxDecoration(
              color: earnController.socialOption.value == 3
                  ? const Color(0xFF3D0084)
                  : Colors.transparent,
              border: Border.all(color: const Color(0xFF1F2138)),
              borderRadius: BorderRadius.all(Radius.circular(widthSize(15))),
            ),
            child: Text(
              "Education",
              style: GoogleFonts.poppins(
                fontSize: widthSize(15),
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ),
        ),
        SizedBox(width: widthSize(15)),
      ],
    ),
  );
}

socialtaskappBar(double width) {
  return SizedBox(
    child: Row(
      children: [
        backbutton(onTap: () => Get.back()),
        SizedBox(
          width: width * 0.30,
        ),
        Text(
          "Social",
          style: GoogleFonts.poppins(
            fontSize: widthSize(15),
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ],
    ),
  );
}

socialCustomTaskContainer({
  required BuildContext context,
  required double width,
  required String socialName,
  required String socialImage,
  required String socialInstruction,
  required String socialOverall,
  required int whichpart,
  required bool isNew,
  required VoidCallback onTap,
}) {
  return SizedBox(
    width: width,
    height: heightSize(160),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipPath(
          clipper: const InverseDiagonalClipper(inset: 20),
          child: Container(
            height: heightSize(50),
            width: widthSize(170),
            padding: EdgeInsets.only(left: widthSize(10)),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color(0xFF1A2137),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  socialImage,
                  height: heightSize(20),
                  width: widthSize(20),
                ),
                SizedBox(width: widthSize(5)),
                Text(
                  socialName,
                  style: GoogleFonts.poppins(
                    fontSize: widthSize(15),
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            width: widthSize(45),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color.fromARGB(200, 65, 68, 67),
            ),
            padding: EdgeInsets.all(widthSize(5)),
            child: Text(
              socialOverall,
              style: GoogleFonts.poppins(
                fontSize: widthSize(10),
                fontWeight: FontWeight.w500,
                color: const Color(0xFF252DE5),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: width,
            height: heightSize(80),
            padding: EdgeInsets.all(widthSize(15)),
            decoration: const BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(color: const Color(0xFF252DE5), width: 0.5)),
              color: Color(0xFF1A2137),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      whichpart == 1
                          ? Image.asset(
                              "assets/images/Earn/thunder2.png",
                              height: heightSize(35),
                              width: widthSize(35),
                              fit: BoxFit.fitHeight,
                            )
                          : Image.asset(
                              "assets/images/Earn/energy.png",
                              height: heightSize(35),
                              width: widthSize(35),
                              fit: BoxFit.fitHeight,
                            ),
                      SizedBox(width: widthSize(15)),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              socialInstruction,
                              style: GoogleFonts.poppins(
                                fontSize: widthSize(15),
                                fontWeight: FontWeight.w500,
                                color: textColor,
                              ),
                            ),
                            Text(
                              isNew == true ? "• New" : "• Verifying",
                              style: GoogleFonts.poppins(
                                fontSize: widthSize(15),
                                fontWeight: FontWeight.w500,
                                color: isNew == true
                                    ? const Color(0xFFFDC448)
                                    : const Color(0xFFB7A3DA),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Text(
                        "+20",
                        style: GoogleFonts.poppins(
                          fontSize: widthSize(15),
                          fontWeight: FontWeight.w500,
                          color: textColor,
                        ),
                      ),
                      SizedBox(width: widthSize(5)),
                      Image.asset(
                        "assets/images/points.png",
                        fit: BoxFit.fitWidth,
                        height: heightSize(23),
                        width: widthSize(23),
                      ),
                      SizedBox(width: widthSize(5)),
                      Icon(Icons.arrow_forward_ios,
                          color: textColor, size: heightSize(18)),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

socialSpecialWidget({
  required BuildContext context,
  required double width,
  required String specialName,
  required String specialImage,
  required String specialDetails,
  required String specialOverall,
  required String specialButtonText,
  required Color specialColor,
  required Color specialButton,
  required Color specialButttonTextColor,
}) {
  return SizedBox(
    width: width,
    height: heightSize(100),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: widthSize(30),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color.fromARGB(200, 65, 68, 67),
          ),
          child: Text(
            specialOverall,
            style: GoogleFonts.poppins(
              fontSize: widthSize(10),
              fontWeight: FontWeight.w500,
              color: const Color(0xFF252DE5),
            ),
          ),
        ),
        Container(
          width: width,
          height: heightSize(80),
          padding: EdgeInsets.all(widthSize(15)),
          decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(color: const Color(0xFF252DE5), width: 0.5)),
            color: const Color(0xFF1A213780),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Container(
                      height: heightSize(42),
                      width: widthSize(42),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(widthSize(10)))),
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
                            specialName,
                            style: GoogleFonts.poppins(
                              fontSize: widthSize(18),
                              fontWeight: FontWeight.w600,
                              color: specialColor,
                            ),
                          ),
                          Text(
                            specialDetails,
                            style: GoogleFonts.poppins(
                              fontSize: widthSize(12),
                              fontWeight: FontWeight.w400,
                              color: specialColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: heightSize(35),
                width: widthSize(70),
                padding: EdgeInsets.symmetric(
                    horizontal: widthSize(5), vertical: heightSize(5)),
                decoration: BoxDecoration(
                    color: specialButton,
                    borderRadius: BorderRadius.circular(widthSize(10))),
                child: Center(
                  child: Text(
                    specialButtonText,
                    style: GoogleFonts.poppins(
                      fontSize: widthSize(15),
                      fontWeight: FontWeight.w400,
                      color: specialButttonTextColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
