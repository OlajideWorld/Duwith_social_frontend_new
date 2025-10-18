import "package:duwith_social/Pages/Profile%20Page/components/streak_components.dart";
import "package:duwith_social/utils/color.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../common/button-widget.dart";
import "../../Earn More Page/controller/earn_controller.dart";
import "../components/customer_support_component.dart";

class CustomerSupportPage extends StatelessWidget {
  const CustomerSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    EarnController earnController = EarnController.instance;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: heightSize(20)),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: widthSize(20)),
                        child: backbutton(onTap: () => Get.back()),
                      ),
                      SizedBox(height: heightSize(35)),
                      Container(
                        height: heightSize(100),
                        padding:
                            EdgeInsets.symmetric(horizontal: widthSize(20)),
                        width: constraints.maxWidth,
                        decoration: BoxDecoration(color: Color(0xFF121726)),
                        child: selectCustomerSupportView(context),
                      ),
                      SizedBox(height: heightSize(20)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: widthSize(20),
                        ),
                        child: Obx(() {
                          if (earnController.chooseSupport.value == 0) {
                            return faqCustomerList(constraints.maxWidth);
                          } else if (earnController.chooseSupport.value == 1) {
                            return emailSupportView(
                                context, constraints.maxWidth);
                          } else {
                            return whatsappSupportView(
                                width: constraints.maxWidth,
                                height: constraints.maxHeight);
                          }
                        }),
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
