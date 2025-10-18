import "package:duwith_social/Pages/Wallet%20Page/components/new_wallet_comp3.dart";
import "package:duwith_social/utils/color.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../common/button-widget.dart";
import "../../Auth Page/controller/auth_controller.dart";
import "../../Earn More Page/controller/earn_controller.dart";

class NewWalletWithdrawScreen extends StatelessWidget {
  const NewWalletWithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController.instance;
    return Scaffold(
      backgroundColor: Color(0xFF0E121E),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: heightSize(20),
                      left: widthSize(20),
                      right: widthSize(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      backbutton(onTap: () => Get.back()),
                      SizedBox(height: heightSize(20)),
                      Container(
                        width: constraints.maxWidth,
                        padding: EdgeInsets.symmetric(
                            horizontal: widthSize(10), vertical: heightSize(5)),
                        decoration: BoxDecoration(
                            color: Color(0xFF041F38),
                            borderRadius: BorderRadius.circular(widthSize(10))),
                        child: Text(
                          "Only earned coins can be withdrawn. Purchased coins cannot.",
                          style: GoogleFonts.inter(
                            fontSize: widthSize(15),
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1380FF),
                          ),
                        ),
                      ),
                      SizedBox(height: heightSize(30)),
                      withdrawalWidget(context, constraints.maxWidth,
                          authController.userdata.value.mainBalance),
                      SizedBox(height: heightSize(20)),
                      withdrawalWidget2(context, constraints.maxWidth,
                          authController.userdata.value.mainBalance),
                      SizedBox(height: heightSize(40)),
                      buttonsWidget(
                          context,
                          heightSize(50),
                          constraints.maxWidth,
                          "Connect Wallet",
                          Color(0xFF2666CF),
                          14,
                          () {},
                          false,
                          textColor)
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
