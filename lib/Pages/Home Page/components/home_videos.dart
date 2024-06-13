// ignore_for_file: invalid_use_of_protected_member

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:duwith_social/models/post-data.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinput/pinput.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

import '../../../common/button-widget.dart';
import '../../../common/custom-text.dart';
import '../../../common/stream_video.dart';
import '../../../utils/sizes.dart';
import '../../Auth Page/controller/auth_controller.dart';
import '../../Auth Page/services/socket_sevice.dart';
import '../../View Profile Page/screens/view_profile_screen.dart';
import '../controllers/home_controller.dart';
import '../screens/comments_display.dart';
import '../screens/comments_display_video.dart';

HomeController homeController = HomeController.instance;
SocketService socket = SocketService.instance;
AuthController authController = AuthController.instance;

videosHome(BuildContext context, double width) {
  return homeController.postListVideo.value.isEmpty ||
          homeController.postListVideo.value == null
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
      : Expanded(
          child: ListView.builder(
              itemCount: homeController.postListVideo.value.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: heightSize(10)),
                  child: Column(
                    children: [
                      homeController.postListVideo.value.isNotEmpty
                          ? VideosPostWidget(
                              width: width,
                              postVideos:
                                  homeController.postListVideo.value[index],
                            )
                          : const Center(
                              child: CText(
                                text: "No videos found",
                                size: 12,
                                color: timeColor,
                                fontFamily: UsedFonts.poppins,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                    ],
                  ),
                );
              }),
        );
}

class VideosPostWidget extends StatefulWidget {
  final double width;
  final PostForYou postVideos;

  const VideosPostWidget({
    Key? key,
    required this.width,
    required this.postVideos,
  }) : super(key: key);

  @override
  _VideosPostWidgetState createState() => _VideosPostWidgetState();
}

class _VideosPostWidgetState extends State<VideosPostWidget> {
  RxBool isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    bool userLiked = widget.postVideos.likes.any(
        (interaction) => interaction.user == authController.userdata.value.id);
    bool userDisliked = widget.postVideos.dislikes.any(
        (interaction) => interaction.user == authController.userdata.value.id);
    return Obx(() {
      return Container(
        height: isExpanded.value ? heightSize(500) : heightSize(400),
        width: widget.width,
        decoration: const BoxDecoration(color: Color(0xFF28282C)),
        padding: EdgeInsets.symmetric(
            horizontal: widthSize(10), vertical: heightSize(23)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            postBarTitle(widget.width, widget.postVideos.user.username,
                widget.postVideos.user.profileImage, context, true),
            SizedBox(height: heightSize(8)),
            PostContent(
                isExpanded: isExpanded,
                text: widget.postVideos.caption,
                size: 10,
                color: const Color(0xFFD7D7D7),
                fontFamily: UsedFonts.poppins,
                fontWeight: FontWeight.w400),
            SizedBox(height: heightSize(8)),
            FutureBuilder<CachedVideoPlayerPlusController>(
              future:
                  _initializeVideoPlayer(widget.postVideos.media.single.url),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final controller = snapshot.data!;
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => VideoStreamPage(
                            url: widget.postVideos.media.single.url,
                          ));
                    },
                    child: Stack(children: [
                      AspectRatio(
                        aspectRatio: controller.value.aspectRatio,
                        child: CachedVideoPlayerPlus(controller),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: widthSize(170),
                            vertical: heightSize(100)),
                        child: SizedBox(
                            height: heightSize(52),
                            width: widthSize(52),
                            child: Image.asset(
                              "assets/images/playsymbols.png",
                              fit: BoxFit.contain,
                            )),
                      )
                    ]),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            SizedBox(height: heightSize(12)),
            Padding(
              padding:
                  EdgeInsets.only(left: widthSize(30), right: widthSize(40)),
              child: SizedBox(
                height: heightSize(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: heightSize(18),
                      width: widthSize(190),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Likes
                          GestureDetector(
                            onTap: () async {
                              await socket.likePost(widget.postVideos.id,
                                  authController.userdata.value.id, 2);
                            },
                            child: SizedBox(
                              height: heightSize(18),
                              child: Row(
                                children: [
                                  Icon(
                                    userLiked == true
                                        ? CupertinoIcons.heart_fill
                                        : FontAwesomeIcons.heart,
                                    size: heightSize(16),
                                    color: userLiked ? mainColor : textColor,
                                  ),
                                  SizedBox(width: widthSize(5)),
                                  CText(
                                      text: homeController.engagementShortened(
                                          widget.postVideos.likes.length))
                                ],
                              ),
                            ),
                          ),
                          // dislikes
                          GestureDetector(
                            onTap: () async {
                              await socket.dislikePost(widget.postVideos.id,
                                  authController.userdata.value.id, 2);
                            },
                            child: SizedBox(
                              height: heightSize(18),
                              child: Row(
                                children: [
                                  Icon(
                                    userDisliked == true
                                        ? Icons.thumb_down_rounded
                                        : FontAwesomeIcons.thumbsDown,
                                    size: heightSize(16),
                                    color: userDisliked == true
                                        ? Colors.red
                                        : textColor,
                                  ),
                                  SizedBox(width: widthSize(5)),
                                  CText(
                                      text: homeController.engagementShortened(
                                          widget.postVideos.dislikes.length))
                                ],
                              ),
                            ),
                          ),
                          // comment
                          GestureDetector(
                            onTap: () async {
                              homeController.loadingComment.value = true;
                              // debugPrint(widget.postsData.id);
                              showCommentsVideo(
                                  context: context,
                                  postId: widget.postVideos.id);
                              await socket.getCommentByPostId(
                                  widget.postVideos.id, 2);
                            },
                            child: SizedBox(
                              height: heightSize(18),
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.comment,
                                    size: heightSize(16),
                                    color: textColor,
                                  ),
                                  SizedBox(width: widthSize(5)),
                                  CText(
                                      text: homeController.engagementShortened(
                                          widget.postVideos.comments))
                                ],
                              ),
                            ),
                          ),
                          // Share
                          SizedBox(
                            height: heightSize(18),
                            child: Icon(
                              FontAwesomeIcons.share,
                              size: heightSize(16),
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: heightSize(20),
                      width: widthSize(20),
                      child: Image.asset("assets/images/gift.png"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Future<CachedVideoPlayerPlusController> _initializeVideoPlayer(
      String videoFile) async {
    final controller =
        CachedVideoPlayerPlusController.networkUrl(Uri.parse(videoFile));
    await controller.initialize();
    return controller;
  }
}

postBarTitle(double width, String name, String image, BuildContext context,
    bool showwidget) {
  return SizedBox(
    width: width,
    height: heightSize(38),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: heightSize(38),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Get.to(() => ViewProfileScreen(
                    name: name,
                    image: image,
                    nickname: "@${name.toLowerCase()}",
                    description: "Dance like nobody’s watching! 💃",
                    followers: homeController.engagementShortened(12537689),
                    following: homeController.engagementShortened(12334),
                    postNumber: homeController.engagementShortened(123))),
                child: CachedNetworkImage(
                  imageUrl: image,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  imageBuilder: (context, imageprovider) {
                    return Container(
                      height: heightSize(40),
                      width: widthSize(40),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                              image: imageprovider, fit: BoxFit.fill)),
                    );
                  },
                ),
              ),
              SizedBox(width: widthSize(5)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CText(
                    text: name,
                    size: 12,
                    fontFamily: UsedFonts.poppins,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                  SizedBox(height: heightSize(3)),
                  const CText(
                    text: "4 hours ago",
                    size: 12,
                    color: timeColor,
                    fontFamily: UsedFonts.poppins,
                    fontWeight: FontWeight.w500,
                  )
                ],
              )
            ],
          ),
        ),
        showwidget
            ? SizedBox(
                height: heightSize(25),
                width: widthSize(80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttonsWidget(context, heightSize(25), widthSize(52),
                        "Follow", mainColor, 8, () {}, false, Colors.white),
                    Icon(
                      Icons.more_vert,
                      size: heightSize(16),
                      color: textColor,
                    )
                  ],
                ),
              )
            : const SizedBox()
      ],
    ),
  );
}


  // final String postId;
  // final double width;
  // final String name;
  // final String image;
  // final String media;
  // final String content;
  // final int likes;
  // final int dislike;
  // final int comment;
  // final String postType;