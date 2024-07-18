// ignore_for_file: invalid_use_of_protected_member

import 'package:cached_network_image/cached_network_image.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/custom-text.dart';
import '../../../routes/routes.dart';
import '../../../utils/color.dart';
import '../../../utils/sizes.dart';
import '../controllers/home_controller.dart';

HomeController homeController = HomeController.instance;

quizQuestionsContainer(
  double width,
  String image,
  String writeup,
  String quizType,
) {
  return Container(
    width: width,
    padding: EdgeInsets.symmetric(
        vertical: heightSize(20), horizontal: widthSize(20)),
    decoration: const BoxDecoration(color: Color(0xFF28282C)),
    child: Column(
      children: [
        SizedBox(
          height: heightSize(65),
          width: widthSize(313),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: image,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    imageBuilder: (context, imageprovider) {
                      return Container(
                        height: heightSize(35),
                        width: widthSize(35),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: imageprovider, fit: BoxFit.fill)),
                      );
                    },
                  ),
                  SizedBox(width: widthSize(8)),
                  Padding(
                    padding: EdgeInsets.only(top: heightSize(4)),
                    child: SizedBox(
                      width: widthSize(270),
                      child: CText(
                        text: writeup,
                        size: 15,
                        color: textColor,
                        fontFamily: UsedFonts.poppins,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: widthSize(6), vertical: heightSize(3)),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(widthSize(10))),
                        color: const Color(0xFF054C8D)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          size: heightSize(12),
                          color: textColor,
                        ),
                        SizedBox(width: widthSize(10)),
                        const CText(
                          text: "5 mins",
                          size: 9,
                          color: textColor,
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: widthSize(15)),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: widthSize(6), vertical: heightSize(3)),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(widthSize(10))),
                        color: const Color(0xFF054C8D)),
                    child: CText(
                      text: "$quizType quiz",
                      size: 10,
                      color: textColor,
                      fontFamily: UsedFonts.poppins,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(height: heightSize(30)),
        SizedBox(
          width: widthSize(349),
          child: CText(
            text: homeController.quizQuestions
                .value[homeController.currentIndex.value].question,
            size: 18,
            color: textColor,
            fontFamily: UsedFonts.poppins,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    ),
  );
}

showQuizResults(BuildContext context, double width) {
  return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (contex) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: widthSize(20), vertical: heightSize(215)),
          child: Container(
            height: heightSize(380),
            padding: EdgeInsets.symmetric(
                vertical: heightSize(57), horizontal: widthSize(65)),
            decoration: BoxDecoration(
              color: const Color(0xFF151B2E),
              borderRadius: BorderRadius.all(Radius.circular(widthSize(10))),
            ),
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: heightSize(140),
                  width: widthSize(120),
                  child: Image.asset(
                    "assets/images/quizImage.png",
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: heightSize(5)),
                CText(
                  text: homeController.totalReward.value > 30
                      ? "You Passed"
                      : "You Failed",
                  color: Colors.white,
                  size: 18,
                  textAlign: TextAlign.center,
                  fontFamily: UsedFonts.poppins,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: heightSize(10)),
                const CText(
                  text: "You have successfully completed this quiz",
                  color: Colors.white,
                  size: 18,
                  textAlign: TextAlign.center,
                  fontFamily: UsedFonts.poppins,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: heightSize(10)),
                SizedBox(
                  width: widthSize(84),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: widthSize(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: heightSize(20),
                              width: widthSize(20),
                              child: Image.asset(
                                "assets/images/goodtick.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            CText(
                              text:
                                  homeController.numberPassed.value.toString(),
                              color: Colors.white,
                              size: 15,
                              textAlign: TextAlign.center,
                              fontFamily: UsedFonts.poppins,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: widthSize(10)),
                      VerticalDivider(
                        width: widthSize(2),
                        color: textColor2,
                      ),
                      SizedBox(width: widthSize(10)),
                      // dislikes
                      SizedBox(
                        width: widthSize(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: heightSize(20),
                              width: widthSize(20),
                              child: Image.asset(
                                "assets/images/badtick.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            CText(
                              text:
                                  homeController.numberfailed.value.toString(),
                              color: Colors.white,
                              size: 15,
                              textAlign: TextAlign.center,
                              fontFamily: UsedFonts.poppins,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: heightSize(20)),
                buttonsWidget(
                    context, heightSize(40), width, "Next", mainColor, 17, () {
                  homeController.currentIndex.value = 0;
                  homeController.totalReward.value = 0;
                  homeController.numberPassed.value = 0;
                  homeController.numberfailed.value = 0;
                  homeController.isSelected.value = 0;
                  homeController.selectedAnswer.value = "";
                  Get.toNamed(MyRoutes.homeScreen);
                }, false, textColor)
              ],
            ),
          ),
        );
      });
}
