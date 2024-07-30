import 'package:duwith_social/Pages/Wallet%20Page/screens/withdraw_screeen.dart';
import 'package:duwith_social/common/getxmessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../common/button-widget.dart';
import '../../../common/custom-text.dart';
import '../../../utils/color.dart';
import '../../../utils/sizes.dart';

walletAppBar() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
    child: SizedBox(
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CText(
            text: "Total amount (USD)",
            size: 10,
            fontFamily: UsedFonts.poppins,
            fontWeight: FontWeight.w500,
            color: Color(0xFF848484),
          ),
          const CText(
            text: "\$0 ",
            size: 28,
            fontFamily: UsedFonts.poppins,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // buttonsWidget2(
              //     context,
              //     heightSize(29),
              //     widthSize(100),
              //     "Convert",
              //     FontAwesomeIcons.exchange,
              //     textColor,
              //     highlightColor,
              //     () {},
              //     false),
              // buttonsWidget2(
              //     context,
              //     heightSize(29),
              //     widthSize(100),
              //     "Withdraw",
              //     FontAwesomeIcons.wallet,
              //     highlightColor,
              //     textColor,
              //     () => Get.to(() => WalletWithdrawSceen()),
              //     false),
              buttonsWidget2(
                  context,
                  heightSize(29),
                  widthSize(100),
                  "Link wallet",
                  FontAwesomeIcons.wallet,
                  backgroundColor,
                  textColor,
                  () => getSuccessSnackBarEdit(
                      "Notification", "Linking to Duwith, Coming soon"),
                  true)
            ],
          ),
        ],
      ),
    ),
  );
}

class WalletFaqWidget extends StatefulWidget {
  final double width;
  final String question;
  final String answer;
  const WalletFaqWidget(
      {super.key,
      required this.width,
      required this.question,
      required this.answer});

  @override
  State<WalletFaqWidget> createState() => _WalletFaqWidgetState();
}

class _WalletFaqWidgetState extends State<WalletFaqWidget> {
  RxBool isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    String displayText = widget.answer;
    bool showReadMore = widget.answer.length > 40;

    if (!isExpanded.value && showReadMore) {
      displayText = '${widget.answer.substring(0, 40)}... ';
    }
    return Obx(() {
      return GestureDetector(
        onTap: () {
          if (showReadMore) {
            setState(() {
              isExpanded.value = !isExpanded.value;
            });
          }
        },
        child: SizedBox(
          height: isExpanded.value ? heightSize(100) : heightSize(40),
          width: widget.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CText(
                    text: widget.question,
                    size: 13,
                    fontFamily: UsedFonts.poppins,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                        height: heightSize(16),
                        width: widthSize(16),
                        child: isExpanded.value
                            ? const Icon(
                                Icons.keyboard_arrow_up,
                                size: 14,
                                color: textColor,
                              )
                            : const Icon(
                                Icons.keyboard_arrow_down,
                                size: 14,
                                color: textColor,
                              )),
                  )
                ],
              ),
              SizedBox(
                width: widthSize(315),
                child: Text(
                  displayText,
                  style: const TextStyle(
                    fontSize: 11,
                    fontFamily: UsedFonts.poppins,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8D8D8D),
                  ),
                ),
              ),
              Divider(
                height: heightSize(3),
                thickness: 1,
                color: const Color(0xFF3C3C3C),
              ),
            ],
          ),
        ),
      );
    });
  }
}
