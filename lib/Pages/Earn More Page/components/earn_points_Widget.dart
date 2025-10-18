import 'package:duwith_social/Pages/Earn%20More%20Page/controller/earn_controller.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

EarnController earnController = EarnController.instance;

earnButtonContainer(BuildContext context, double width, double pct,
    double earned, VoidCallback? onPressed) {
  return Container(
    height: heightSize(150),
    padding: EdgeInsets.only(
        top: heightSize(15),
        left: widthSize(10),
        right: widthSize(15),
        bottom: heightSize(10)),
    width: width,
    decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 197, 194, 194)),
        borderRadius: BorderRadius.all(Radius.circular(widthSize(15))),
        color: Colors.transparent),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "+${earnController.ratePerSec} \$ PTS / Per Sec",
          style: GoogleFonts.poppins(
            fontSize: widthSize(20),
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),

        LinearProgressIndicator(
          value: pct,
          borderRadius: BorderRadius.circular(widthSize(20)),
          valueColor: const AlwaysStoppedAnimation(Color(0xFF8A079A)),
          minHeight: heightSize(15),
        ),

        // If they’ve hit the cap, show a reset button:
        if (earned >= earnController.maxCoins) ...[
          // Text(
          //   'You’ve reached the max!',
          //   style: GoogleFonts.poppins(
          //     fontSize: widthSize(10),
          //     fontWeight: FontWeight.w500,
          //     color: Colors.red,
          //   ),
          // ),
          // SizedBox(height: heightSize(10)),
          buttonsWidget(context, heightSize(50), width, "Claim $earned PTS",
              Color(0xFF252DE5), 14, onPressed!, false, textColor)
        ] else ...[
          Text('Earning at ${earnController.ratePerSec} / sec'),
        ],
      ],
    ),
  );
}

showEarnedBottomSheet(
    {required BuildContext context,
    double? width,
    double? earned,
    VoidCallback? onpressed}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        height: heightSize(400),
        width: width,
        padding: EdgeInsets.only(
            left: widthSize(30), right: widthSize(30), bottom: heightSize(20)),
        decoration: BoxDecoration(
          color: const Color(0xFF151B2E),
          border: const Border(top: BorderSide(color: Color(0xFF32406B))),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widthSize(20)),
            topRight: Radius.circular(widthSize(20)),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: heightSize(3),
              width: widthSize(127),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(widthSize(15)),
              ),
            ),
            SizedBox(height: heightSize(40)),
            Text(
              'Woohoo!',
              style: GoogleFonts.podkova(
                fontSize: widthSize(25),
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: heightSize(190),
              width: width,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: heightSize(50)),
                    child: Container(
                      height: heightSize(150),
                      padding: EdgeInsets.only(
                        top: heightSize(35),
                        left: widthSize(20),
                        right: widthSize(20),
                        bottom: heightSize(25),
                      ),
                      width: width,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(21, 217, 217, 217),
                        borderRadius: BorderRadius.circular(widthSize(15)),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width,
                              child: Center(
                                child: Stack(
                                  children: [
                                    // Border (stroke)
                                    Text(
                                      "$earned",
                                      style: GoogleFonts.podkova(
                                        fontSize: fontSize(30),
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 4
                                          ..color =
                                              Color(0xFF038E92), // border color
                                      ),
                                    ),
                                    // Fill (inside color)
                                    Text(
                                      "$earned",
                                      style: GoogleFonts.podkova(
                                        fontSize: fontSize(30),
                                        color: Colors.white, // text fill color
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              "You've successfully earned points from your loyal dog! 🎉",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.podkova(
                                fontSize: widthSize(14),
                                fontWeight: FontWeight.w400,
                                color: textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: heightSize(70),
                        left: widthSize(110),
                        right: widthSize(110)),
                    child: Stack(alignment: Alignment.center, children: [
                      ClipOval(
                        child: Container(
                          width: widthSize(90),
                          height: heightSize(60),
                          color: const Color(0xFF151B2E), // Background color
                        ),
                      ),
                      Image.asset(
                        "assets/images/Earn/bentCoin.png",
                        height: heightSize(90),
                        width: widthSize(130),
                        fit: BoxFit.fitWidth,
                      ),
                    ]),
                  )
                ],
              ),
            ),
            SizedBox(height: heightSize(40)),
            GestureDetector(
              onTap: onpressed!,
              child: Container(
                height: heightSize(50),
                width: widthSize(265),
                decoration: BoxDecoration(
                    color: const Color(0xFF252DE5),
                    borderRadius: BorderRadius.circular(widthSize(25))),
                child: Center(
                  child: Text(
                    "Procced to claim reward",
                    style: GoogleFonts.poppins(
                      fontSize: widthSize(14),
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
