import 'package:duwith_social/Pages/Shop%20Page/screens/chest_preview.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/custom-text.dart';
import '../../../utils/color.dart';

class ShopUpgradeScreen extends StatelessWidget {
  const ShopUpgradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: shopbackground,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
              child: Center(
                child: SizedBox(
                  height: heightSize(488),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: heightSize(241),
                        width: constraints.maxWidth,
                        child: Image.asset("assets/images/Shop/openchest.png",
                            fit: BoxFit.fitHeight),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: widthSize(45)),
                        child: SizedBox(
                          height: heightSize(216),
                          width: constraints.maxWidth,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text:
                                      'MAKE MORE MONEY BY UPGRADING ANY OF YOUR ',
                                  style: TextStyle(
                                      color: textColor,
                                      fontFamily: UsedFonts.blackhan,
                                      fontSize:
                                          fontSize(18)), // Default text style
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'ITEMS',
                                      style: const TextStyle(
                                          color: Color(0xFFFFAD32),
                                          fontFamily: UsedFonts.blackhan,
                                          fontWeight: FontWeight.bold),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Handle the link tap here
                                          print('ITEMS clicked');
                                        },
                                    ),
                                  ],
                                ),
                              ),
                              const CText(
                                text:
                                    "All items listed on shop helps in the project protections from manipulation and to keep the consistency of every rewards distributed to each users",
                                size: 13,
                                fontFamily: UsedFonts.poppins,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFD18DF9),
                              ),
                              buttonsWidget(
                                  context,
                                  heightSize(40),
                                  constraints.maxWidth,
                                  "Continue",
                                  textColor,
                                  14,
                                  () =>
                                      Get.to(() => const ChestPrevieeScreen()),
                                  false,
                                  const Color(0xFF28282C))
                            ],
                          ),
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
