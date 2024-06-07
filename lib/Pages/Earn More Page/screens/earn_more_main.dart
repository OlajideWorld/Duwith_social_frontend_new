import 'package:duwith_social/Pages/Earn%20More%20Page/components/earn_money_component.dart';
import 'package:duwith_social/Pages/Earn%20More%20Page/components/earn_tap_widget.dart';
import 'package:duwith_social/common/custom-nav-bar.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:flutter/material.dart';
import '../../../utils/sizes.dart';

class EarnMorePage extends StatelessWidget {
  const EarnMorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Stack(
              children: [
                SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  child: Opacity(
                    opacity: 0.8,
                    child: Image.asset(
                      "assets/images/Earn/earn_more.png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                SafeArea(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: widthSize(10),
                          right: widthSize(10),
                          top: heightSize(73),
                          bottom: heightSize(30)),
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            earnBalanceWidget(),
                            SizedBox(height: heightSize(200)),
                            SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  earnLuckySpin(constraints.maxWidth),
                                  earnSocialMediaWidget(
                                      context, constraints.maxWidth)
                                ],
                              ),
                            ),
                            SizedBox(
                              height: heightSize(350),
                              width: constraints.maxWidth,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  earnTap(constraints.maxWidth),
                                  Row(
                                    children: [
                                      earnMoreExtraWidget(
                                          const Color(0xFFEB7F15),
                                          "Enjoy 25,000 points daily",
                                          "Offer walls",
                                          "Do more offer to earn cash",
                                          "assets/images/Earn/earn_more2.png",
                                          "Offer"),
                                      earnMoreExtraWidget(
                                          const Color(0xFF07A9B4),
                                          "Earn 50x higher",
                                          "Play games",
                                          "Play games and earn golds",
                                          "assets/images/Earn/game2.png",
                                          "Games")
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomNavBarWidget(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
