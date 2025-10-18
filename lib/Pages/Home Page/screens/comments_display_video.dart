// ignore_for_file: invalid_use_of_protected_member, must_be_immutabl, must_be_immutable
import "package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart";
import "package:duwith_social/Pages/Auth%20Page/services/socket_sevice.dart";
import "package:duwith_social/Services/BannerAds_custom/bannerAds.dart";
import "package:duwith_social/common/comments_loading.dart";
import "package:duwith_social/common/getxmessage.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_mobile_ads/google_mobile_ads.dart";

import "../../../common/custom-text.dart";
import "../../../utils/color.dart";
import "../../../utils/sizes.dart";
import "../components/comments_replies_display.dart";
import "../controllers/home_controller.dart";

showCommentsVideo({required BuildContext context, required String postId}) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CommentsDisplayBottomSheet(
          postId: postId,
        );
      });
}

class CommentsDisplayBottomSheet extends StatefulWidget {
  final String postId;
  const CommentsDisplayBottomSheet({
    super.key,
    required this.postId,
  });

  @override
  State<CommentsDisplayBottomSheet> createState() =>
      _CommentsDisplayBottomSheetState();
}

class _CommentsDisplayBottomSheetState
    extends State<CommentsDisplayBottomSheet> {
  HomeController homeController = HomeController.instance;

  AuthController authController = AuthController.instance;

  SocketService socketService = SocketService.instance;

  FocusNode _focusNode = FocusNode();
  bool _isTextFieldFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isTextFieldFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return Container(
      height: heightSize(700),
      padding: EdgeInsets.only(
          top: heightSize(15),
          left: widthSize(20),
          right: widthSize(20),
          bottom: heightSize(20)),
      decoration: BoxDecoration(
        color: const Color(0xFF151B2E),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widthSize(15)),
            topRight: Radius.circular(widthSize(15))),
      ),
      child: Obx(() {
        return SizedBox(
          child: Stack(children: [
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: heightSize(3),
                    width: widthSize(127),
                    decoration: BoxDecoration(
                        color: textColor,
                        borderRadius:
                            BorderRadius.all(Radius.circular(widthSize(5)))),
                  ),

                  const ItemWithBanner(someItemId: "Custom Banner"),

                  CText(
                    text: "${homeController.commentsListVideo.length} Comments",
                    size: 18,
                    color: const Color(0xFFBEBEBE),
                    fontFamily: UsedFonts.poppins,
                    fontWeight: FontWeight.w500,
                  ),

                  homeController.loadingComment.value == true
                      ? const CommentShimmerLoading()
                      : homeController.commentsListVideo.isEmpty
                          ? const SizedBox()
                          : Expanded(
                              child: ListView.builder(
                                  itemCount:
                                      homeController.commentsListVideo.length,
                                  itemBuilder: (context, index) {
                                    return commentsListView(
                                        context,
                                        maxWidth,
                                        homeController.commentsListVideo.value,
                                        homeController.commentsListVideo
                                            .value[index], () async {
                                      await socketService.likeComments(
                                          homeController.commentsListVideo
                                              .value[index].id,
                                          authController.userId.value,
                                          2);
                                    });
                                  }),
                            ),

                  // This is the design to send message
                ],
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              bottom: _isTextFieldFocused
                  ? MediaQuery.of(context).viewInsets.bottom
                  : 0,
              left: 0,
              right: 0,
              child: Container(
                height: heightSize(60),
                width: maxWidth,
                decoration: BoxDecoration(
                    color: const Color(0xFF151B2E),
                    border: Border.all(color: buttonColor2),
                    borderRadius:
                        BorderRadius.all(Radius.circular(widthSize(20)))),
                padding: EdgeInsets.symmetric(
                    vertical: heightSize(5), horizontal: widthSize(8)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        focusNode: _focusNode,
                        style: TextStyle(
                            fontFamily: UsedFonts.poppins,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFB4B4B4),
                            fontSize: fontSize(14)),
                        maxLines: 5,
                        controller: homeController.commentsText,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: "Add Comments",
                          hintStyle: const TextStyle(color: Color(0xFF918F99)),
                          filled: true,
                          fillColor: const Color(0xFF151B2E),
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFF1F2138)),
                              borderRadius: BorderRadius.circular(16)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFF1F2138)),
                              borderRadius: BorderRadius.circular(16)),
                          contentPadding: EdgeInsets.only(
                              left: widthSize(15),
                              top: heightSize(4),
                              right: widthSize(4),
                              bottom: heightSize(5)),
                        ),
                      ),
                    ),
                    SizedBox(width: widthSize(10)),
                    GestureDetector(
                        onTap: () async {
                          if (homeController.commentsText.text.trim() == "") {
                            getErrorSnackBar(
                                "you have to input a message to comment");
                          } else {
                            homeController.isCommenting.value = true;
                            final data = {
                              "post": widget.postId,
                              "user": authController.userdata.value.id,
                              "content":
                                  homeController.commentsText.text.trim(),
                              "parentComment": homeController.isReply.value
                                  ? homeController.parentCommentId.value
                                  : null,
                            };
                            await socketService.addComment(data);
                            await socketService.getCommentByPostId(
                                widget.postId, 2);
                            homeController.commentsText.text = "";
                          }
                        },
                        child: homeController.isCommenting.value == true
                            ? Container(
                                height: heightSize(50),
                                width: widthSize(50),
                                padding: EdgeInsets.symmetric(
                                    horizontal: widthSize(10),
                                    vertical: heightSize(10)),
                                alignment: Alignment.center,
                                decoration: const ShapeDecoration(
                                    shape: OvalBorder(), color: mainColor),
                                child: const CircularProgressIndicator(
                                  color: textColor,
                                ))
                            : Container(
                                height: heightSize(50),
                                width: widthSize(50),
                                alignment: Alignment.center,
                                decoration: const ShapeDecoration(
                                    shape: OvalBorder(), color: mainColor),
                                child: Icon(
                                  Icons.send,
                                  size: heightSize(30),
                                  color: textColor,
                                ),
                              )),
                  ],
                ),
              ),
            ),
          ]),
        );
      }),
    );
  }
}
