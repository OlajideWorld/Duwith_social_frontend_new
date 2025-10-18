// ignore_for_file: must_be_immutable, invalid_use_of_protected_member, prefer_const_constructors_in_immutables

import 'package:duwith_social/Pages/Auth%20Page/services/socket_sevice.dart';
import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:duwith_social/Pages/Home%20Page/screens/home_screen.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

import '../../../common/custom-text.dart';
import '../../Auth Page/controller/auth_controller.dart';
import '../../Shop Page/components/box_list.dart';

HomeController homeController = HomeController.instance;
AuthController authController = AuthController.instance;
SocketService socket = SocketService.instance;

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
      controller: homeController.postCaption,
      textInputAction: TextInputAction.done,
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

  HomeController homeController = HomeController.instance;

  RxBool isSelected = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          isSelected.value = !isSelected.value;
          homeController.toggleCategorySelection(name);
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

  @override
  Widget build(BuildContext context) {
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
  }
}

postContentSettings(double width) {
  return Container(
    height: heightSize(300),
    padding: EdgeInsets.symmetric(
        horizontal: widthSize(12), vertical: heightSize(22)),
    decoration: BoxDecoration(
        color: const Color(0xFF151B2E),
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
            name: "Turn off commenting",
            width: width,
            controller: homeController.commentingOpton),
        SizedBox(height: heightSize(12)),
        SwitchOptions(
            name: "Show captions",
            width: width,
            controller: homeController.showCaption),
        SizedBox(height: heightSize(12)),
        SwitchOptions(
            name: "Hide like on this post",
            width: width,
            controller: homeController.hideLike),
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

uploadComplete(BuildContext context, double width, String headline, String body,
    bool isSuccess) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Obx(() {
          return LoadingOverlayPro(
            isLoading: homeController.homeloading.value,
            child: Padding(
              padding: EdgeInsets.only(top: heightSize(120)),
              child: Container(
                height: heightSize(200),
                width: width,
                padding: EdgeInsets.only(
                    top: heightSize(34),
                    left: widthSize(18),
                    right: widthSize(20),
                    bottom: heightSize(34)),
                decoration: ShapeDecoration(
                  color: const Color(0xFF0E1528),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: heightSize(60),
                      width: widthSize(179),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CText(
                            text: headline,
                            color: Colors.white,
                            size: 20,
                            textAlign: TextAlign.center,
                            fontFamily: UsedFonts.poppins,
                            fontWeight: FontWeight.w600,
                          ),
                          CText(
                            text: body,
                            color: Colors.white,
                            size: 12,
                            textAlign: TextAlign.center,
                            fontFamily: UsedFonts.poppins,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    isSuccess
                        ? buttonsWidget(context, heightSize(50), width,
                            "Continue", mainColor, 14, () async {
                            homeController.homeloading.value = true;
                            // debugPrint(
                            //     homeController.uploadedImageUrl.value.toString());
                            final postMap = {
                              "user": authController.userId.value,
                              "categories": homeController.postcategories.value,
                              "commentsEnabled":
                                  homeController.commentingOpton.value,
                              "showCaption": homeController.showCaption.value,
                              "showLikes": homeController.hideLike.value,
                              "media": homeController.uploadedImageUrl.value,
                              "caption": homeController.postCaption.text.trim()
                            };
                            debugPrint(postMap.toString());
                            await socket.createPost(postMap);
                            homeController.homeloading.value = false;
                            Get.to(() => HomeScreen());
                            homeController.uploadedImageUrl.value = [];
                          }, false, textColor)
                        : buttonsWidget(
                            context,
                            heightSize(50),
                            width,
                            "Failed Try Again",
                            Colors.red,
                            14,
                            () {},
                            false,
                            Colors.white)
                  ],
                ),
              ),
            ),
          );
        });
      });
}
