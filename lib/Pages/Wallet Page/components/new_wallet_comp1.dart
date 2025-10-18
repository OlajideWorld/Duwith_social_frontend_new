import "package:duwith_social/Pages/Wallet%20Page/components/new_wallet_comp2.dart";
import "package:duwith_social/utils/color.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:google_fonts/google_fonts.dart";

walletCoinBox(
    {required String topMessage,
    required String middleMessage,
    required String bottomMessage,
    required Color colorUsed,
    required IconData icon,
    required VoidCallback ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: heightSize(130),
      width: widthSize(180),
      padding: EdgeInsets.only(
        left: widthSize(10),
        right: widthSize(10),
        top: heightSize(10),
        bottom: heightSize(10),
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(widthSize(15)),
        border: Border.all(color: navbarColor2, width: widthSize(1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: heightSize(40),
                width: widthSize(40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widthSize(15)),
                    color: colorUsed),
                child: Center(
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: widthSize(20),
                  ),
                ),
              ),
              Text(
                topMessage,
                style: GoogleFonts.poppins(
                  fontSize: widthSize(12),
                  fontWeight: FontWeight.w400,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Text(
            middleMessage,
            style: GoogleFonts.poppins(
              fontSize: widthSize(15),
              fontWeight: FontWeight.w400,
              color: textColor3,
            ),
          ),
          Text(
            bottomMessage,
            style: GoogleFonts.poppins(
              fontSize: widthSize(25),
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ],
      ),
    ),
  );
}

newWalletEpoch(double width) {
  return Container(
    width: width,
    padding: EdgeInsets.symmetric(
        horizontal: widthSize(15), vertical: heightSize(20)),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(widthSize(20)),
      border: Border.all(
        color: navbarColor2,
        width: widthSize(1),
      ),
      color: backgroundColor,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Quests",
              style: GoogleFonts.poppins(
                fontSize: widthSize(35),
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: widthSize(130),
              padding: EdgeInsets.symmetric(vertical: heightSize(5)),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 110, 17, 127),
                  borderRadius: BorderRadius.circular(widthSize(10))),
              child: Text(
                "Resets in 3 days",
                softWrap: true,
                style: GoogleFonts.poppins(
                  fontSize: widthSize(15),
                  fontWeight: FontWeight.w500,
                  color: textColor3,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: heightSize(10)),
        newWalletOptionBox(width),
        SizedBox(height: heightSize(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            questParameters("2", "Completed"),
            questParameters("3", "Available"),
            questParameters("60", "XP pending")
          ],
        )
      ],
    ),
  );
}
