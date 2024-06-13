// ignore_for_file: invalid_use_of_protected_member

import 'package:cached_network_image/cached_network_image.dart';
import 'package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart';
import 'package:duwith_social/Pages/Auth%20Page/services/socket_sevice.dart';
import 'package:duwith_social/common/getxmessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../common/custom-text.dart';
import '../../../models/comments_model.dart';
import '../../../utils/color.dart';
import '../../../utils/demo_data.dart';
import '../../../utils/sizes.dart';

SocketService socketService = SocketService.instance;
AuthController authController = AuthController.instance;

commentsListView(BuildContext context, double width, List<CommentModel> replies,
    CommentModel commentsdata, VoidCallback onTap) {
  RxBool isExpanded = false.obs;

  return Container(
    padding: const EdgeInsets.all(10),
    width: width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: commentsdata.user.profileImage,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                imageBuilder: (context, imageprovider) {
                  return Container(
                    height: heightSize(26),
                    width: widthSize(26),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image: imageprovider, fit: BoxFit.fill)),
                  );
                },
              ),
              SizedBox(width: widthSize(10)),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CText(
                        text: commentsdata.user.username,
                        size: 15,
                        color: textColor,
                        fontFamily: UsedFonts.poppins,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(width: widthSize(8)),
                      const CText(
                        text: "06-21",
                        size: 11,
                        color: Color(0xFFB0AAAA),
                        fontFamily: UsedFonts.poppins,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  SizedBox(height: heightSize(8)),
                  SizedBox(
                    width: widthSize(238),
                    child: CText(
                      text: commentsdata.content,
                      size: 12,
                      color: const Color(0xFFC3C9DA),
                      fontFamily: UsedFonts.poppins,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: heightSize(8)),
                  replies.length == 0 || replies.isEmpty
                      ? Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: widthSize(5),
                              vertical: heightSize(10)),
                          child: Column(
                            children: [
                              Row(
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
                                                'View replies (${replies.length})',
                                            style: TextStyle(
                                              color: textColor,
                                              fontFamily: UsedFonts.poppins,
                                              fontWeight: FontWeight.w400,
                                              fontSize: fontSize(11),
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                // Handle the link tap here
                                                debugPrint('ITEMS clicked');
                                                isExpanded.value =
                                                    !isExpanded.value;
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
                                    onTap: () {
                                      getSuccessSnackBarEdit(
                                          "Notification", "Coming Soon");
                                    },
                                    child: const CText(
                                      text: "Reply",
                                      size: 13,
                                      color: Color(0xFF7D8399),
                                      fontFamily: UsedFonts.poppins,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: heightSize(10)),
                              isExpanded.value
                                  ? commentsRepliesListView(context, width)
                                  : const SizedBox()
                            ],
                          ),
                        )
                      : const CText(
                          text: "Reply",
                          size: 14,
                          color: Color(0xFF7D8399),
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w500,
                        ),
                ],
              ),
              //
            ],
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: heightSize(40),
            width: widthSize(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  commentsdata.likes.isNotEmpty
                      ? CupertinoIcons.heart_fill
                      : FontAwesomeIcons.heart,
                  size: widthSize(16),
                  color: commentsdata.likes.isNotEmpty ? Colors.red : textColor,
                ),
                CText(
                  text: commentsdata.likes.isNotEmpty
                      ? "${commentsdata.likes.length}"
                      : "",
                  size: 14,
                  color: Color(0xFFBEBEBE),
                  fontFamily: UsedFonts.poppins,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

commentsRepliesListView(BuildContext context, double width) {
  return Expanded(
    child: Padding(
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
                        backgroundImage:
                            AssetImage(comments.value[index].image),
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
                ],
              ),
            );
          }),
    ),
  );
}
