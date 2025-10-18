import "package:duwith_social/Pages/Earn%20More%20Page/components/social_component_2.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../utils/color.dart";
import "../../../utils/sizes.dart";

import "../components/social_task_component.dart";
import "../controller/earn_controller.dart";

class SocialTaskPage extends StatelessWidget {
  const SocialTaskPage({super.key});

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
            child: SafeArea(child: Obx(() {
              return Padding(
                padding: EdgeInsets.only(
                    top: heightSize(30),
                    left: widthSize(20),
                    right: widthSize(20)),
                child: SizedBox(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        socialtaskappBar(constraints.maxWidth),
                        SizedBox(height: heightSize(40)),
                        // SizedBox(
                        //   height: heightSize(75),
                        //   width: widthSize(93),
                        //   child:
                        //       Image.asset("assets/images/Earn/socialmedia.png"),
                        // ),
                        socialSelectOption(constraints.maxWidth),
                        SizedBox(height: heightSize(20)),

                        if (earnController.socialOption.value == 0)
                          socialSpecialTask(context, constraints.maxWidth),

                        //
                        if (earnController.socialOption.value == 1)
                          socialCampaignList(context, constraints.maxWidth),

                        //
                        if (earnController.socialOption.value == 2)
                          socialPartnershipList(context, constraints.maxWidth)
                      ],
                    ),
                  ),
                ),
              );
            })),
          );
        },
      ),
    );
  }
}
