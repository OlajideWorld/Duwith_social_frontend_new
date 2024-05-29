// ignore_for_file: must_be_immutable

import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:get/get.dart';

import '../../../common/custom-text.dart';
import '../../Shop Page/components/box_list.dart';

writeOpinions(double width) {
  return Container(
    height: heightSize(90),
    width: width,
    decoration: BoxDecoration(
        color: const Color(0xFF151B2E),
        borderRadius: BorderRadius.all(Radius.circular(widthSize(20)))),
    child: TextField(
      style: TextStyle(
          fontFamily: UsedFonts.poppins,
          fontWeight: FontWeight.w500,
          color: const Color(0xFFB4B4B4),
          fontSize: fontSize(14)),
      maxLines: 5,
      decoration: InputDecoration(
        hintText: "Write your opinion",
        hintStyle: const TextStyle(color: Color(0xFF918F99)),
        filled: true,
        fillColor: Color(0xFF151B2E),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF1F2138)),
            borderRadius: BorderRadius.circular(16)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF1F2138)),
            borderRadius: BorderRadius.circular(16)),
        contentPadding: EdgeInsets.only(
            left: widthSize(15),
            top: heightSize(4),
            right: widthSize(4),
            bottom: heightSize(5)),
      ),
    ),
  );
}

class SelectTags extends StatelessWidget {
  final String name;

  SelectTags({super.key, required this.name});

  RxBool isSelected = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          isSelected.value = !isSelected.value;
        },
        child: Container(
          height: heightSize(30),
          padding: EdgeInsets.symmetric(
              horizontal: widthSize(16), vertical: heightSize(6)),
          decoration: BoxDecoration(
              color: const Color(0xFF1A2137),
              borderRadius: BorderRadius.all(Radius.circular(widthSize(15))),
              border: Border.all(
                  color: isSelected.value == true
                      ? textColor
                      : const Color(0xFF1F2138))),
          child: CText(
            text: name,
            size: 13,
            color: isSelected.value == true ? textColor : textColor3,
            fontFamily: UsedFonts.poppins,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    });
  }
}

class SwitchOptions extends StatelessWidget {
  final String name;
  final double width;
  final ValueNotifier<bool> controller;
  SwitchOptions(
      {super.key,
      required this.name,
      required this.width,
      required this.controller});

  RxBool isSelected = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        height: heightSize(30),
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: heightSize(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CText(
                    text: name,
                    size: 13,
                    color: textColor,
                    fontFamily: UsedFonts.poppins,
                    fontWeight: FontWeight.w600,
                  ),
                  AdvancedSwitch(
                    controller: controller,
                    activeColor: const Color(0xFF5E5CE6),
                    inactiveColor: switchoff,
                    borderRadius:
                        BorderRadius.all(Radius.circular(widthSize(79.20))),
                    width: widthSize(40),
                    height: heightSize(20),
                    enabled: true,
                  )
                ],
              ),
            ),
            Divider(
              height: heightSize(3),
              thickness: 1,
              color: const Color(0xFF3C3C3C),
            ),
          ],
        ),
      );
    });
  }
}

postContentSettings(double width) {
  final switch1 = ValueNotifier<bool>(true);
  final switch2 = ValueNotifier<bool>(false);
  final switch3 = ValueNotifier<bool>(false);
  return Container(
    height: heightSize(300),
    padding: EdgeInsets.symmetric(
        horizontal: widthSize(12), vertical: heightSize(22)),
    decoration: BoxDecoration(
        color: Color(0xFF151B2E),
        borderRadius: BorderRadius.all(Radius.circular(widthSize(15)))),
    width: width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CText(
          text: "Advanced settings",
          size: 12,
          color: Color(0xFF6A6578),
          fontFamily: UsedFonts.poppins,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: heightSize(16)),
        SwitchOptions(
            name: "Turn off commenting", width: width, controller: switch1),
        SizedBox(height: heightSize(12)),
        SwitchOptions(name: "Show captions", width: width, controller: switch2),
        SizedBox(height: heightSize(12)),
        SwitchOptions(
            name: "Hide like on this post", width: width, controller: switch3),
        SizedBox(height: heightSize(12)),
        Container(
          height: heightSize(78),
          padding: EdgeInsets.symmetric(
              horizontal: widthSize(12), vertical: heightSize(15)),
          decoration: BoxDecoration(
              color: const Color(0xFF1A2137),
              borderRadius: BorderRadius.all(Radius.circular(widthSize(10)))),
          width: width,
          child: SizedBox(
            height: heightSize(48),
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: heightSize(15),
                  child: Row(
                    children: [
                      const CText(
                        text: "How the points calculated",
                        size: 10,
                        fontFamily: UsedFonts.poppins,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF8A93A3),
                      ),
                      Icon(Icons.warning,
                          size: heightSize(12), color: textColor),
                    ],
                  ),
                ),
                Divider(
                  height: heightSize(3),
                  thickness: 1,
                  color: const Color(0xFF3C3C3C),
                ),
                SizedBox(
                  height: heightSize(21),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CText(
                        text: "100 Responses",
                        size: 10,
                        fontFamily: UsedFonts.poppins,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFC1C1C1),
                      ),
                      shopIconwidget("assets/images/points.png", "100 points",
                          30, 27, 13, textColor)
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
