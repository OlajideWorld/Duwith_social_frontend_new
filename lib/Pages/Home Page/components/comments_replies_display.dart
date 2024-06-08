// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../common/custom-text.dart';
import '../../../utils/color.dart';
import '../../../utils/demo_data.dart';
import '../../../utils/sizes.dart';

commentsListView(double width, int commentsLength, int repliesLength) {
  RxBool isExpanded = false.obs;
  return Expanded(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: comments.value.length,
          itemBuilder: (context, index) {
            return Obx(() {
              return SizedBox(
                height: heightSize(74),
                width: width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // CachedNetworkImage(
                        //   imageUrl: widget.image[0].url,
                        //   placeholder: (context, url) =>
                        //       const CircularProgressIndicator(),
                        //   imageBuilder: (context, imageprovider) {
                        //     return Container(
                        //       height: heightSize(200),
                        //       // width: widthSize(170),
                        //       decoration: BoxDecoration(
                        //           borderRadius:
                        //               const BorderRadius.all(Radius.circular(10)),
                        //           image: DecorationImage(
                        //               image: imageprovider, fit: BoxFit.fill)),
                        //     );
                        //   },
                        // ),
                        CircleAvatar(
                          radius: widthSize(13),
                          backgroundImage:
                              AssetImage(comments.value[index].image),
                        ),
                        SizedBox(width: widthSize(10)),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: widthSize(150),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CText(
                                          text: comments.value[index].name,
                                          size: 14,
                                          color: const Color(0xFFBEBEBE),
                                          fontFamily: UsedFonts.poppins,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        CText(
                                          text: "06-21",
                                          size: 14,
                                          color: const Color(0xFFBEBEBE),
                                          fontFamily: UsedFonts.poppins,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Expanded(
                                    child: CText(
                                      text:
                                          "The large screen real estate allows me to multitask effortlessly and boost my ego",
                                      size: 14,
                                      color: Color(0xFFBEBEBE),
                                      fontFamily: UsedFonts.poppins,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  repliesLength == 0 || repliesLength == null
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: widthSize(101),
                                              child: Row(
                                                children: [
                                                  RichText(
                                                    textAlign: TextAlign.center,
                                                    text: TextSpan(
                                                      text:
                                                          'View replies ($repliesLength)',
                                                      style: TextStyle(
                                                        color: textColor,
                                                        fontFamily:
                                                            UsedFonts.poppins,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: fontSize(11),
                                                      ),
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              // Handle the link tap here
                                                              debugPrint(
                                                                  'ITEMS clicked');
                                                              isExpanded.value =
                                                                  !isExpanded
                                                                      .value;
                                                            }, // Default text style
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.keyboard_arrow_down,
                                                    size: heightSize(16),
                                                  )
                                                ],
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: const CText(
                                                text: "Reply",
                                                size: 14,
                                                color: Color(0xFFBEBEBE),
                                                fontFamily: UsedFonts.poppins,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        )
                                      : const CText(
                                          text: "Reply",
                                          size: 14,
                                          color: Color(0xFFBEBEBE),
                                          fontFamily: UsedFonts.poppins,
                                          fontWeight: FontWeight.w500,
                                        ),
                                ],
                              ),
                              SizedBox(
                                height: heightSize(40),
                                width: widthSize(40),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.heart,
                                      size: widthSize(16),
                                      color: textColor,
                                    ),
                                    const CText(
                                      text: "20",
                                      size: 14,
                                      color: Color(0xFFBEBEBE),
                                      fontFamily: UsedFonts.poppins,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    isExpanded.value == true
                        ? commentsRepliesListView(context, width)
                        : const SizedBox()
                  ],
                ),
              );
            });
          }),
    ),
  );
}

commentsRepliesListView(BuildContext context, double width) {
  return Padding(
    padding: EdgeInsets.only(left: widthSize(10)),
    child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: comments.value.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: heightSize(74),
            width: width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CachedNetworkImage(
                    //   imageUrl: widget.image[0].url,
                    //   placeholder: (context, url) =>
                    //       const CircularProgressIndicator(),
                    //   imageBuilder: (context, imageprovider) {
                    //     return Container(
                    //       height: heightSize(200),
                    //       // width: widthSize(170),
                    //       decoration: BoxDecoration(
                    //           borderRadius:
                    //               const BorderRadius.all(Radius.circular(10)),
                    //           image: DecorationImage(
                    //               image: imageprovider, fit: BoxFit.fill)),
                    //     );
                    //   },
                    // ),
                    CircleAvatar(
                      radius: widthSize(13),
                      backgroundImage: AssetImage(comments.value[index].image),
                    ),
                    SizedBox(width: widthSize(10)),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: widthSize(150),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CText(
                                      text: comments.value[index].name,
                                      size: 14,
                                      color: const Color(0xFFBEBEBE),
                                      fontFamily: UsedFonts.poppins,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    CText(
                                      text: "06-21",
                                      size: 14,
                                      color: const Color(0xFFBEBEBE),
                                      fontFamily: UsedFonts.poppins,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                              const Expanded(
                                child: CText(
                                  text:
                                      "The large screen real estate allows me to multitask effortlessly and boost my ego",
                                  size: 14,
                                  color: Color(0xFFBEBEBE),
                                  fontFamily: UsedFonts.poppins,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: heightSize(40),
                            width: widthSize(40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.heart,
                                  size: widthSize(16),
                                  color: textColor,
                                ),
                                const CText(
                                  text: "20",
                                  size: 14,
                                  color: Color(0xFFBEBEBE),
                                  fontFamily: UsedFonts.poppins,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
  );
}
