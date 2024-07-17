// ignore_for_file: invalid_use_of_protected_member

import 'package:cached_network_image/cached_network_image.dart';
import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:duwith_social/Pages/Home%20Page/screens/quiz_questions.dart';
import 'package:duwith_social/models/quiz_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

import '../../../common/button-widget.dart';
import '../../../common/custom-text.dart';
import '../../../utils/color.dart';
import '../../../utils/sizes.dart';
import '../../Auth Page/controller/auth_controller.dart';
import '../../Auth Page/services/socket_sevice.dart';

HomeController homeController = HomeController.instance;
SocketService socket = SocketService.instance;
AuthController authController = AuthController.instance;

quizListWidget(BuildContext context, double width) {
  return homeController.mainquizList.value.isEmpty ||
          homeController.mainquizList.value == null
      ? const Align(
          alignment: Alignment.center,
          child: Center(
            child: CText(
              text:
                  "Not able to fetch data, Check internet connection and try again",
              size: 18,
              color: textColor,
              fontFamily: UsedFonts.poppins,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      : LoadingOverlayPro(
          isLoading: homeController.isgettngQuestions.value,
          progressIndicator: const LoadingBouncingGrid.square(
            backgroundColor: mainColor,
          ),
          child: Expanded(
            child: ListView.builder(
                itemCount: homeController.mainquizList.value.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: heightSize(10)),
                    child: Column(
                      children: [
                        QuizListWidget(
                            width: width,
                            mainQuizData:
                                homeController.mainquizList.value[index])
                      ],
                    ),
                  );
                }),
          ),
        );
}

class QuizListWidget extends StatelessWidget {
  final double width;
  final MainQuizModel mainQuizData;
  const QuizListWidget(
      {super.key, required this.width, required this.mainQuizData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await homeController.fetchQuizQuestionsList(
            mainQuizData.id,
            mainQuizData.image,
            mainQuizData.quizWriteUp,
            mainQuizData.category,
            mainQuizData.quizTakers);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
        child: Container(
            alignment: Alignment.center,
            height: heightSize(150),
            width: width,
            decoration: BoxDecoration(
              color: Color(0xFF28282C),
              borderRadius: BorderRadius.all(
                Radius.circular(widthSize(12)),
              ),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: widthSize(10), vertical: heightSize(10)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: mainQuizData.image,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  imageBuilder: (context, imageprovider) {
                    return Container(
                      height: heightSize(200),
                      width: widthSize(150),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                              image: imageprovider, fit: BoxFit.fill)),
                    );
                  },
                ),
                SizedBox(width: widthSize(10)),
                SizedBox(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: heightSize(3),
                                  horizontal: widthSize(8)),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(widthSize(10))),
                                  color: Color.fromARGB(255, 95, 103, 126)),
                              child: CText(
                                text: mainQuizData.category,
                                size: 10,
                                color: textColor,
                                fontFamily: UsedFonts.poppins,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: heightSize(5)),
                            Container(
                              padding: EdgeInsets.only(
                                  top: heightSize(3),
                                  right: widthSize(7.5),
                                  bottom: heightSize(3),
                                  left: widthSize(2)),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(widthSize(10))),
                                  color: Color.fromARGB(255, 95, 103, 126)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: heightSize(15),
                                    width: widthSize(20),
                                    child:
                                        Image.asset("assets/images/points.png"),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: heightSize(3)),
                                    child: CText(
                                      text:
                                          "${homeController.engagementShortened(mainQuizData.maxreward)} Total points won",
                                      size: 10,
                                      color: textColor,
                                      fontFamily: UsedFonts.poppins,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: heightSize(51),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widthSize(160),
                            child: CText(
                              text: mainQuizData.quizWriteUp,
                              size: 12,
                              color: textColor,
                              fontFamily: UsedFonts.poppins,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.timer_outlined,
                                size: heightSize(12),
                                color: mainColor,
                              ),
                              SizedBox(width: widthSize(10)),
                              const CText(
                                text: "5 mins",
                                size: 9,
                                color: Color(0xFF9193BB),
                                fontFamily: UsedFonts.poppins,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: heightSize(5), horizontal: widthSize(7)),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(widthSize(10))),
                          color: Color(0xFF054C8D)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   height: heightSize(15),
                          //   width: widthSize(20),
                          //   child: Image.asset("assets/images/points.png"),
                          // ),
                          Icon(Icons.people,
                              color: textColor, size: heightSize(12)),
                          SizedBox(width: widthSize(5)),
                          Padding(
                            padding: EdgeInsets.only(top: heightSize(3)),
                            child: CText(
                              text:
                                  "Total number of partakers: ${homeController.engagementShortened(mainQuizData.quizTakers)}",
                              size: 10,
                              color: textColor,
                              fontFamily: UsedFonts.poppins,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            )),
      ),
    );
  }
}

quizAppBar() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
    child: SizedBox(
      height: heightSize(32),
      child: Row(
        children: [
          backbutton(onTap: () => Get.back()),
          SizedBox(width: widthSize(127)),
          const CText(
            text: "Quiz",
            size: 12,
            fontFamily: UsedFonts.poppins,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    ),
  );
}
