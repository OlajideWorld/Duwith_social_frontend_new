// ignore_for_file: file_names, invalid_use_of_protected_member, library_private_types_in_public_api

import 'package:cached_network_image/cached_network_image.dart';
import 'package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart';
import 'package:duwith_social/Pages/Auth%20Page/services/socket_sevice.dart';
import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:duwith_social/Pages/Home%20Page/screens/comments_display.dart';
import 'package:duwith_social/Pages/View%20Profile%20Page/screens/view_profile_screen.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/common/stream_video.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

HomeController homeController = HomeController.instance;
SocketService socket = SocketService.instance;
AuthController authController = AuthController.instance;

forYouList(BuildContext context, double width) {
  return Expanded(
    child: ListView.builder(
        itemCount: homeController.postList.value.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: heightSize(10)),
            child: Column(
              children: [
                PostWidget(
                    postId: homeController.postList.value[index].id,
                    width: width,
                    name: homeController.postList.value[index].user.username,
                    image:
                        homeController.postList.value[index].user.profileImage,
                    content: homeController.postList.value[index].caption,
                    likes: homeController.postList.value[index].likes,
                    dislike: homeController.postList.value[index].dislikes,
                    comment: homeController.postList.value[index].commentsCount,
                    media: homeController.postList.value[index].media.first.url,
                    postType:
                        homeController.postList.value[index].media.first.type),
              ],
            ),
          );
        }),
  );
}

class PostWidget extends StatefulWidget {
  final String postId;
  final double width;
  final String name;
  final String image;
  final String media;
  final String content;
  final int likes;
  final int dislike;
  final int comment;
  final String postType;

  const PostWidget({
    Key? key,
    required this.postId,
    required this.width,
    required this.name,
    required this.media,
    required this.image,
    required this.content,
    required this.likes,
    required this.dislike,
    required this.comment,
    required this.postType,
  }) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  RxBool isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: widget.postType == "image" || widget.postType == "video"
            ? isExpanded.value
                ? heightSize(640)
                : heightSize(540)
            : isExpanded.value
                ? heightSize(260)
                : heightSize(200),
        width: widget.width,
        decoration: const BoxDecoration(color: Color(0xFF28282C)),
        padding: EdgeInsets.symmetric(
            horizontal: widthSize(10), vertical: heightSize(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            postBarTitle(
                widget.width, widget.name, widget.image, context, true),
            SizedBox(height: heightSize(8)),
            PostContent(
                isExpanded: isExpanded,
                text: widget.content,
                size: 10,
                color: const Color(0xFFD7D7D7),
                fontFamily: UsedFonts.poppins,
                fontWeight: FontWeight.w400),
            SizedBox(height: heightSize(8)),
            widget.postType == "image" || widget.postType == "video"
                ? widget.postType == "image"
                    ? CachedNetworkImage(
                        imageUrl: widget.media,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        imageBuilder: (context, imageprovider) {
                          return Container(
                            height: heightSize(400),
                            width: widget.width,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                    image: imageprovider, fit: BoxFit.fill)),
                          );
                        },
                      )
                    : FutureBuilder<VideoPlayerController>(
                        future: _initializeVideoPlayer(widget.media),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            final controller = snapshot.data!;
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => VideoStreamPage(
                                      url: widget.media,
                                    ));
                              },
                              child: AspectRatio(
                                aspectRatio: controller.value.aspectRatio,
                                child: VideoPlayer(controller),
                              ),
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      )
                : const SizedBox(),
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
                            onTap: () => socket.likePost(widget.postId,
                                authController.userdata.value.id),
                            child: SizedBox(
                              height: heightSize(18),
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.heart,
                                    size: heightSize(16),
                                    color: textColor,
                                  ),
                                  SizedBox(width: widthSize(5)),
                                  CText(
                                      text: homeController
                                          .engagementShortened(widget.likes))
                                ],
                              ),
                            ),
                          ),
                          // dislikes
                          GestureDetector(
                            onTap: () => socket.dislikePost(widget.postId,
                                authController.userdata.value.id),
                            child: SizedBox(
                              height: heightSize(18),
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.thumbsDown,
                                    size: heightSize(16),
                                    color: textColor,
                                  ),
                                  SizedBox(width: widthSize(5)),
                                  CText(
                                      text: homeController
                                          .engagementShortened(widget.dislike))
                                ],
                              ),
                            ),
                          ),
                          // comment
                          GestureDetector(
                            onTap: () =>
                                showComments(context, widget.width, 16, 9),
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
                                      text: homeController
                                          .engagementShortened(widget.comment))
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
            // Button to toggle expand
            // ElevatedButton(
            //   onPressed: () {
            //     isExpanded.value = !isExpanded.value;
            //   },
            //   child: Text(isExpanded.value ? 'Collapse' : 'Expand'),
            // ),
          ],
        ),
      );
    });
  }

  Future<VideoPlayerController> _initializeVideoPlayer(String videoFile) async {
    final controller = VideoPlayerController.networkUrl(Uri.parse(videoFile));
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
