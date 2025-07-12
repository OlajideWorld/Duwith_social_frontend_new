import 'package:duwith_social/Pages/Earn%20More%20Page/controller/earn_controller.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
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
        border: Border.all(color: const Color.fromARGB(255, 60, 60, 60)),
        borderRadius: BorderRadius.all(Radius.circular(widthSize(15))),
        color: Colors.transparent),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${earnController.ratePerSec} \$ PTS / Per Second",
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
        height: heightSize(410),
        width: width,
        padding: EdgeInsets.only(
            left: widthSize(30), right: widthSize(30), bottom: heightSize(20)),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 30, 30, 30),
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
              'Woohoo',
              style: GoogleFonts.podkova(
                fontSize: widthSize(20),
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            SizedBox(height: heightSize(40)),
            Container(
              height: heightSize(129),
              padding: EdgeInsets.symmetric(
                  vertical: heightSize(20), horizontal: widthSize(20)),
              width: width,
              decoration: BoxDecoration(
                color: Color(0xFF1f2437),
                borderRadius: BorderRadius.circular(widthSize(15)),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$earned',
                      style: GoogleFonts.podkova(
                        fontSize: widthSize(23),
                        fontWeight: FontWeight.w400,
                        color: textColor,
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
            SizedBox(height: heightSize(40)),
            buttonsWidget(
                context,
                heightSize(40),
                width,
                "Procced to claim reward",
                Color(0xFF252DE5),
                14,
                onpressed!,
                false,
                textColor)
          ],
        ),
      );
    },
  );
}
