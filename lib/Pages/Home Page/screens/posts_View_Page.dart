import "package:duwith_social/Pages/Home%20Page/screens/comments_display.dart";
import "package:duwith_social/Pages/Media%20Page/components/media_video_player2.dart";
import "package:duwith_social/utils/color.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../common/button-widget.dart";
import "../../../common/custom-text.dart";
import "../../../common/getxmessage.dart";
import "../../../models/post-data.dart";
import "../../../utils/sizes.dart";
import "../../Auth Page/controller/auth_controller.dart";
import "../../Auth Page/services/socket_sevice.dart";
import "../components/comments_replies_display.dart";
import "../components/home_for_you.dart";
import "../controllers/home_controller.dart";

class PostsViewPage extends StatefulWidget {
  final PostForYou postsData;
  const PostsViewPage({super.key, required this.postsData});

  @override
  State<PostsViewPage> createState() => _PostsViewPageState();
}

class _PostsViewPageState extends State<PostsViewPage> {
  SocketService socket = SocketService.instance;
  AuthController authController = AuthController.instance;
  HomeController homeController = HomeController.instance;

  @override
  void initState() {
    super.initState();
    getComments();
  }

  getComments() async {
    homeController.loadingComment.value = true;
    await socket.getCommentByPostId(widget.postsData.id, 1);
  }

  @override
  Widget build(BuildContext context) {
    bool userLiked = widget.postsData.likes.any(
        (interaction) => interaction.user == authController.userdata.value.id);
    bool userDisliked = widget.postsData.dislikes.any(
        (interaction) => interaction.user == authController.userdata.value.id);
    return Scaffold(
        backgroundColor: backgroundColor,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Obx(() {
              return homeController.loadingComment.value == true
                  ? Container(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      color: mainColor,
                      child: const Center(
                        child: CircularProgressIndicator(color: textColor),
                      ),
                    )
                  : SizedBox(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: SafeArea(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: heightSize(20),
                              left: widthSize(10),
                              right: widthSize(10)),
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: backbutton(onTap: () => Get.back()),
                                  ),
                                  SizedBox(height: heightSize(30)),
                                  postBarTitle(
                                      widget.postsData.user.id,
                                      constraints.maxWidth,
                                      widget.postsData.user.username,
                                      widget.postsData.user.profileImage,
                                      context,
                                      true),
                                  SizedBox(height: heightSize(10)),
                                  widget.postsData.media.single.type ==
                                              "image" ||
                                          widget.postsData.media.single.type ==
                                              "video"
                                      ? MediaVideoPlayerWidget2(
                                          post: widget.postsData,
                                          isActive: false,
                                          width: constraints.maxWidth,
                                        )
                                      : const SizedBox(),
                                  SizedBox(height: heightSize(20)),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      widget.postsData.caption,
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.poppins(
                                        color: textColor3,
                                        fontSize: fontSize(15),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: heightSize(20)),
                                  SizedBox(
                                    height: heightSize(40),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: heightSize(30),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              // Likes
                                              GestureDetector(
                                                onTap: () async {
                                                  await socket.likePost(
                                                      widget.postsData.id,
                                                      authController
                                                          .userdata.value.id,
                                                      1);
                                                },
                                                child: SizedBox(
                                                  height: heightSize(30),
                                                  width: widthSize(62),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        userLiked == true
                                                            ? CupertinoIcons
                                                                .heart_fill
                                                            : FontAwesomeIcons
                                                                .heart,
                                                        size: heightSize(25),
                                                        color: userLiked
                                                            ? mainColor
                                                            : textColor,
                                                      ),
                                                      SizedBox(
                                                          width: widthSize(2)),
                                                      CText(
                                                        text: homeController
                                                            .engagementShortened(
                                                                widget
                                                                    .postsData
                                                                    .likes
                                                                    .length),
                                                        size: 20,
                                                        color:
                                                            Color(0xFF8A8A8A),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              GestureDetector(
                                                // onTap: () async {
                                                //   homeController.loadingComment
                                                //       .value = true;
                                                //   // debugPrint(widget.postsData.id);
                                                //   showComments(
                                                //       context: context,
                                                //       postId:
                                                //           widget.postsData.id);
                                                //   await socket.getCommentByPostId(
                                                //       widget.postsData.id, 1);
                                                // },
                                                child: SizedBox(
                                                  height: heightSize(30),
                                                  width: widthSize(62),
                                                  child: Row(
                                                    children: [
                                                      // Icon(
                                                      //   FontAwesomeIcons.comment,
                                                      //   size: heightSize(25),
                                                      //   color: textColor,
                                                      // ),
                                                      SizedBox(
                                                        height: heightSize(25),
                                                        width: widthSize(25),
                                                        child: Image.asset(
                                                          'assets/images/Home/chatIcon.png',
                                                          fit: BoxFit.contain,
                                                          // color: homeController.viewBarOption.value == 1
                                                          //     ? const Color(0xFFECECEC)
                                                          //     : textColor3,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: widthSize(2)),
                                                      CText(
                                                        text: homeController
                                                            .engagementShortened(
                                                                widget.postsData
                                                                    .comments),
                                                        size: 20,
                                                        color:
                                                            Color(0xFF8A8A8A),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              // Share
                                              SizedBox(
                                                height: heightSize(25),
                                                width: widthSize(62),
                                                child: Row(
                                                  children: [
                                                    // Icon(
                                                    //   FontAwesomeIcons.share,
                                                    //   size: heightSize(25),
                                                    //   color: textColor,
                                                    // ),
                                                    SizedBox(
                                                      height: heightSize(25),
                                                      width: widthSize(25),
                                                      child: Image.asset(
                                                        'assets/images/Home/shareIcon.png',
                                                        fit: BoxFit.contain,
                                                        // color: homeController.viewBarOption.value == 1
                                                        //     ? const Color(0xFFECECEC)
                                                        //     : textColor3,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width: widthSize(2)),
                                                    CText(
                                                      text: homeController
                                                          .engagementShortened(
                                                              widget.postsData
                                                                  .comments),
                                                      size: 20,
                                                      color: Color(0xFF8A8A8A),
                                                    )
                                                  ],
                                                ),
                                              ),

                                              // send
                                              SizedBox(
                                                height: heightSize(30),
                                                width: widthSize(62),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      height: heightSize(25),
                                                      width: widthSize(25),
                                                      child: Image.asset(
                                                        'assets/images/Home/sendIcon.png',
                                                        fit: BoxFit.contain,
                                                        // color: homeController.viewBarOption.value == 1
                                                        //     ? const Color(0xFFECECEC)
                                                        //     : textColor3,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width: widthSize(2)),
                                                    CText(
                                                      text: homeController
                                                          .engagementShortened(
                                                              widget.postsData
                                                                  .comments),
                                                      size: 20,
                                                      color: Color(0xFF8A8A8A),
                                                    )
                                                  ],
                                                ),
                                              ),

                                              // details
                                              SizedBox(
                                                height: heightSize(25),
                                                width: widthSize(62),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      height: heightSize(25),
                                                      width: widthSize(25),
                                                      child: Image.asset(
                                                        'assets/images/Home/detailsIcon.png',
                                                        fit: BoxFit.contain,
                                                        // color: homeController.viewBarOption.value == 1
                                                        //     ? const Color(0xFFECECEC)
                                                        //     : textColor3,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width: widthSize(2)),
                                                    CText(
                                                      text: homeController
                                                          .engagementShortened(
                                                              widget.postsData
                                                                  .comments),
                                                      size: 20,
                                                      color: Color(0xFF8A8A8A),
                                                    )
                                                  ],
                                                ),
                                              ),

                                              // gift
                                              SizedBox(
                                                height: heightSize(30),
                                                width: widthSize(83),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      height: heightSize(25),
                                                      width: widthSize(25),
                                                      child: Image.asset(
                                                        'assets/images/Home/dotIcon.png',
                                                        fit: BoxFit.contain,
                                                        // color: homeController.viewBarOption.value == 1
                                                        //     ? const Color(0xFFECECEC)
                                                        //     : textColor3,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width: widthSize(2)),
                                                    const CText(
                                                      text: "100DOT",
                                                      size: 17,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: heightSize(30)),
                                  Container(
                                    height: heightSize(60),
                                    width: constraints.maxWidth,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF151B2E),
                                        border: Border.all(color: buttonColor2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(widthSize(20)))),
                                    padding: EdgeInsets.symmetric(
                                        vertical: heightSize(5),
                                        horizontal: widthSize(8)),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            style: TextStyle(
                                                fontFamily: UsedFonts.poppins,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFFB4B4B4),
                                                fontSize: fontSize(14)),
                                            maxLines: 5,
                                            controller:
                                                homeController.commentsText,
                                            textInputAction:
                                                TextInputAction.done,
                                            decoration: InputDecoration(
                                              hintText: "Add Comments",
                                              hintStyle: const TextStyle(
                                                  color: Color(0xFF918F99)),
                                              filled: true,
                                              fillColor: Color(0xFF151B2E),
                                              border: InputBorder.none,
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color(0xFF1F2138)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color(0xFF1F2138)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16)),
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
                                              if (homeController
                                                      .commentsText.text
                                                      .trim() ==
                                                  "") {
                                                getErrorSnackBar(
                                                    "you have to input a message to comment");
                                              } else {
                                                homeController
                                                    .isCommenting.value = true;
                                                final data = {
                                                  "post": widget.postsData.id,
                                                  "user": authController
                                                      .userdata.value.id,
                                                  "content": homeController
                                                      .commentsText.text
                                                      .trim(),
                                                  "parentComment":
                                                      homeController
                                                              .isReply.value
                                                          ? homeController
                                                              .parentCommentId
                                                              .value
                                                          : null,
                                                };
                                                await socket.addComment(data);
                                                await socket.getCommentByPostId(
                                                    widget.postsData.id, 1);
                                                homeController
                                                    .commentsText.text = "";
                                              }
                                            },
                                            child: homeController
                                                        .isCommenting.value ==
                                                    true
                                                ? Container(
                                                    height: heightSize(50),
                                                    width: widthSize(50),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                widthSize(10),
                                                            vertical:
                                                                heightSize(10)),
                                                    alignment: Alignment.center,
                                                    decoration:
                                                        const ShapeDecoration(
                                                            shape: OvalBorder(),
                                                            color: mainColor),
                                                    child:
                                                        const CircularProgressIndicator(
                                                      color: textColor,
                                                    ))
                                                : Container(
                                                    height: heightSize(50),
                                                    width: widthSize(50),
                                                    alignment: Alignment.center,
                                                    decoration:
                                                        const ShapeDecoration(
                                                            shape: OvalBorder(),
                                                            color: mainColor),
                                                    child: Icon(
                                                      Icons.send,
                                                      size: heightSize(30),
                                                      color: textColor,
                                                    ),
                                                  )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: heightSize(20)),
                                  ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount:
                                          homeController.commentsList.length,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return commentsListView(
                                            context,
                                            constraints.maxWidth,
                                            homeController.commentsList.value,
                                            homeController.commentsList
                                                .value[index], () async {
                                          await socket.likeComments(
                                              homeController
                                                  .commentsList.value[index].id,
                                              authController.userId.value,
                                              1);
                                        });
                                      }),
                                  SizedBox(height: heightSize(20)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
            });
          },
        ));
  }
}
