import 'package:duwith_social/Pages/Wallet%20Page/components/wallet_app_bar.dart';
import 'package:duwith_social/utils/color.dart';

import 'package:flutter/material.dart';

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
              child: SizedBox(
                child: Column(
                  children: [
                    walletAppBar(),
                    SizedBox(width: widthSize(30)),
                    walletBalanceContainer(context),
                    SizedBox(width: widthSize(26)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
