import "package:duwith_social/Pages/Earn%20More%20Page/screens/airdrop+screen.dart";
import "package:duwith_social/Pages/Wallet%20Page/components/new_wallet_comp3.dart";
import "package:duwith_social/utils/color.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../utils/sizes.dart";

newWalletProgress() {
  return SizedBox(
    height: heightSize(50),
    child: Row(
      children: [
        Expanded(
          child: LinearProgressIndicator(
            value: 0.4,
            backgroundColor: buttonColor2,
            borderRadius: BorderRadius.circular(widthSize(20)),
            valueColor:
                const AlwaysStoppedAnimation(Color.fromARGB(255, 28, 202, 255)),
            minHeight: heightSize(15),
          ),
        ),
        SizedBox(width: widthSize(8)),
        Text(
          "2/5",
          style: GoogleFonts.podkova(
            fontSize: widthSize(20),
            fontWeight: FontWeight.w500,
            color: textColor3,
          ),
        ),
      ],
    ),
  );
}

newWalletOptionBox(double width) {
  return Container(
    padding: EdgeInsets.symmetric(
        vertical: heightSize(10), horizontal: widthSize(15)),
    decoration: BoxDecoration(
      color: Color.fromARGB(109, 79, 78, 78),
      borderRadius: BorderRadius.circular(widthSize(10)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Weekly Quests Bonus",
              style: GoogleFonts.poppins(
                fontSize: widthSize(20),
                fontWeight: FontWeight.w800,
                color: textColor,
              ),
            ),
            Spacer(),
            Container(
              alignment: Alignment.center,
              width: widthSize(80),
              padding: EdgeInsets.symmetric(vertical: heightSize(5)),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 17, 95, 20),
                  borderRadius: BorderRadius.circular(widthSize(10))),
              child: Text(
                "+150 pts",
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
        SizedBox(height: heightSize(5)),
        SizedBox(
          width: widthSize(200),
          child: Text(
            "Complete all your weekly quest for an additional points boost, Go hunt those leaderboard positons ",
            textAlign: TextAlign.left,
            style: GoogleFonts.poppins(
              fontSize: widthSize(15),
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 200, 197, 197),
            ),
          ),
        ),
        SizedBox(height: heightSize(5)),
        newWalletProgress(),
      ],
    ),
  );
}

newWalletTotalBalance() {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(vertical: heightSize(15)),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(widthSize(10)),
      border: Border.all(
        color: navbarColor2,
        width: widthSize(1),
      ),
      color: backgroundColor,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Total Balance",
          style: GoogleFonts.poppins(
            fontSize: widthSize(20),
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        SizedBox(height: heightSize(10)),
        Text(
          "2,348 CORD",
          style: GoogleFonts.archivoBlack(
            fontSize: widthSize(30),
            fontWeight: FontWeight.w700,
            color: Colors.purple,
          ),
        ),
        SizedBox(height: heightSize(10)),
        Text(
          "Total Earned 2,348 CORD",
          style: GoogleFonts.poppins(
            fontSize: widthSize(15),
            fontWeight: FontWeight.w500,
            color: textColor3,
          ),
        ),
        SizedBox(height: heightSize(10)),
        Text(
          "* Live Earnings +G 1420 CORD#",
          style: GoogleFonts.poppins(
            fontSize: widthSize(12),
            fontWeight: FontWeight.w500,
            color: Colors.green,
          ),
        ),
      ],
    ),
  );
}

newWalletBarChartBox() {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(
        vertical: heightSize(15), horizontal: widthSize(15)),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(widthSize(10)),
      border: Border.all(
        color: navbarColor2,
        width: widthSize(1),
      ),
      color: backgroundColor,
    ),
    child: Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.trending_up,
              color: textColor,
              size: widthSize(20),
            ),
            SizedBox(width: widthSize(5)),
            Text(
              "Live Earnings Chart",
              style: GoogleFonts.poppins(
                fontSize: widthSize(25),
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ],
        ),
        SizedBox(height: heightSize(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Current Rate",
              style: GoogleFonts.poppins(
                fontSize: widthSize(15),
                fontWeight: FontWeight.w500,
                color: textColor3,
              ),
            ),
            Text(
              "0.1102 CORD/s",
              style: GoogleFonts.poppins(
                fontSize: widthSize(15),
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ],
        ),
        const SimpleBarChart(data: [20, 40, 60, 80, 100, 150]),
        SizedBox(height: heightSize(15)),
        Center(
          child: Text(
            "Real-Time earnings data",
            style: GoogleFonts.poppins(
              fontSize: widthSize(15),
              fontWeight: FontWeight.w500,
              color: textColor3,
            ),
          ),
        )
      ],
    ),
  );
}

newWalletEarningOverview() {
  return GestureDetector(
    onTap: () => Get.to(() => const AirdropScreen()),
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          vertical: heightSize(15), horizontal: widthSize(15)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widthSize(10)),
        border: Border.all(
          color: navbarColor2,
          width: widthSize(1),
        ),
        color: backgroundColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.trending_up,
                color: textColor,
                size: widthSize(20),
              ),
              SizedBox(width: widthSize(5)),
              Text(
                "Airdrop Earnings Chart",
                style: GoogleFonts.poppins(
                  fontSize: widthSize(25),
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
            ],
          ),
          SizedBox(height: heightSize(20)),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "This Session",
                style: GoogleFonts.poppins(
                  fontSize: widthSize(15),
                  fontWeight: FontWeight.w500,
                  color: textColor3,
                ),
              ),
              Text(
                "+6.60 CORD",
                style: GoogleFonts.poppins(
                  fontSize: widthSize(15),
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
            ],
          ),
          SizedBox(height: heightSize(20)),
          LinearProgressIndicator(
            value: 0.2,
            backgroundColor: buttonColor2,
            borderRadius: BorderRadius.circular(widthSize(20)),
            valueColor:
                const AlwaysStoppedAnimation(Color.fromARGB(255, 137, 7, 154)),
            minHeight: heightSize(10),
          ),
          SizedBox(height: heightSize(15)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthSize(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                overviewMiniBox("474", "This Week"),
                overviewMiniBox("475", "This Month")
              ],
            ),
          ),
          SizedBox(height: heightSize(15)),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                vertical: heightSize(10), horizontal: widthSize(10)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widthSize(10)),
              border: Border.all(
                color: navbarColor2,
                width: widthSize(1),
              ),
              color: navbarColor2,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.thunderstorm,
                      color: Colors.orangeAccent,
                      size: widthSize(12),
                    ),
                    SizedBox(width: widthSize(5)),
                    Text(
                      "Earning Rate",
                      style: GoogleFonts.poppins(
                        fontSize: widthSize(18),
                        fontWeight: FontWeight.w500,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: heightSize(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    overviewRateContainer("Per Second:", "0.1110 CORD"),
                    overviewRateContainer("Per Minute:", "6.66 CORD")
                  ],
                ),
                SizedBox(height: heightSize(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    overviewRateContainer("Per Hour:", "399 CORD"),
                    overviewRateContainer("Per Day:", "9588 CORD")
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

overviewMiniBox(String text1, String text2) {
  return SizedBox(
    height: heightSize(50),
    width: widthSize(100),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: GoogleFonts.poppins(
            fontSize: widthSize(25),
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
        Text(
          text2,
          style: GoogleFonts.poppins(
            fontSize: widthSize(14),
            fontWeight: FontWeight.w400,
            color: textColor3,
          ),
        ),
      ],
    ),
  );
}

overviewRateContainer(String text1, String text2) {
  return SizedBox(
    // width: double.infinity,
    width: widthSize(130),
    child: Row(
      children: [
        Text(
          text1,
          style: GoogleFonts.poppins(
            fontSize: widthSize(12),
            fontWeight: FontWeight.w400,
            color: textColor3,
          ),
        ),
        SizedBox(width: widthSize(5)),
        Text(
          text2,
          style: GoogleFonts.poppins(
            fontSize: widthSize(12),
            fontWeight: FontWeight.w400,
            color: textColor,
          ),
        ),
      ],
    ),
  );
}

questParameters(String text1, String text2) {
  return SizedBox(
    height: heightSize(50),
    child: Column(
      children: [
        Text(
          text1,
          style: GoogleFonts.poppins(
            fontSize: widthSize(20),
            fontWeight: FontWeight.w800,
            color: textColor,
          ),
        ),
        SizedBox(width: widthSize(5)),
        Text(
          text2,
          style: GoogleFonts.poppins(
            fontSize: widthSize(15),
            fontWeight: FontWeight.w400,
            color: textColor3,
          ),
        ),
      ],
    ),
  );
}
