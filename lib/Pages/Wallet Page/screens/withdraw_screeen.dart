import 'package:duwith_social/Pages/Wallet%20Page/components/transaction_history.dart';
import 'package:duwith_social/Pages/Wallet%20Page/components/wallet_withdraw_components.dart';
import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../components/wallet_app_bar.dart';

class WalletWithdrawSceen extends StatelessWidget {
  final String coinSelected;
  const WalletWithdrawSceen({super.key, required this.coinSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: SafeArea(
              child: Obx(() {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: widthSize(20), vertical: heightSize(20)),
                  child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: SizedBox(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          walletAppBar(),
                          SizedBox(height: heightSize(32)),
                          walletWithdrawBalance(constraints.maxWidth),
                          SizedBox(height: heightSize(21)),
                          walletWithdrawMethodDetails(
                              context, constraints.maxWidth),
                          SizedBox(height: heightSize(20)),
                          const CText(
                            text: "Transaction History",
                            size: 14,
                            fontFamily: UsedFonts.poppins,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFFB5B2B2),
                          ),
                          SizedBox(height: heightSize(12)),
                          Container(
                            height: heightSize(300),
                            padding: EdgeInsets.only(
                                top: heightSize(24),
                                left: widthSize(18),
                                right: widthSize(18)),
                            decoration: BoxDecoration(
                                color: faintColor,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(widthSize(10)))),
                            child: transactionHistoryList(
                                context, constraints.maxWidth),
                          )
                        ],
                      ))),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
