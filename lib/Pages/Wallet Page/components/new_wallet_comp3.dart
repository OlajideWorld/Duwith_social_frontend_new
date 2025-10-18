import "package:duwith_social/Pages/Earn%20More%20Page/controller/earn_controller.dart";
import "package:duwith_social/common/button-widget.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../utils/color.dart";
import "../../../utils/sizes.dart";

EarnController earnController = EarnController.instance;

class SimpleBarChart extends StatelessWidget {
  final List<double> data;
  const SimpleBarChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(220),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: data.map((value) {
          return Container(
            width: widthSize(50),
            height: value,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(6),
            ),
          );
        }).toList(),
      ),
    );
  }
}

newWalletRecentActivity() {
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
              Icons.group_outlined,
              color: textColor,
              size: widthSize(20),
            ),
            SizedBox(width: widthSize(5)),
            Text(
              "Recent Activity",
              style: GoogleFonts.poppins(
                fontSize: widthSize(25),
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ],
        ),
        SizedBox(height: heightSize(30)),
        newWalletactivityContainer(
            "Node Earnings", "+0.73", "2 min ago", Colors.green, true),
        SizedBox(height: heightSize(10)),
        newWalletactivityContainer("Task completed: Daily Check-in",
            "+150 CORD", "1 hour ago", Colors.blue, true),
        SizedBox(height: heightSize(10)),
        newWalletactivityContainer("Earned from Mining", "+2.2 CORD",
            "3 hours ago", Colors.green, true),
        SizedBox(height: heightSize(10)),
        newWalletactivityContainer("Joined Leaderboard rank #977", "+2.2 CORD",
            "1 Day ago", Colors.blue, false),
      ],
    ),
  );
}

newWalletactivityContainer(
    String text1, String text2, String text3, Color buttonColor, bool isAdded) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(
        vertical: heightSize(10), horizontal: widthSize(10)),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(widthSize(10)),
      border: Border.all(
        color: Color.fromARGB(22, 255, 255, 255),
        width: widthSize(1),
      ),
      color: navbarColor2,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: heightSize(10),
              width: widthSize(10),
              decoration: ShapeDecoration(
                  color: buttonColor, shape: const OvalBorder()),
            ),
            SizedBox(width: widthSize(10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  truncate(text1, length: 25),
                  style: GoogleFonts.poppins(
                    fontSize: widthSize(15),
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
                isAdded == true
                    ? SizedBox(
                        child: Column(
                          children: [
                            SizedBox(height: heightSize(10)),
                            Text(
                              text2,
                              style: GoogleFonts.poppins(
                                fontSize: widthSize(12),
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox()
              ],
            )
          ],
        ),
        Text(
          text3,
          style: GoogleFonts.poppins(
            fontSize: widthSize(12),
            fontWeight: FontWeight.w500,
            color: textColor3,
          ),
        ),
      ],
    ),
  );
}

withdrawalWidget(BuildContext context, double width, int points) {
  return Obx(() {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
          vertical: heightSize(15), horizontal: widthSize(15)),
      decoration: BoxDecoration(
          color: Color.fromARGB(22, 255, 255, 255),
          borderRadius: BorderRadius.circular(widthSize(10))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: widthSize(100),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      earnController.whichWthdrawal.value == "first"
                          ? "assets/images/points.png"
                          : "assets/images/Earn/tonCoin.png",
                      fit: BoxFit.contain,
                      height: heightSize(70),
                      width: widthSize(50),
                    ),
                    SizedBox(width: widthSize(8)),
                    earnController.whichWthdrawal.value == "first"
                        ? Text(
                            "$points",
                            style: GoogleFonts.prata(
                              fontSize: widthSize(18),
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          )
                        : SizedBox(
                            height: heightSize(40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "$points",
                                  style: GoogleFonts.prata(
                                    fontSize: widthSize(18),
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "\$TON",
                                  style: GoogleFonts.poppins(
                                    fontSize: widthSize(13),
                                    fontWeight: FontWeight.w400,
                                    color: textColor3,
                                  ),
                                ),
                              ],
                            ),
                          )
                  ],
                ),
              ),
              Text(
                "\$DOT",
                style: GoogleFonts.poppins(
                  fontSize: fontSize(13),
                  fontWeight: FontWeight.w400,
                  color: textColor3,
                ),
              ),
            ],
          ),
          Divider(
            height: heightSize(3),
            thickness: 1,
            color: Color(0xFF3C3C3C),
          ),
          SizedBox(height: heightSize(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: widthSize(110),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/recieve.png",
                      fit: BoxFit.contain,
                      height: heightSize(24),
                      width: widthSize(24),
                    ),
                    Text(
                      "Coming soon",
                      style: GoogleFonts.poppins(
                        fontSize: fontSize(13),
                        fontWeight: FontWeight.w300,
                        color: textColor3,
                      ),
                    ),
                  ],
                ),
              ),
              buttonsWidget(
                  context,
                  heightSize(40),
                  widthSize(150),
                  "Widthdrawal",
                  Color(0xFF343536),
                  13,
                  () {},
                  false,
                  textColor3)
            ],
          )
        ],
      ),
    );
  });
}

withdrawalWidget2(BuildContext context, double width, int points) {
  return Obx(() {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
          vertical: heightSize(15), horizontal: widthSize(15)),
      decoration: BoxDecoration(
          color: navbarColor2,
          borderRadius: BorderRadius.circular(widthSize(10))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: widthSize(100),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      earnController.whichWthdrawal2.value == "second"
                          ? "assets/images/Earn/tonCoin.png"
                          : "assets/images/points.png",
                      fit: BoxFit.contain,
                      height: heightSize(70),
                      width: widthSize(50),
                    ),
                    SizedBox(width: widthSize(8)),
                    earnController.whichWthdrawal2.value == "second"
                        ? SizedBox(
                            height: heightSize(40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "$points",
                                  style: GoogleFonts.prata(
                                    fontSize: widthSize(18),
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "\$TON",
                                  style: GoogleFonts.poppins(
                                    fontSize: widthSize(13),
                                    fontWeight: FontWeight.w400,
                                    color: textColor3,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Text(
                            "$points",
                            style: GoogleFonts.prata(
                              fontSize: widthSize(18),
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                  ],
                ),
              ),
              Container(
                height: heightSize(40),
                width: widthSize(40),
                decoration: BoxDecoration(
                    border: Border.all(color: textColor3),
                    borderRadius: BorderRadius.circular(widthSize(10))),
                child: Center(
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: textColor,
                    size: heightSize(15),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: heightSize(10)),
          Divider(
            height: heightSize(3),
            thickness: 1,
            color: Color(0xFF3C3C3C),
          ),
          SizedBox(height: heightSize(10)),
          Container(
            width: width,
            padding: EdgeInsets.symmetric(
                horizontal: widthSize(10), vertical: heightSize(10)),
            decoration: BoxDecoration(
                color: Color(0xFF1F2138),
                borderRadius: BorderRadius.circular(widthSize(10))),
            child: Text(
              "Only Ton Wallet is Allowed",
              style: GoogleFonts.inter(
                fontSize: widthSize(15),
                fontWeight: FontWeight.w500,
                color: textColor3,
              ),
            ),
          ),
          SizedBox(height: heightSize(10)),
          Divider(
            height: heightSize(3),
            thickness: 1,
            color: Color(0xFF3C3C3C),
          ),
          SizedBox(height: heightSize(10)),
          SizedBox(
            width: width,
            height: heightSize(50),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/recieve.png",
                  fit: BoxFit.contain,
                  height: heightSize(24),
                  width: widthSize(24),
                ),
                SizedBox(width: widthSize(5)),
                Expanded(
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    controller: earnController.withdrawalAmount,
                    style: GoogleFonts.poppins(
                      color: textColor,
                      fontSize: fontSize(14),
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      hintText: "Enter text",
                      hintStyle: GoogleFonts.poppins(
                        color: textColor3,
                        fontSize: fontSize(14),
                        fontWeight: FontWeight.w400,
                      ),

                      border: InputBorder.none, // remove background/borders
                    ),
                  ),
                ),
                SizedBox(width: widthSize(8)),
                buttonsWidget(
                    context,
                    heightSize(40),
                    widthSize(150),
                    "Widthdrawal",
                    Color(0xFF2666CF),
                    13,
                    () {},
                    false,
                    textColor)
              ],
            ),
          ),
          SizedBox(height: heightSize(20)),
          SizedBox(
            width: width,
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: fontSize(12),
                    color: textColor),
                children: const [
                  TextSpan(
                    text: 'Note:',
                    style: TextStyle(color: Color(0xFF2666CF)),
                  ),
                  TextSpan(
                    text:
                        ' By procceding make sure that the detailes peovided are revewed and corrected, also all earnings from task would be manualy reviwed before withdrawal would be be accepted cheaters woukd not  be rewarded',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  });
}
