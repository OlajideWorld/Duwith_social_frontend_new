// ignore_for_file: invalid_use_of_protected_member

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../common/custom-text.dart';
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
          child: Column(
            children: [
              SizedBox(
                height: heightSize(65),
                width: widthSize(313),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  image: DecorationImage(
                                      image: imageprovider, fit: BoxFit.fill)),
                            );
                          },
                        ),
                        SizedBox(
                          width: widthSize(270),
                          child: CText(
                            text: writeup,
                            size: 15,
                            color: textColor,
                            fontFamily: UsedFonts.poppins,
                            fontWeight: FontWeight.w600,
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
                              horizontal: widthSize(6),
                              vertical: heightSize(3)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(widthSize(10))),
                              color: const Color(0xFF1A2138)),
                          child: Row(
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
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: widthSize(6),
                              vertical: heightSize(3)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(widthSize(10))),
                              color: const Color(0xFF1A2138)),
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
            ],
          ),
        ),
        SizedBox(height: heightSize(20)),
        SizedBox(
          width: widthSize(349),
          child: CText(
            text: homeController.quizQuestions
                .value[homeController.currentIndex.value].question,
            size: 13,
            color: const Color(0xFFC5CAD8),
            fontFamily: UsedFonts.poppins,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    ),
  );
}
