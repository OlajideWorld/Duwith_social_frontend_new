// ignore_for_file: invalid_use_of_protected_member, must_be_immutabl, must_be_immutable
import "package:cached_network_image/cached_network_image.dart";
import "package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart";
import "package:duwith_social/Pages/Auth%20Page/services/socket_sevice.dart";
import "package:duwith_social/common/comments_loading.dart";
import "package:duwith_social/common/getxmessage.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";
import "package:google_mobile_ads/google_mobile_ads.dart";

import "../../../common/custom-text.dart";
import "../../../utils/color.dart";
import "../../../utils/sizes.dart";
import "../components/comments_replies_display.dart";
import "../controllers/home_controller.dart";

showComments(
    {required BuildContext context,
    required String postId,
    required String userImage,
    required String postUserName}) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CommentsDisplayBottomSheet(
          postId: postId,
          userImage: userImage,
          postUsername: postUserName,
        );
      });
}

class CommentsDisplayBottomSheet extends StatefulWidget {
  final String postId;
  final String userImage;
  final String postUsername;
  const CommentsDisplayBottomSheet({
    super.key,
    required this.postId,
    required this.userImage,
    required this.postUsername,
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
          top: heightSize(10),
          left: widthSize(20),
          right: widthSize(20),
          bottom: heightSize(20)),
      decoration: BoxDecoration(
        color: const Color(0xFF151B2E),
        border: const Border(top: BorderSide(color: textColor3)),
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
                    height: heightSize(5),
                    width: widthSize(127),
                    decoration: BoxDecoration(
                        color: textColor,
                        borderRadius:
                            BorderRadius.all(Radius.circular(widthSize(5)))),
                  ),
                  SizedBox(height: heightSize(15)),
                  homeController.bannerAd != null
                      ? SizedBox(
                          height: heightSize(100),
                          width: maxWidth,
                          child: AdWidget(ad: homeController.bannerAd!))
                      : SizedBox(),

                  Padding(
                    padding: EdgeInsets.only(
                        left: widthSize(30), right: widthSize(10)),
                    child: SizedBox(
                      width: maxWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Replies (${homeController.engagementShortened(homeController.commentsList.length)})",
                            style: GoogleFonts.plusJakartaSans(
                              color: textColor,
                              fontSize: fontSize(13),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: widthSize(80),
                            child: Row(
                              children: [
                                Text(
                                  "Top",
                                  style: GoogleFonts.plusJakartaSans(
                                    color: mainColor,
                                    fontSize: fontSize(13),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: widthSize(10)),
                                Text(
                                  "Latest",
                                  style: GoogleFonts.plusJakartaSans(
                                    color: const Color(0xFF858585),
                                    fontSize: fontSize(13),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: heightSize(15)),
                  homeController.loadingComment.value == true
                      ? const CommentShimmerLoading()
                      : homeController.commentsList.isEmpty
                          ? const SizedBox()
                          : Expanded(
                              child: ListView.builder(
                                  itemCount: homeController.commentsList.length,
                                  itemBuilder: (context, index) {
                                    return commentsListView(
                                        context,
                                        maxWidth,
                                        homeController.commentsList.value,
                                        homeController.commentsList
                                            .value[index], () async {
                                      await socketService.likeComments(
                                          homeController
                                              .commentsList.value[index].id,
                                          authController.userId.value,
                                          1);
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
                    color: const Color(0xFF23293b),
                    borderRadius:
                        BorderRadius.all(Radius.circular(widthSize(20)))),
                padding: EdgeInsets.symmetric(
                    vertical: heightSize(5), horizontal: widthSize(10)),
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: widget.userImage,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      imageBuilder: (context, imageprovider) {
                        return Container(
                          height: heightSize(30),
                          width: widthSize(35),
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(widthSize(2)),
                            child: Image(
                              image: imageprovider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(width: widthSize(5)),
                    Expanded(
                      child: TextField(
                        focusNode: _focusNode,
                        textAlign: TextAlign.left, // Keep text on the left
                        textAlignVertical: TextAlignVertical.center, //
                        style: TextStyle(
                            fontFamily: UsedFonts.poppins,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFB4B4B4),
                            fontSize: fontSize(14)),
                        maxLines: 5,
                        controller: homeController.commentsText,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: "Reply to @${widget.postUsername}",
                          hintStyle: const TextStyle(color: Color(0xFF918F99)),
                          filled: true,
                          fillColor: Color(0xFF23293b),
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFF23293b),
                              ),
                              borderRadius: BorderRadius.circular(16)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFF23293b),
                              ),
                              borderRadius: BorderRadius.circular(16)),
                          contentPadding: EdgeInsets.only(
                              left: widthSize(15),
                              top: heightSize(20),
                              right: widthSize(10),
                              bottom: heightSize(5)),
                        ),
                      ),
                    ),
                    SizedBox(width: widthSize(10)),
                    Icon(
                      Icons.add_circle_outline,
                      size: widthSize(20),
                      color: textColor,
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
                            "content": homeController.commentsText.text.trim(),
                            "parentComment": homeController.isReply.value
                                ? homeController.parentCommentId.value
                                : null,
                          };
                          await socketService.addComment(data);
                          await socketService.getCommentByPostId(
                              widget.postId, 1);

                          homeController.commentsText.text = "";
                        }
                      },
                      child: homeController.isCommenting.value == true
                          ? Container(
                              height: heightSize(20),
                              width: widthSize(20),
                              padding: EdgeInsets.symmetric(
                                  horizontal: widthSize(8),
                                  vertical: heightSize(8)),
                              alignment: Alignment.center,
                              decoration: const ShapeDecoration(
                                  shape: OvalBorder(), color: mainColor),
                              child: const CircularProgressIndicator(
                                color: textColor,
                              ))
                          : SvgPicture.asset(
                              "assets/images/Vector.svg",
                              height: heightSize(20),
                              width: widthSize(20),
                              fit: BoxFit.cover,
                            ),
                    ),
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
