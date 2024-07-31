// ignore_for_file: invalid_use_of_protected_member

import 'package:duwith_social/Pages/Earn%20More%20Page/controller/earn_controller.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

import '../../../common/custom-text.dart';
import '../../../utils/color.dart';

EarnController earnController = EarnController.instance;

viewDailyTaskList(BuildContext context, double width) {
  return Expanded(
      child: ListView.builder(
          itemCount: earnController.dailyTaskList.value.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                viewDailyTaskWidget(
                    earnController.dailyTaskList.value[index], width),
                SizedBox(height: heightSize(10)),
              ],
            );
          }));
}

viewDailyTaskWidget(var data, double width) {
  return Container(
    height: heightSize(65),
    width: width,
    padding: EdgeInsets.symmetric(
        horizontal: widthSize(12), vertical: heightSize(14)),
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 25, 33, 57),
      borderRadius: BorderRadius.all(Radius.circular(widthSize(10))),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: heightSize(36),
          child: Row(
            children: [
              Container(
                height: heightSize(36),
                width: widthSize(36),
                padding: EdgeInsets.symmetric(
                    horizontal: widthSize(8), vertical: heightSize(8)),
                decoration: const ShapeDecoration(
                  shape: OvalBorder(),
                  color: Color.fromARGB(255, 28, 45, 97),
                ),
                child: Image.asset(
                  data["image"],
                  fit: BoxFit.fill,
                  height: heightSize(20),
                  width: widthSize(20),
                ),
              ),
              SizedBox(width: widthSize(6)),
              SizedBox(
                height: heightSize(36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CText(
                      text: data["task"],
                      size: 15,
                      fontFamily: UsedFonts.poppins,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: widthSize(71),
                          child: FAProgressBar(
                            currentValue: data["currentValue"],
                            maxValue: data["limitValue"],
                            backgroundColor: Color.fromARGB(255, 26, 41, 85),
                            // displayText: '%',
                            progressColor: mainColor,
                            size: heightSize(5),
                          ),
                        ),
                        SizedBox(width: widthSize(8)),
                        CText(
                          text:
                              "${data["currentValue"]}/ ${data["limitValue"]}",
                          size: 13,
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF49526C),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: data["isComplete"] == false
                  ? Color.fromARGB(255, 28, 45, 97)
                  : const Color(0xFF0AA92D),
              borderRadius: BorderRadius.all(Radius.circular(widthSize(8)))),
          padding: EdgeInsets.symmetric(
              horizontal: widthSize(9), vertical: heightSize(5)),
          child: Row(
            children: [
              SizedBox(
                height: heightSize(17),
                width: widthSize(22),
                child: Image.asset(
                  "assets/images/points.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
              CText(
                text: "${data["reward"]} ",
                size: 12,
                color: textColor,
                fontFamily: UsedFonts.poppins,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        )
      ],
    ),
  );
}

viewStreakTaskList(BuildContext context, double width) {
  return SizedBox(
    height: heightSize(700),
    child: Expanded(
        child: ListView.builder(
            itemCount: earnController.streakTaskList.value.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  viewStreakTaskWidget(
                      earnController.streakTaskList.value[index], width),
                  SizedBox(height: heightSize(20)),
                ],
              );
            })),
  );
}

viewStreakTaskWidget(var data, double width) {
  return Container(
    height: heightSize(106),
    width: width,
    padding: EdgeInsets.symmetric(
        horizontal: widthSize(12), vertical: heightSize(16)),
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 25, 33, 57),
      borderRadius: BorderRadius.all(Radius.circular(widthSize(10))),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Row(
            children: [
              Container(
                // height: heightSize(74),
                decoration: BoxDecoration(
                    color: data["isComplete"] == false
                        ? Color.fromARGB(255, 28, 45, 97)
                        : const Color(0xFF0AA92D),
                    borderRadius:
                        BorderRadius.all(Radius.circular(widthSize(8)))),
                padding: EdgeInsets.symmetric(
                    horizontal: widthSize(10), vertical: heightSize(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CText(
                      text: data["task"],
                      size: 12,
                      fontFamily: UsedFonts.poppins,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      color: const Color(0xFF7D98B9),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: heightSize(17),
                          width: widthSize(22),
                          child: Image.asset(
                            "assets/images/points.png",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        CText(
                          text: "${data["reward"]} ",
                          size: 12,
                          color: textColor,
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: widthSize(6)),
              SizedBox(
                height: heightSize(36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CText(
                      text: data["remark"],
                      size: 15,
                      fontFamily: UsedFonts.poppins,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: widthSize(71),
                          child: FAProgressBar(
                            currentValue: data["currentValue"],
                            maxValue: data["limitValue"],
                            backgroundColor: Color.fromARGB(255, 26, 41, 85),
                            // displayText: '%',
                            progressColor: mainColor,
                            size: heightSize(5),
                          ),
                        ),
                        SizedBox(width: widthSize(8)),
                        CText(
                          text:
                              "${data["currentValue"]}/ ${data["limitValue"]}",
                          size: 13,
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF49526C),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          height: heightSize(25),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: data["isComplete"] == false
                  ? const Color(0xFF354558)
                  : mainColor,
              borderRadius: BorderRadius.all(Radius.circular(widthSize(10)))),
          padding: EdgeInsets.symmetric(
              horizontal: widthSize(9), vertical: heightSize(5)),
          child: const CText(
            text: "Claim",
            size: 11,
            color: textColor,
            fontFamily: UsedFonts.poppins,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    ),
  );
}
