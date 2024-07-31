// ignore_for_file: must_be_immutable

import 'package:duwith_social/Pages/Earn%20More%20Page/components/daily_target_list.dart';
import 'package:duwith_social/Pages/Earn%20More%20Page/components/daily_target_widget.dart';
import 'package:duwith_social/Pages/Earn%20More%20Page/controller/earn_controller.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../common/custom-text.dart';

class DailyTaskScreen extends StatelessWidget {
  DailyTaskScreen({super.key});

  EarnController earnController = EarnController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Obx(() {
                return Padding(
                  padding: EdgeInsets.only(
                      top: heightSize(30),
                      left: widthSize(30),
                      right: widthSize(30)),
                  child: SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        dailyTaskAppBar(),
                        SizedBox(height: heightSize(33)),
                        dailyTaskChooseType(),
                        SizedBox(height: heightSize(18)),
                        //
                        if (earnController.chooseType.value == 0)
                          SizedBox(
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
                                      color: Color.fromARGB(255, 20, 30, 56)),
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
                          ),

                        //
                        //
                        if (earnController.chooseType.value == 1)
                          SizedBox(
                              child: Column(
                            children: [
                              SizedBox(height: heightSize(3)),
                              viewStreakTaskList(context, constraints.maxWidth)
                            ],
                          )),
                      ],
                    ),
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
