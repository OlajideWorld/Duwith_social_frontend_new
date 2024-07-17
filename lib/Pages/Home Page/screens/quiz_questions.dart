// ignore_for_file: must_be_immutable, invalid_use_of_protected_member

import 'package:cached_network_image/cached_network_image.dart';
import 'package:duwith_social/Pages/Home%20Page/components/home_quiz.dart';
import 'package:duwith_social/Pages/Home%20Page/components/quiz_questions_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../common/custom-text.dart';
import '../../../utils/color.dart';
import '../../../utils/sizes.dart';
import '../controllers/home_controller.dart';

class QuizQuestionsDetails extends StatelessWidget {
  final String image;
  final String writeup;
  final String quizType;
  final int quiztakers;
  QuizQuestionsDetails(
      {super.key,
      required this.image,
      required this.writeup,
      required this.quizType,
      required this.quiztakers});

  HomeController homeController = HomeController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Obx(() {
            return SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: SafeArea(
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    child: Column(
                      children: [
                        SizedBox(height: heightSize(30)),
                        quizAppBar(),
                        SizedBox(height: heightSize(32)),
                        quizQuestionsContainer(
                            constraints.maxWidth, image, writeup, quizType),
                        SizedBox(height: heightSize(5)),
                        Container(
                          height: heightSize(567),
                          width: constraints.maxWidth,
                          padding: EdgeInsets.symmetric(
                              vertical: heightSize(20),
                              horizontal: widthSize(20)),
                          decoration:
                              const BoxDecoration(color: Color(0xFF28282C)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CText(
                                text: "Quiz",
                                size: 17,
                                color: Color(0xFFC5CAD8),
                                fontFamily: UsedFonts.poppins,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(height: heightSize(5)),
                              const CText(
                                text:
                                    "Make sure to complete the questions before you can be given full points",
                                size: 12,
                                color: Color(0xFFC5CAD8),
                                fontFamily: UsedFonts.poppins,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(height: heightSize(5)),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: heightSize(5),
                                    horizontal: widthSize(7)),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(widthSize(10))),
                                    color: const Color(0xFF054C8D)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.people,
                                        color: textColor, size: heightSize(12)),
                                    SizedBox(width: widthSize(5)),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: heightSize(3)),
                                      child: CText(
                                        text:
                                            "${homeController.engagementShortened(quiztakers)} participants",
                                        size: 10,
                                        color: textColor,
                                        fontFamily: UsedFonts.poppins,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: heightSize(66)),
                              GestureDetector(
                                onTap: () {
                                  homeController.isSelected.value = 1;
                                },
                                child: Container(
                                  height: heightSize(60),
                                  width: constraints.maxWidth,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(
                                      left: homeController.isSelected.value == 1
                                          ? widthSize(10)
                                          : widthSize(0)),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(widthSize(10))),
                                      color:
                                          homeController.isSelected.value == 1
                                              ? const Color(0xFF0BCEDB)
                                              : const Color(0xFF373F5A),
                                      border: Border.all(
                                          color:
                                              homeController.isSelected.value ==
                                                      1
                                                  ? const Color(0xFF0BCEDB)
                                                  : const Color(0xFF373F5A))),
                                  child: Container(
                                    height: heightSize(60),
                                    width: constraints.maxWidth,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF373F5A),
                                    ),
                                    child: CText(
                                      text: homeController
                                          .quizQuestions
                                          .value[
                                              homeController.currentIndex.value]
                                          .optionA,
                                      size: 14,
                                      color: textColor,
                                      fontFamily: UsedFonts.poppins,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: heightSize(8)),
                              GestureDetector(
                                onTap: () {
                                  homeController.isSelected.value = 2;
                                },
                                child: Container(
                                  height: heightSize(60),
                                  width: constraints.maxWidth,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(
                                      left: homeController.isSelected.value == 2
                                          ? widthSize(10)
                                          : widthSize(0)),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(widthSize(10))),
                                      color:
                                          homeController.isSelected.value == 2
                                              ? const Color(0xFF0BCEDB)
                                              : const Color(0xFF373F5A),
                                      border: Border.all(
                                          color:
                                              homeController.isSelected.value ==
                                                      2
                                                  ? const Color(0xFF0BCEDB)
                                                  : const Color(0xFF373F5A))),
                                  child: Container(
                                    height: heightSize(60),
                                    width: constraints.maxWidth,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF373F5A),
                                    ),
                                    child: CText(
                                      text: homeController
                                          .quizQuestions
                                          .value[
                                              homeController.currentIndex.value]
                                          .optionB,
                                      size: 14,
                                      color: textColor,
                                      fontFamily: UsedFonts.poppins,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: heightSize(8)),
                              GestureDetector(
                                onTap: () {
                                  homeController.isSelected.value = 3;
                                },
                                child: Container(
                                  height: heightSize(60),
                                  width: constraints.maxWidth,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(
                                      left: homeController.isSelected.value == 3
                                          ? widthSize(10)
                                          : widthSize(0)),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(widthSize(10))),
                                      color:
                                          homeController.isSelected.value == 3
                                              ? const Color(0xFF0BCEDB)
                                              : const Color(0xFF373F5A),
                                      border: Border.all(
                                        color:
                                            homeController.isSelected.value == 3
                                                ? const Color(0xFF0BCEDB)
                                                : const Color(0xFF373F5A),
                                      )),
                                  child: Container(
                                    height: heightSize(60),
                                    width: constraints.maxWidth,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF373F5A),
                                    ),
                                    child: CText(
                                      text: homeController
                                          .quizQuestions
                                          .value[
                                              homeController.currentIndex.value]
                                          .optionC,
                                      size: 14,
                                      color: textColor,
                                      fontFamily: UsedFonts.poppins,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: heightSize(8)),
                              GestureDetector(
                                onTap: () {
                                  homeController.isSelected.value = 4;
                                },
                                child: Container(
                                  height: heightSize(60),
                                  width: constraints.maxWidth,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(
                                      left: homeController.isSelected.value == 4
                                          ? widthSize(10)
                                          : widthSize(0)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(widthSize(10))),
                                    color: homeController.isSelected.value == 4
                                        ? const Color(0xFF0BCEDB)
                                        : const Color(0xFF373F5A),
                                    border: Border.all(
                                      color:
                                          homeController.isSelected.value == 4
                                              ? const Color(0xFF0BCEDB)
                                              : const Color(0xFF373F5A),
                                    ),
                                  ),
                                  child: Container(
                                    height: heightSize(60),
                                    width: constraints.maxWidth,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF373F5A),
                                    ),
                                    child: CText(
                                      text: homeController
                                          .quizQuestions
                                          .value[
                                              homeController.currentIndex.value]
                                          .optionD,
                                      size: 14,
                                      color: textColor,
                                      fontFamily: UsedFonts.poppins,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
