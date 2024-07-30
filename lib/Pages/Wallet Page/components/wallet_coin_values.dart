import 'package:duwith_social/Pages/Home%20Page/components/home_airdrop.dart';
import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../Home Page/controllers/home_controller.dart';
import '../screens/withdraw_screeen.dart';

HomeController homeController = HomeController.instance;

walletCoinList() {
  return Container(
    height: heightSize(200),
    padding: EdgeInsets.symmetric(
        horizontal: widthSize(20), vertical: heightSize(28)),
    decoration: const BoxDecoration(color: faintColor),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CText(
          text: "Select Asset to withdraw",
          size: 12,
          color: Color(0xFF969696),
          fontFamily: UsedFonts.poppins,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: heightSize(8)),
        walletCoinDetails("assets/images/social.png", "Duwith Gold Coin",
            12000.14, "0.2", Colors.green, true),
        SizedBox(height: heightSize(12)),
        walletCoinDetails("assets/images/social.png", "Loan Gem", 1000.14,
            "0.02", Colors.green, true),
        SizedBox(height: heightSize(12)),
        // walletCoinDetails("assets/images/social.png", "Athen", 1000.14, "0.02",
        //     Colors.green, true),
        // SizedBox(height: heightSize(12)),
        // walletCoinDetails("assets/images/social.png", "Mumu", 1000.14, "0.02",
        //     Colors.green, true),
        // SizedBox(height: heightSize(12)),
        // walletCoinDetails("assets/images/social.png", "Wen", 1000.14, "0.02",
        //     Colors.green, true)
      ],
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
      height: heightSize(48.5),
      child: Column(
        children: [
          SizedBox(
            height: heightSize(39.66),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: heightSize(39.66),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: heightSize(39),
                          width: widthSize(39),
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
                        SizedBox(width: widthSize(10)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CText(
                              text: coinName,
                              size: 18.22,
                              color: Color(0xFFECECEC),
                              fontFamily: UsedFonts.poppins,
                              fontWeight: FontWeight.w500,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const CText(
                                  text: "\$100",
                                  size: 15,
                                  color: const Color(0xFF9AB9D6),
                                  fontFamily: UsedFonts.poppins,
                                  fontWeight: FontWeight.w400,
                                ),
                                SizedBox(width: widthSize(5)),
                                CText(
                                  text: isAppreciating
                                      ? "+\$$overflow"
                                      : "-\$$overflow",
                                  size: 13.44,
                                  color: overflowColor,
                                  fontFamily: UsedFonts.poppins,
                                  fontWeight: FontWeight.w400,
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
                      children: [
                        CText(
                          text: tokenUSDT,
                          size: 18.33,
                          color: textColor,
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: heightSize(8)),
                        const CText(
                          text: "\$1,200",
                          size: 11,
                          color: Color(0xFFA6A6A6),
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w600,
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
