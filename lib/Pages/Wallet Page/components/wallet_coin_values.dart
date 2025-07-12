import 'package:duwith_social/Pages/Earn%20More%20Page/controller/earn_controller.dart';
import 'package:duwith_social/Pages/Home%20Page/components/home_airdrop.dart';
import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Home Page/controllers/home_controller.dart';
import '../screens/withdraw_screeen.dart';

HomeController homeController = HomeController.instance;
EarnController earnController = EarnController.instance;

walletCoinList() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
    child: SizedBox(
      height: heightSize(370),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Assets',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: Color(0xFF9291A4),
                fontSize: fontSize(15),
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: heightSize(5)),
          Divider(
              height: heightSize(3), thickness: 1, color: Color(0xFF3C3C3C)),
          SizedBox(height: heightSize(5)),
          walletCoinDetails("assets/images/Trends/harmony.png", "Gem", 12000.14,
              "0.2", Colors.green, true),
          SizedBox(height: heightSize(12)),
          walletCoinDetails("assets/images/Trends/ocean.png",
              "Voting Power (PV)", 1000.14, "0.02", Colors.green, true),
          SizedBox(height: heightSize(12)),
          walletCoinDetails("assets/images/Trends/android.png", "Point Asset",
              1000.14, "0.02", Colors.green, true),
          SizedBox(height: heightSize(12)),
          walletCoinDetails("assets/images/Trends/dropbox.png", "USDT", 1000.14,
              "0.02", Colors.green, true),
          SizedBox(height: heightSize(12)),
          walletCoinDetails("assets/images/Trends/dent.png", "Wen", 1000.14,
              "0.02", Colors.green, true)
        ],
      ),
    ),
  );
}

walletCoinDetails(String image, String coinName, double coinValue,
    String overflow, Color overflowColor, bool isAppreciating) {
  var tokenUSDT = homeController.formatNumberWithCommasWithDouble(coinValue);

  return GestureDetector(
    onTap: () {
      Get.to(() => WalletWithdrawSceen(coinSelected: coinName));
    },
    child: SizedBox(
      // width: widthSize(170.32),
      height: heightSize(55.5),
      child: Column(
        children: [
          SizedBox(
            height: heightSize(45.66),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: heightSize(45.66),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: heightSize(39),
                          width: widthSize(39),
                          decoration: BoxDecoration(
                              color: const Color(0xFF21293F),
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
                        SizedBox(width: widthSize(10)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              coinName,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  color: textColor,
                                  fontSize: fontSize(18.22),
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "\$100",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      color: Color(0xFF8D8D8D),
                                      fontSize: fontSize(12),
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(width: widthSize(5)),
                                Text(
                                  isAppreciating
                                      ? "+\$$overflow"
                                      : "-\$$overflow",
                                  style: GoogleFonts.poppins(
                                      color: overflowColor,
                                      fontSize: fontSize(12),
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //
                  //
                  SizedBox(
                    height: heightSize(39.54),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tokenUSDT,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              color: textColor,
                              fontSize: fontSize(18),
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "\$1,200",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              color: Color(0xFFA6A6A6),
                              fontSize: fontSize(12),
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
          Divider(
              height: heightSize(3), thickness: 1, color: Color(0xFF3C3C3C)),
        ],
      ),
    ),
  );
}

walletScreenSelectOption(BuildContext context, double width) {
  return Container(
      width: width,
      height: heightSize(70),
      // padding: EdgeInsets.symmetric(
      //     horizontal: widthSize(6), vertical: heightSize(6)),
      decoration: const BoxDecoration(
        color: backgroundColor,
      ),
      child: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Popular sections
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  earnController.walletType.value = 0;
                },
                child: SizedBox(
                  width: widthSize(55),
                  height: heightSize(70),
                  child: Column(
                    children: [
                      Container(
                        width: widthSize(51),
                        height: heightSize(40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(widthSize(10)),
                            color: earnController.walletType.value == 0
                                ? Color(0xFF1380FF)
                                : backgroundColor,
                            border: Border.all(
                                color: earnController.walletType.value == 0
                                    ? Color(0xFF1380FF)
                                    : Color.fromARGB(255, 137, 136, 136))),
                        child: Center(
                          child: Image.asset(
                            'assets/images/Trends/arrangesquare.png',
                            height: heightSize(29),
                            width: widthSize(24),
                          ),
                        ),
                      ),
                      Text(
                        'Convert',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: earnController.walletType.value == 0
                              ? Color(0xFF1380FF)
                              : textColor3,
                          fontSize: fontSize(15),
                          fontWeight: earnController.walletType.value == 0
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Add Icon

            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  earnController.walletType.value = 1;
                },
                child: SizedBox(
                  width: widthSize(55),
                  height: heightSize(70),
                  child: Column(
                    children: [
                      Container(
                        width: widthSize(51),
                        height: heightSize(40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(widthSize(10)),
                            color: earnController.walletType.value == 1
                                ? Color(0xFF1380FF)
                                : backgroundColor,
                            border: Border.all(
                                color: earnController.walletType.value == 1
                                    ? Color(0xFF1380FF)
                                    : Color.fromARGB(255, 137, 136, 136))),
                        child: Center(
                          child: Image.asset(
                            'assets/images/Trends/walletIcon.png',
                            height: heightSize(29),
                            width: widthSize(24),
                          ),
                        ),
                      ),
                      Text(
                        'Add',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: earnController.walletType.value == 1
                              ? Color(0xFF1380FF)
                              : textColor3,
                          fontSize: fontSize(15),
                          fontWeight: earnController.walletType.value == 1
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Send Icon

            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  earnController.walletType.value = 2;
                },
                child: SizedBox(
                  width: widthSize(55),
                  height: heightSize(70),
                  child: Column(
                    children: [
                      Container(
                        width: widthSize(51),
                        height: heightSize(40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(widthSize(10)),
                            color: earnController.walletType.value == 2
                                ? Color(0xFF1380FF)
                                : backgroundColor,
                            border: Border.all(
                                color: earnController.walletType.value == 2
                                    ? Color(0xFF1380FF)
                                    : Color.fromARGB(255, 137, 136, 136))),
                        child: Center(
                          child: Image.asset(
                            'assets/images/Trends/telegramapp.png',
                            height: heightSize(29),
                            width: widthSize(24),
                          ),
                        ),
                      ),
                      Text(
                        'Send',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: earnController.walletType.value == 2
                              ? Color(0xFF1380FF)
                              : textColor3,
                          fontSize: fontSize(15),
                          fontWeight: earnController.walletType.value == 2
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

// WIthdrawal
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  earnController.walletType.value = 3;
                },
                child: SizedBox(
                  width: widthSize(55),
                  height: heightSize(70),
                  child: Column(
                    children: [
                      Container(
                        width: widthSize(51),
                        height: heightSize(40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(widthSize(10)),
                            color: earnController.walletType.value == 3
                                ? Color(0xFF1380FF)
                                : backgroundColor,
                            border: Border.all(
                                color: earnController.walletType.value == 3
                                    ? Color(0xFF1380FF)
                                    : Color.fromARGB(255, 137, 136, 136))),
                        child: Center(
                          child: Image.asset(
                            'assets/images/Trends/Recieve.png',
                            height: heightSize(29),
                            width: widthSize(24),
                          ),
                        ),
                      ),
                      Text(
                        'Withdrawal',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: earnController.walletType.value == 3
                              ? Color(0xFF1380FF)
                              : textColor3,
                          fontSize: fontSize(15),
                          fontWeight: earnController.walletType.value == 3
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }));
}
