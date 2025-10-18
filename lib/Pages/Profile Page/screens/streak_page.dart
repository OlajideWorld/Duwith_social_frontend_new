import "package:duwith_social/Pages/Profile%20Page/components/streak_components.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../common/button-widget.dart";
import "../../../common/custom-text.dart";
import "../../../utils/color.dart";
import "../../Earn More Page/components/daily_target_list.dart";
import "../../Earn More Page/components/daily_target_widget.dart";
import "../../Earn More Page/controller/earn_controller.dart";

class StreakPageScreen extends StatelessWidget {
  const StreakPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EarnController earnController = EarnController.instance;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Color(0xFF131827),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            backbutton(onTap: () => Get.back()),
            Text(
              "Daily target",
              style: GoogleFonts.poppins(
                fontSize: widthSize(15),
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            Icon(
              Icons.calendar_month,
              color: textColor,
              size: heightSize(20),
            )
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: SafeArea(
              child: SizedBox(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: heightSize(20)),
                          selectStreakView(context),
                          SizedBox(height: heightSize(20)),
                          Obx(() {
                            if (earnController.chooseType.value == 0) {
                              return SizedBox(
                                child: Column(
                                  children: [
                                    dailytaskAdvert(
                                        color1: const Color(0xFF8B11A9),
                                        color2: const Color(0xFFA408A7),
                                        textColorUsed: const Color(0xFFFEABDA),
                                        image: "assets/images/dailyimage.png",
                                        context: context),
                                    SizedBox(height: heightSize(16)),
                                    Container(
                                      height: heightSize(500),
                                      width: constraints.maxWidth,
                                      padding: EdgeInsets.only(
                                          top: heightSize(19),
                                          left: widthSize(20),
                                          right: widthSize(20),
                                          bottom: heightSize(27)),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(widthSize(10))),
                                          color:
                                              Color.fromARGB(255, 20, 30, 56)),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Align(
                                            alignment: Alignment.centerLeft,
                                            child: CText(
                                              text: "Daily task",
                                              size: 14,
                                              color: Color.fromARGB(
                                                  255, 191, 187, 187),
                                              fontFamily: UsedFonts.poppins,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          viewDailyTaskList(
                                              context, constraints.maxWidth),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }

                            if (earnController.chooseType.value == 1) {
                              return SizedBox(
                                  height: constraints.maxHeight,
                                  child: Column(
                                    children: [
                                      SizedBox(height: heightSize(3)),
                                      viewStreakTaskList(
                                          context, constraints.maxWidth)
                                    ],
                                  ));
                            }

                            // Default fallback widget
                            return const SizedBox.shrink();
                          })
                        ],
                      ),
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
