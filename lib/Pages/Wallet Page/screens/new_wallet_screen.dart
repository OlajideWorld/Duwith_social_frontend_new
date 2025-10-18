import "package:duwith_social/Pages/Wallet%20Page/components/new_wallet_comp1.dart";
import "package:duwith_social/Pages/Wallet%20Page/components/new_wallet_comp2.dart";
import "package:duwith_social/Pages/Wallet%20Page/components/new_wallet_comp3.dart";
import "package:duwith_social/Pages/Wallet%20Page/screens/new_wallet_withdraw_screen.dart";
import "package:duwith_social/common/button-widget.dart";
import "package:duwith_social/common/getxmessage.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../utils/color.dart";
import "../../../utils/sizes.dart";
import "../../Auth Page/controller/auth_controller.dart";
import "../../Earn More Page/controller/earn_controller.dart";

// ignore: must_be_immutable
class NewWalletMainScreenPage extends StatelessWidget {
  NewWalletMainScreenPage({super.key});

  AuthController authController = AuthController.instance;
  EarnController earnController = EarnController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: widthSize(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: heightSize(10)),
                        backbutton(onTap: () => Get.back()),
                        SizedBox(height: heightSize(20)),
                        Text(
                          "Hey ${authController.userdata.value.username}! 👋",
                          style: GoogleFonts.poppins(
                            fontSize: widthSize(30),
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: heightSize(10)),
                        Text(
                          "Lets discover some great places today",
                          style: GoogleFonts.poppins(
                            fontSize: widthSize(18),
                            fontWeight: FontWeight.w500,
                            color: textColor3,
                          ),
                        ),
                        SizedBox(height: heightSize(20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            walletCoinBox(
                              topMessage: "+0.16 this session",
                              middleMessage: "Gems",
                              bottomMessage: earnController
                                  .formatNumberWithCommas(authController
                                      .userdata.value.mainBalance),
                              colorUsed: Colors.green,
                              icon: FontAwesomeIcons.dollarSign,
                              ontap: () {},
                            ),
                            walletCoinBox(
                              topMessage: "Mining Active",
                              middleMessage: "Voting Power",
                              bottomMessage: earnController
                                  .formatNumberWithCommas(authController
                                      .userdata.value.mainBalance),
                              colorUsed: Colors.orange,
                              icon: FontAwesomeIcons.bolt,
                              ontap: () {},
                            )
                          ],
                        ),
                        SizedBox(height: heightSize(10)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            walletCoinBox(
                              topMessage: "2x Multiplier",
                              middleMessage: "Ton",
                              bottomMessage: earnController
                                  .formatNumberWithCommas(authController
                                      .userdata.value.mainBalance),
                              colorUsed: Colors.purple,
                              icon: FontAwesomeIcons.clock,
                              ontap: () {
                                if (authController.userdata.value.mainBalance >=
                                    100000) {
                                  earnController.whichWthdrawal.value = "first";
                                  earnController.whichWthdrawal2.value =
                                      "second";
                                  Get.to(() => const NewWalletWithdrawScreen());
                                } else {
                                  getSuccessSnackBarEdit("Message",
                                      "Have more than 10 Ton to Withdraw");
                                }
                              },
                            ),
                            walletCoinBox(
                              topMessage: "Active",
                              middleMessage: "Point",
                              bottomMessage: earnController
                                  .formatNumberWithCommas(authController
                                      .userdata.value.mainBalance),
                              colorUsed: Colors.blue,
                              icon: FontAwesomeIcons.heartPulse,
                              ontap: () {
                                if (authController.userdata.value.mainBalance >=
                                    100000) {
                                  earnController.whichWthdrawal.value =
                                      "second";
                                  earnController.whichWthdrawal2.value =
                                      "first";
                                  Get.to(() => const NewWalletWithdrawScreen());
                                } else {
                                  getSuccessSnackBarEdit("Message",
                                      "Have more than 100,000 Points to Withdraw");
                                }
                              },
                            )
                          ],
                        ),
                        SizedBox(height: heightSize(20)),
                        newWalletEpoch(constraints.maxWidth),
                        SizedBox(height: heightSize(20)),
                        newWalletTotalBalance(),
                        SizedBox(height: heightSize(20)),
                        // newWalletBarChartBox(),
                        // SizedBox(height: heightSize(20)),
                        newWalletEarningOverview(),
                        SizedBox(height: heightSize(20)),
                        newWalletRecentActivity(),
                        SizedBox(height: heightSize(20)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
