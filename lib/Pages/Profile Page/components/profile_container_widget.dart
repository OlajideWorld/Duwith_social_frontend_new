import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

mainprofileAppBar(double width) {
  return Container(
    height: heightSize(88),
    width: width,
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      color: faintColor,
    ),
    padding: EdgeInsets.only(top: heightSize(55)),
    child: const CText(
      text: "Profile",
      size: 13.22,
      color: textColor,
      fontFamily: UsedFonts.poppins,
      fontWeight: FontWeight.w500,
    ),
  );
}

profileWidget(String image, String name, VoidCallback onTap, bool showLine) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      height: heightSize(43),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: heightSize(35),
                width: widthSize(179),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: heightSize(35),
                      width: widthSize(35),
                      decoration: BoxDecoration(
                          color: const Color(0xFF343232),
                          borderRadius: BorderRadius.all(
                              Radius.circular(widthSize(19.5)))),
                      child: Padding(
                        padding: EdgeInsets.all(widthSize(9)),
                        child: Image.asset(
                          image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(width: widthSize(8)),
                    CText(
                      text: name,
                      size: 13,
                      color: const Color(0xFFE9E9E9),
                      fontFamily: UsedFonts.poppins,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right_rounded,
                size: heightSize(16),
                color: textColor,
              )
            ],
          ),
          showLine
              ? Divider(
                  height: heightSize(3),
                  thickness: 1,
                  color: const Color(0xFF3C3C3C))
              : const SizedBox()
        ],
      ),
    ),
  );
}

promoteDialog(BuildContext context, double width) {
  return showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: widthSize(20), vertical: heightSize(215)),
          child: Container(
            height: heightSize(283),
            width: width,
            decoration: BoxDecoration(
              color: const Color(0xFF151B2E),
              borderRadius: BorderRadius.all(Radius.circular(widthSize(10))),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: widthSize(20)),
                    child: Icon(
                      Icons.cancel_outlined,
                      color: textColor,
                      size: heightSize(16),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: widthSize(28), right: widthSize(32)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CText(
                        text: "Promote post",
                        color: Colors.white,
                        size: 19,
                        textAlign: TextAlign.center,
                        fontFamily: UsedFonts.poppins,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: heightSize(6)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CText(
                            text: "You’ll be charged",
                            color: Color(0xFFCFCFCF),
                            size: 15,
                            textAlign: TextAlign.center,
                            fontFamily: UsedFonts.poppins,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: heightSize(34),
                            width: widthSize(51),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/points.png",
                                  fit: BoxFit.fill,
                                  height: heightSize(34),
                                  width: widthSize(34),
                                ),
                                const CText(
                                  text: "100",
                                  color: textColor,
                                  size: 15,
                                  fontFamily: UsedFonts.poppins,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                          const CText(
                            text: "to continue ",
                            color: Color(0xFFCFCFCF),
                            size: 15,
                            textAlign: TextAlign.center,
                            fontFamily: UsedFonts.poppins,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      const CText(
                        text: "post promotion",
                        color: Color(0xFFCFCFCF),
                        size: 15,
                        textAlign: TextAlign.center,
                        fontFamily: UsedFonts.poppins,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: heightSize(96),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buttonsWidget(
                                context,
                                heightSize(40),
                                width,
                                "Cancel",
                                const Color(0xFF293149),
                                13,
                                () {},
                                false,
                                textColor),
                            buttonsWidget(
                                context,
                                heightSize(40),
                                width,
                                "Proceed",
                                mainColor,
                                13,
                                () {},
                                false,
                                textColor)
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });
}
