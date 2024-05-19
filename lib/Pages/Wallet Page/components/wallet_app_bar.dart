import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../common/button-widget.dart';
import '../../../common/custom-text.dart';
import '../../../utils/color.dart';
import '../../../utils/sizes.dart';

walletAppBar() {
  return SizedBox(
    height: heightSize(32),
    child: Row(
      children: [
        backbutton(onTap: () => Get.back()),
        SizedBox(width: widthSize(127)),
        const CText(
          text: "Wallet",
          size: 12,
          fontFamily: UsedFonts.poppins,
          fontWeight: FontWeight.w500,
        ),
      ],
    ),
  );
}

walletBalanceContainer(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: widthSize(20), right: widthSize(30)),
    child: SizedBox(
      height: heightSize(90),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CText(
            text: "Total amount (USD)",
            size: 10,
            fontFamily: UsedFonts.poppins,
            fontWeight: FontWeight.w500,
            color: Color(0xFF848484),
          ),
          const CText(
            text: "\$10,000 ",
            size: 28,
            fontFamily: UsedFonts.poppins,
            fontWeight: FontWeight.w600,
            color: Color(0xFF848484),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buttonsWidget2(
                  context,
                  heightSize(29),
                  widthSize(100),
                  "Convert",
                  FontAwesomeIcons.exchange,
                  textColor,
                  highlightColor,
                  () {},
                  false),
              buttonsWidget2(
                  context,
                  heightSize(29),
                  widthSize(100),
                  "Withdraw",
                  FontAwesomeIcons.wallet,
                  highlightColor,
                  textColor,
                  () {},
                  false),
              buttonsWidget2(
                  context,
                  heightSize(29),
                  widthSize(100),
                  "Link wallet",
                  FontAwesomeIcons.wallet,
                  backgroundColor,
                  textColor,
                  () {},
                  true)
            ],
          ),
        ],
      ),
    ),
  );
}
