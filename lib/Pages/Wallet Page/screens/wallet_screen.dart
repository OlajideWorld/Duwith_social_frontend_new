import 'package:duwith_social/Pages/Wallet%20Page/components/wallet_app_bar.dart';
import 'package:duwith_social/Pages/Wallet%20Page/components/wallet_coin_values.dart';
import 'package:duwith_social/utils/color.dart';

import 'package:flutter/material.dart';

import '../../../common/custom-text.dart';
import '../../../utils/sizes.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

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
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  child: Column(
                    children: [
                      SizedBox(height: heightSize(30)),
                      walletAppBar(),
                      SizedBox(height: heightSize(10)),
                      walletBalanceContainer(context),
                      SizedBox(height: heightSize(15)),
                      walletScreenSelectOption(context, constraints.maxWidth),
                      SizedBox(height: heightSize(30)),
                      walletCoinList(),
                      SizedBox(height: heightSize(3)),
                      Container(
                        height: heightSize(373),
                        width: constraints.maxWidth,
                        padding: EdgeInsets.symmetric(
                            horizontal: widthSize(20), vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CText(
                              text: "FAQ",
                              size: 13,
                              fontFamily: UsedFonts.poppins,
                              fontWeight: FontWeight.w600,
                              color: textColor,
                            ),
                            SizedBox(height: heightSize(8)),
                            Divider(
                              height: heightSize(3),
                              thickness: 1,
                              color: const Color(0xFF3C3C3C),
                            ),
                            SizedBox(height: heightSize(12)),
                            WalletFaqWidget(
                                width: constraints.maxWidth,
                                question: "What is a token wallet?",
                                answer:
                                    "A token wallet is a software application that stores, sends, and receives digital tokens or cryptocurrencies.  "),
                            SizedBox(height: heightSize(12)),
                            WalletFaqWidget(
                                width: constraints.maxWidth,
                                question: "How do I create a token wallet?",
                                answer:
                                    "A token wallet is a software application that stores, sends, and receives digital tokens or cryptocurrencies.  "),
                            SizedBox(height: heightSize(12)),
                            WalletFaqWidget(
                                width: constraints.maxWidth,
                                question: "How do I create a token wallet?",
                                answer:
                                    "A token wallet is a software application that stores, sends, and receives digital tokens or cryptocurrencies.  ")
                          ],
                        ),
                      )
                    ],
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
