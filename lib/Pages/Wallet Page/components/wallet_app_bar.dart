import 'package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart';
import 'package:duwith_social/Pages/Wallet%20Page/components/wallet_coin_values.dart';
import 'package:duwith_social/Pages/Wallet%20Page/screens/withdraw_screeen.dart';
import 'package:duwith_social/common/getxmessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/button-widget.dart';
import '../../../common/custom-text.dart';
import '../../../utils/color.dart';
import '../../../utils/sizes.dart';
import '../../Earn More Page/controller/earn_controller.dart';

AuthController authController = AuthController.instance;
EarnController earnController = EarnController.instance;

walletAppBar() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
    child: SizedBox(
      height: heightSize(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          backbutton(onTap: () => Get.back()),
          // const CText(
          //   text: "Wallet",
          //   size: 12,
          //   fontFamily: UsedFonts.poppins,
          //   fontWeight: FontWeight.w500,
          // ),
          Container(
            height: heightSize(30),
            width: widthSize(30),
            padding: EdgeInsets.all(widthSize(10)),
            decoration: BoxDecoration(
              color: Color(0xFF262a34),
              borderRadius: BorderRadius.circular(widthSize(10)),
            ),
            child: Center(
              child: Image.asset(
                "assets/images/qrcode.png",
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

walletBalanceContainer(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: widthSize(20), right: widthSize(30)),
    child: SizedBox(
      height: heightSize(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "@${authController.userdata.value.username}",
            style: GoogleFonts.inter(
              color: Color(0xFF1380FF),
              fontSize: fontSize(11),
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "${earnController.formatNumberWithCommas(authController.userdata.value.mainBalance)}\$",
            style: GoogleFonts.poppins(
              color: textColor,
              fontSize: fontSize(30),
              fontWeight: FontWeight.w600,
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     buttonsWidget2(
          //         context,
          //         heightSize(29),
          //         widthSize(100),
          //         "Link wallet",
          //         FontAwesomeIcons.wallet,
          //         backgroundColor,
          //         textColor,
          //         () => getSuccessSnackBarEdit(
          //             "Notification", "Linking to Duwith, Coming soon"),
          //         true)
          //   ],
          // ),
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
    return Obx(() {
      return GestureDetector(
        onTap: () {
          setState(() {
            isExpanded.value = !isExpanded.value;
          });
        },
        child: Container(
          height: isExpanded.value ? heightSize(110) : heightSize(60),
          width: widget.width,
          padding: EdgeInsets.symmetric(
              horizontal: widthSize(10), vertical: heightSize(10)),
          decoration: BoxDecoration(
              color: Color(0xFF151B2E),
              border: Border.all(color: Color(0xFF1F2138)),
              borderRadius: BorderRadius.circular(widthSize(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: widthSize(315),
                    child: Text(
                      widget.question,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: widthSize(13),
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                        height: heightSize(16),
                        width: widthSize(16),
                        child: isExpanded.value
                            ? const Icon(
                                Icons.remove,
                                size: 14,
                                color: textColor,
                              )
                            : const Icon(
                                Icons.add,
                                size: 14,
                                color: textColor,
                              )),
                  )
                ],
              ),
              isExpanded.value
                  ? SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            height: heightSize(3),
                            thickness: 1,
                            color: const Color(0xFF3C3C3C),
                          ),
                          SizedBox(
                            width: widthSize(315),
                            child: Text(
                              widget.answer,
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: fontSize(13),
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFB1B1B1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const Spacer()
            ],
          ),
        ),
      );
    });
  }
}
