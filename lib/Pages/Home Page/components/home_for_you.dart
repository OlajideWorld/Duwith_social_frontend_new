// ignore_for_file: file_names, invalid_use_of_protected_member, library_private_types_in_public_api

import 'dart:io';

import 'package:better_player_plus/better_player_plus.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:chewie/chewie.dart';
import 'package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart';
import 'package:duwith_social/Pages/Auth%20Page/services/socket_sevice.dart';
import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:duwith_social/Pages/Home%20Page/screens/comments_display.dart';
import 'package:duwith_social/Pages/View%20Profile%20Page/screens/view_profile_screen.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/common/stream_video.dart';
import 'package:duwith_social/models/post-data.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

HomeController homeController = HomeController.instance;
SocketService socket = SocketService.instance;
AuthController authController = AuthController.instance;

forYouList(BuildContext context, double width) {
  return homeController.postList.value.isEmpty ||
          homeController.postList.value == null
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
              itemCount: homeController.postList.value.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: heightSize(10)),
                  child: Column(
                    children: [
                      PostWidget(
                        postsData: homeController.postList.value[index],
                        width: width,
                      ),
                    ],
                  ),
                );
              }),
        );
}

class PostWidget extends StatefulWidget {
  final PostForYou postsData;
  final double width;
  const PostWidget({
    Key? key,
    required this.postsData,
    required this.width,
  }) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  RxBool isExpanded = false.obs;
  RxString thumbnailPath = "".obs;

  // late BetterPlayerController betterPlayerController;
  // late BetterPlayerDataSource betterPlayerDataSource;

  // @override
  // void initState() {
  //   BetterPlayerConfiguration betterPlayerConfiguration =
  //       const BetterPlayerConfiguration(
  //     aspectRatio: 16 / 9,
  //     fit: BoxFit.contain,
  //   );
  //   betterPlayerDataSource = BetterPlayerDataSource(
  //     BetterPlayerDataSourceType.network,
  //     widget.postsData.media.single.url,
  //     cacheConfiguration: const BetterPlayerCacheConfiguration(
  //       useCache: true,
  //       preCacheSize: 10 * 1024 * 1024,
  //       maxCacheSize: 10 * 1024 * 1024,
  //       maxCacheFileSize: 10 * 1024 * 1024,

  //       ///Android only option to use cached video between app sessions
  //       key: "testCacheKey",
  //     ),
  //   );
  //   betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
  //   super.initState();
  // }

  // Static Map to cache thumbnails
  static Map<String, String> thumbnailCache = {};

  @override
  void initState() {
    super.initState();
    if (widget.postsData.media.single.type == "video") {
      loadThumbnail();
    }
  }

  // Future<void> generateThumbnail() async {
  //   final directory = await getTemporaryDirectory();
  //   final path = await VideoThumbnail.thumbnailFile(
  //     video: widget.postsData.media.single.url,
  //     thumbnailPath: directory.path,
  //     imageFormat: ImageFormat.JPEG,
  //     quality: 75,
  //   );

  //   thumbnailPath.value = path!;
  // }

  Future<void> loadThumbnail() async {
    // Check if the thumbnail is already in the cache
    if (thumbnailCache.containsKey(widget.postsData.media.single.url)) {
      setState(() {
        thumbnailPath.value =
            thumbnailCache[widget.postsData.media.single.url]!;
      });
    } else {
      final directory = await getTemporaryDirectory();
      final path = await VideoThumbnail.thumbnailFile(
        video: widget.postsData.media.single.url,
        thumbnailPath: directory.path,
        imageFormat: ImageFormat.PNG,
        quality: 75,
      );
      // Store the generated thumbnail in the cache
      if (path != null) {
        thumbnailCache[widget.postsData.media.single.url] = path;
        setState(() {
          thumbnailPath.value = path;
        });
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool userLiked = widget.postsData.likes.any(
        (interaction) => interaction.user == authController.userdata.value.id);
    bool userDisliked = widget.postsData.dislikes.any(
        (interaction) => interaction.user == authController.userdata.value.id);
    return Obx(() {
      return Container(
        height: widget.postsData.media.single.type == "image" ||
                widget.postsData.media.single.type == "video"
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
                widget.postsData.user.id,
                widget.width,
                widget.postsData.user.username,
                widget.postsData.user.profileImage,
                context,
                true),
            SizedBox(height: heightSize(8)),
            PostContent(
                isExpanded: isExpanded,
                text: widget.postsData.caption,
                size: 10,
                color: const Color(0xFFD7D7D7),
                fontFamily: UsedFonts.poppins,
                fontWeight: FontWeight.w400),
            SizedBox(height: heightSize(8)),
            widget.postsData.media.single.type == "image" ||
                    widget.postsData.media.single.type == "video"
                ? widget.postsData.media.single.type == "image"
                    ? CachedNetworkImage(
                        imageUrl: widget.postsData.media.single.url,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        imageBuilder: (context, imageprovider) {
                          return Container(
                            height: heightSize(400),
                            width: widget.width,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                    image: imageprovider, fit: BoxFit.fill)),
                          );
                        },
                      )
                    : GestureDetector(
                        onTap: () {
                          Get.to(() => VideoStreamPage(
                                url: widget.postsData.media.single.url,
                              ));
                        },
                        child: SizedBox(
                          height: heightSize(400),
                          child: Stack(children: [
                            // vIDEO iNSTANCE

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
                            if (thumbnailPath.value != "")
                              Container(
                                height: heightSize(400),
                                width: widget.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(widthSize(20))),
                                    image: DecorationImage(
                                        image: FileImage(
                                            File(thumbnailPath.value)),
                                        fit: BoxFit.cover)),
                              )
                            else
                              const Center(child: CircularProgressIndicator()),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: widthSize(170),
                                  vertical: heightSize(170)),
                              child: SizedBox(
                                  height: heightSize(52),
                                  width: widthSize(52),
                                  child: Image.asset(
                                    "assets/images/playsymbols.png",
                                    fit: BoxFit.contain,
                                  )),
                            )
                          ]),
                        ),
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
                            onTap: () async {
                              await socket.likePost(widget.postsData.id,
                                  authController.userdata.value.id, 1);
                            },
                            child: SizedBox(
                              height: heightSize(18),
                              child: Row(
                                children: [
                                  Icon(
                                    userLiked == true
                                        ? CupertinoIcons.heart_fill
                                        : FontAwesomeIcons.heart,
                                    size: heightSize(20),
                                    color: userLiked ? mainColor : textColor,
                                  ),
                                  SizedBox(width: widthSize(5)),
                                  CText(
                                      text: homeController.engagementShortened(
                                          widget.postsData.likes.length))
                                ],
                              ),
                            ),
                          ),
                          // dislikes
                          GestureDetector(
                            onTap: () async {
                              await socket.dislikePost(widget.postsData.id,
                                  authController.userdata.value.id, 1);
                            },
                            child: SizedBox(
                              height: heightSize(18),
                              child: Row(
                                children: [
                                  Icon(
                                    userDisliked == true
                                        ? Icons.thumb_down_rounded
                                        : FontAwesomeIcons.thumbsDown,
                                    size: heightSize(20),
                                    color: userDisliked == true
                                        ? Colors.red
                                        : textColor,
                                  ),
                                  SizedBox(width: widthSize(5)),
                                  CText(
                                      text: homeController.engagementShortened(
                                          widget.postsData.dislikes.length))
                                ],
                              ),
                            ),
                          ),
                          // comment
                          GestureDetector(
                            onTap: () async {
                              homeController.loadingComment.value = true;
                              // debugPrint(widget.postsData.id);
                              showComments(
                                  context: context,
                                  postId: widget.postsData.id);
                              await socket.getCommentByPostId(
                                  widget.postsData.id, 1);
                            },
                            child: SizedBox(
                              height: heightSize(18),
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.comment,
                                    size: heightSize(20),
                                    color: textColor,
                                  ),
                                  SizedBox(width: widthSize(5)),
                                  CText(
                                      text: homeController.engagementShortened(
                                          widget.postsData.comments))
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
}

postBarTitle(String userId, double width, String name, String image,
    BuildContext context, bool showwidget) {
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
                onTap: () async {
                  homeController.loadingProfile.value = true;
                  await socket.getUserWithId(userId);
                  await socket.getUserPosts(userId);
                  await Future.delayed(const Duration(seconds: 2), () {});
                  homeController.loadingProfile.value = false;
                  Get.to(() => ViewProfileScreen());
                },
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
