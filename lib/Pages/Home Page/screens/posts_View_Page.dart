import "dart:io";

import "package:cached_network_image/cached_network_image.dart";
import "package:duwith_social/Pages/Home%20Page/screens/comments_display.dart";
import "package:duwith_social/Pages/Media%20Page/components/media_video_player2.dart";
import "package:duwith_social/utils/color.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";
import "package:google_mobile_ads/google_mobile_ads.dart";

import "../../../common/button-widget.dart";
import "../../../common/custom-text.dart";
import "../../../common/getxmessage.dart";
import "../../../common/stream_video.dart";
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

  RxBool isExpanded = false.obs;
  RxString thumbnailPath = "".obs;

  bool _isTextFieldFocused = false;

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
                                      widget.postsData,
                                      context,
                                      true),
                                  SizedBox(height: heightSize(10)),
                                  widget.postsData.media.single.type == "text"
                                      ? Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: widthSize(10)),
                                          child: UserTextItem(
                                            text: widget.postsData.caption,
                                            isExpanded: isExpanded,
                                            width: constraints.maxWidth,
                                          ),
                                        )
                                      : SizedBox(),

                                  // Post media section
                                  widget.postsData.media.single.type ==
                                              "image" ||
                                          widget.postsData.media.single.type ==
                                              "video"
                                      ? widget.postsData.media.single.type ==
                                              "image"
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          widthSize(10)),
                                                  child: PostContent(
                                                      isExpanded: isExpanded,
                                                      text: widget
                                                          .postsData.caption,
                                                      size: 14,
                                                      color: textColor,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(height: heightSize(8)),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          widthSize(10)),
                                                  child: CachedNetworkImage(
                                                    imageUrl: widget.postsData
                                                        .media.single.url,
                                                    placeholder: (context,
                                                            url) =>
                                                        const CircularProgressIndicator(),
                                                    imageBuilder: (context,
                                                        imageprovider) {
                                                      return Container(
                                                        height: heightSize(400),
                                                        width: constraints
                                                            .maxWidth,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            image: DecorationImage(
                                                                image:
                                                                    imageprovider,
                                                                fit: BoxFit
                                                                    .fill)),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            )
                                          : GestureDetector(
                                              onTap: () {
                                                Get.to(() => VideoStreamPage(
                                                      url: widget.postsData
                                                          .media.single.url,
                                                    ));
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: widthSize(10)),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    PostContent(
                                                        isExpanded: isExpanded,
                                                        text: widget
                                                            .postsData.caption,
                                                        size: 14,
                                                        color: const Color(
                                                            0xFFD7D7D7),
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    SizedBox(
                                                        height: heightSize(8)),
                                                    Stack(children: [
                                                      // vIDEO iNSTANCE
                                                      // where is that noted

                                                      // Container(
                                                      //   height: heightSize(400),
                                                      //   decoration: BoxDecoration(
                                                      //       borderRadius: BorderRadius.all(
                                                      //           Radius.circular(widthSize(20)))),
                                                      //   child: BetterPlayer.network(
                                                      //     widget.postsData.media.single.url,
                                                      //     betterPlayerConfiguration:
                                                      //         const BetterPlayerConfiguration(
                                                      //       aspectRatio: 1,
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                      if (thumbnailPath.value !=
                                                          "")
                                                        Container(
                                                          height:
                                                              heightSize(400),
                                                          width: constraints
                                                              .maxWidth,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.all(
                                                                  Radius.circular(
                                                                      widthSize(
                                                                          20))),
                                                              image: DecorationImage(
                                                                  image: FileImage(File(
                                                                      thumbnailPath
                                                                          .value)),
                                                                  fit: BoxFit
                                                                      .cover)),
                                                        )
                                                      else
                                                        const Center(
                                                            child:
                                                                CircularProgressIndicator()),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    widthSize(
                                                                        170),
                                                                vertical:
                                                                    heightSize(
                                                                        170)),
                                                        child: SizedBox(
                                                            height:
                                                                heightSize(52),
                                                            width:
                                                                widthSize(52),
                                                            child: Image.asset(
                                                              "assets/images/playsymbols.png",
                                                              fit: BoxFit
                                                                  .contain,
                                                            )),
                                                      )
                                                    ]),
                                                  ],
                                                ),
                                              ),
                                            )
                                      : const SizedBox(),

                                  SizedBox(height: heightSize(20)),

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: widthSize(10)),
                                    child: SizedBox(
                                      height: heightSize(60),
                                      width: constraints.maxWidth,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "What's your Opinions?",
                                            style: GoogleFonts.plusJakartaSans(
                                              color: textColor,
                                              fontSize: fontSize(14),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                height: heightSize(30),
                                                width: widthSize(150),
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      height: heightSize(40),
                                                      width: widthSize(150),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: textColor),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    widthSize(
                                                                        20)),
                                                      ),
                                                      child:
                                                          LinearProgressIndicator(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        value: 0.3,
                                                        valueColor:
                                                            const AlwaysStoppedAnimation(
                                                                mainColor),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    widthSize(
                                                                        20)),
                                                        minHeight:
                                                            heightSize(40),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  widthSize(5)),
                                                      child: SizedBox(
                                                          height:
                                                              heightSize(30),
                                                          width: widthSize(150),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Amazing',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  color:
                                                                      textColor,
                                                                  fontSize:
                                                                      fontSize(
                                                                          12),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                              Text(
                                                                '30%',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  color:
                                                                      textColor,
                                                                  fontSize:
                                                                      fontSize(
                                                                          12),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                            ],
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: heightSize(30),
                                                width: widthSize(150),
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      height: heightSize(40),
                                                      width: widthSize(150),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: textColor),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    widthSize(
                                                                        20)),
                                                      ),
                                                      child:
                                                          LinearProgressIndicator(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        value: 0.5,
                                                        valueColor:
                                                            const AlwaysStoppedAnimation(
                                                                mainColor),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    widthSize(
                                                                        20)),
                                                        minHeight:
                                                            heightSize(40),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  widthSize(5)),
                                                      child: SizedBox(
                                                          height:
                                                              heightSize(30),
                                                          width: widthSize(150),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                '50%',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  color:
                                                                      textColor,
                                                                  fontSize:
                                                                      fontSize(
                                                                          12),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Good',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  color:
                                                                      textColor,
                                                                  fontSize:
                                                                      fontSize(
                                                                          12),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                            ],
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
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
                                                        size: heightSize(20),
                                                        color: userLiked
                                                            ? mainColor
                                                            : textColor,
                                                      ),
                                                      SizedBox(
                                                          width: widthSize(5)),
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
                                                        height: heightSize(20),
                                                        width: widthSize(20),
                                                        child: Image.asset(
                                                          'assets/images/Home/chatIcon.png',
                                                          fit: BoxFit.contain,
                                                          // color: homeController.viewBarOption.value == 1
                                                          //     ? const Color(0xFFECECEC)
                                                          //     : textColor3,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: widthSize(5)),
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
                                                      height: heightSize(20),
                                                      width: widthSize(20),
                                                      child: Image.asset(
                                                        'assets/images/Home/shareIcon.png',
                                                        fit: BoxFit.contain,
                                                        // color: homeController.viewBarOption.value == 1
                                                        //     ? const Color(0xFFECECEC)
                                                        //     : textColor3,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width: widthSize(5)),
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
                                                      height: heightSize(20),
                                                      width: widthSize(20),
                                                      child: Image.asset(
                                                        'assets/images/Home/sendIcon.png',
                                                        fit: BoxFit.contain,
                                                        // color: homeController.viewBarOption.value == 1
                                                        //     ? const Color(0xFFECECEC)
                                                        //     : textColor3,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width: widthSize(5)),
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
                                                      height: heightSize(20),
                                                      width: widthSize(20),
                                                      child: Image.asset(
                                                        'assets/images/Home/detailsIcon.png',
                                                        fit: BoxFit.contain,
                                                        // color: homeController.viewBarOption.value == 1
                                                        //     ? const Color(0xFFECECEC)
                                                        //     : textColor3,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width: widthSize(5)),
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
                                                      height: heightSize(20),
                                                      width: widthSize(20),
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
                                  SizedBox(height: heightSize(15)),
                                  Divider(
                                      height: heightSize(3),
                                      thickness: 2,
                                      color: faintColor),
                                  SizedBox(height: heightSize(15)),
                                  homeController.bannerAd != null
                                      ? Container(
                                          height: heightSize(70),
                                          width: constraints.maxWidth,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      widthSize(10))),
                                          child: AdWidget(
                                              ad: homeController.bannerAd!))
                                      : const SizedBox(),

                                  SizedBox(height: heightSize(20)),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: widthSize(30),
                                        right: widthSize(10)),
                                    child: SizedBox(
                                      width: constraints.maxWidth,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Replies (${homeController.engagementShortened(widget.postsData.comments)})",
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
                                                  style: GoogleFonts
                                                      .plusJakartaSans(
                                                    color: mainColor,
                                                    fontSize: fontSize(13),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(width: widthSize(10)),
                                                Text(
                                                  "Latest",
                                                  style: GoogleFonts
                                                      .plusJakartaSans(
                                                    color:
                                                        const Color(0xFF858585),
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
                                  SizedBox(height: heightSize(20)),
                                  AnimatedPositioned(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                    bottom: _isTextFieldFocused
                                        ? MediaQuery.of(context)
                                            .viewInsets
                                            .bottom
                                        : 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      height: heightSize(60),
                                      width: constraints.maxWidth,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF23293b),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(widthSize(20)))),
                                      padding: EdgeInsets.symmetric(
                                          vertical: heightSize(5),
                                          horizontal: widthSize(10)),
                                      child: Row(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: widget
                                                .postsData.user.profileImage,
                                            placeholder: (context, url) =>
                                                const CircularProgressIndicator(),
                                            imageBuilder:
                                                (context, imageprovider) {
                                              return Container(
                                                height: heightSize(30),
                                                width: widthSize(35),
                                                decoration: const BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                      widthSize(2)),
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
                                              textAlign: TextAlign
                                                  .left, // Keep text on the left
                                              textAlignVertical:
                                                  TextAlignVertical.center, //
                                              style: TextStyle(
                                                  fontFamily: UsedFonts.poppins,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xFFB4B4B4),
                                                  fontSize: fontSize(14)),
                                              maxLines: 5,
                                              controller:
                                                  homeController.commentsText,
                                              textInputAction:
                                                  TextInputAction.done,
                                              decoration: InputDecoration(
                                                hintText:
                                                    "Reply to @${widget.postsData.user.username}",
                                                hintStyle: const TextStyle(
                                                    color: Color(0xFF918F99)),
                                                filled: true,
                                                fillColor: Color(0xFF23293b),
                                                border: InputBorder.none,
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Color(
                                                                    0xFF23293b)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16)),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Color(
                                                                    0xFF23293b)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16)),
                                                contentPadding: EdgeInsets.only(
                                                    left: widthSize(15),
                                                    top: heightSize(20),
                                                    right: widthSize(4),
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
                                                    height: heightSize(30),
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
