// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:better_player_plus/better_player_plus.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:duwith_social/Pages/Profile%20Page/components/profile_container_widget.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../common/custom-text.dart';
import '../../../common/stream_video.dart';
import '../../../models/post-data.dart';
import '../../Home Page/components/home_for_you.dart';

class MyProfilePostList extends StatelessWidget {
  final List<PostForYou> postdata;
  const MyProfilePostList({super.key, required this.postdata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      backbutton(onTap: () => Get.back()),
                      SizedBox(width: widthSize(120)),
                      const CText(
                        text: "Post",
                        color: textColor,
                        size: 15,
                        fontFamily: UsedFonts.poppins,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  postdata.isEmpty
                      ? const Align(
                          alignment: Alignment.center,
                          child: Center(
                            child: CText(
                              text: "You have not posted anything yet",
                              size: 18,
                              color: textColor,
                              fontFamily: UsedFonts.poppins,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                              itemCount: postdata.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      EdgeInsets.only(bottom: heightSize(10)),
                                  child: Column(
                                    children: [
                                      MyProfilePostScreenSection(
                                        postVideos: postdata[index],
                                        width: constraints.maxWidth,
                                      ),
                                      SizedBox(height: heightSize(5))
                                    ],
                                  ),
                                );
                              }))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyProfilePostScreenSection extends StatefulWidget {
  final double width;
  final PostForYou postVideos;

  const MyProfilePostScreenSection({
    Key? key,
    required this.width,
    required this.postVideos,
  }) : super(key: key);

  @override
  _MyProfilePostScreenSectionState createState() =>
      _MyProfilePostScreenSectionState();
}

class _MyProfilePostScreenSectionState
    extends State<MyProfilePostScreenSection> {
  RxBool isExpanded = false.obs;

  RxString thumbnailPath = "".obs;

  static Map<String, String> thumbnailCache = {};

  @override
  void initState() {
    super.initState();
    if (widget.postVideos.media.single.type == "video") {
      loadThumbnail();
    }
  }

  Future<void> loadThumbnail() async {
    // Check if the thumbnail is already in the cache
    if (thumbnailCache.containsKey(widget.postVideos.media.single.url)) {
      setState(() {
        thumbnailPath.value =
            thumbnailCache[widget.postVideos.media.single.url]!;
      });
    } else {
      final directory = await getTemporaryDirectory();
      final path = await VideoThumbnail.thumbnailFile(
        video: widget.postVideos.media.single.url,
        thumbnailPath: directory.path,
        imageFormat: ImageFormat.PNG,
        quality: 75,
      );
      // Store the generated thumbnail in the cache
      if (path != null) {
        thumbnailCache[widget.postVideos.media.single.url] = path;
        setState(() {
          thumbnailPath.value = path;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Obx(() {
            return Container(
              height: widget.postVideos.media.single.type == "image" ||
                      widget.postVideos.media.single.type == "video"
                  ? isExpanded.value
                      ? heightSize(640)
                      : heightSize(540)
                  : isExpanded.value
                      ? heightSize(260)
                      : heightSize(200),
              width: widget.width,
              decoration: const BoxDecoration(color: Color(0xFF28282C)),
              padding: EdgeInsets.symmetric(
                  horizontal: widthSize(10), vertical: heightSize(23)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  postBarTitle(
                      widget.postVideos.user.id,
                      widget.width,
                      widget.postVideos.user.username,
                      widget.postVideos.user.profileImage,
                      widget.postVideos,
                      context,
                      true),
                  SizedBox(height: heightSize(8)),
                  PostContent(
                      isExpanded: isExpanded,
                      text: widget.postVideos.caption,
                      size: 10,
                      color: const Color(0xFFD7D7D7),
                      fontWeight: FontWeight.w400),
                  SizedBox(height: heightSize(8)),
                  widget.postVideos.media.single.type == "image" ||
                          widget.postVideos.media.single.type == "video"
                      ? widget.postVideos.media.single.type == "image"
                          ? CachedNetworkImage(
                              imageUrl: widget.postVideos.media.single.url,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              imageBuilder: (context, imageprovider) {
                                return Container(
                                  height: heightSize(400),
                                  width: widget.width,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      image: DecorationImage(
                                          image: imageprovider,
                                          fit: BoxFit.fill)),
                                );
                              },
                            )
                          : GestureDetector(
                              onTap: () {
                                Get.to(() => VideoStreamPage(
                                      url: widget.postVideos.media.single.url,
                                    ));
                              },
                              child: SizedBox(
                                height: heightSize(400),
                                child: Stack(children: [
                                  // Container(
                                  //   height: heightSize(400),
                                  //   decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.all(
                                  //           Radius.circular(widthSize(20)))),
                                  //   child: BetterPlayer.network(
                                  //     widget.postVideos.media.single.url,
                                  //     betterPlayerConfiguration:
                                  //         const BetterPlayerConfiguration(
                                  //       aspectRatio: 1,
                                  //     ),
                                  //   ),
                                  // ),
                                  if (thumbnailPath.value != "")
                                    Container(
                                      height: heightSize(88),
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
                                    const Center(
                                        child: CircularProgressIndicator()),
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
                    padding: EdgeInsets.only(
                        left: widthSize(30), right: widthSize(40)),
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
                                    // await socket.likePost(widget.postVideos.id,
                                    //     authController.userdata.value.id, 2);
                                  },
                                  child: SizedBox(
                                    height: heightSize(18),
                                    child: Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.heart_fill,
                                          size: heightSize(16),
                                          color: textColor,
                                        ),
                                        SizedBox(width: widthSize(5)),
                                        CText(
                                            text: homeController
                                                .engagementShortened(widget
                                                    .postVideos.likes.length))
                                      ],
                                    ),
                                  ),
                                ),
                                // dislikes
                                GestureDetector(
                                  onTap: () async {
                                    // await socket.dislikePost(widget.postVideos.id,
                                    //     authController.userdata.value.id, 2);
                                  },
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
                                                .engagementShortened(widget
                                                    .postVideos
                                                    .dislikes
                                                    .length))
                                      ],
                                    ),
                                  ),
                                ),
                                // comment
                                GestureDetector(
                                  onTap: () async {
                                    // homeController.loadingComment.value = true;
                                    // showCommentsVideo(
                                    //     context: context,
                                    //     postId: widget.postVideos.id);
                                    // await socket.getCommentByPostId(
                                    //     widget.postVideos.id, 2);
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
                                            text: homeController
                                                .engagementShortened(
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
                            height: heightSize(40),
                            width: widthSize(40),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/points.png",
                                  fit: BoxFit.fill,
                                  height: heightSize(23),
                                  width: widthSize(23),
                                ),
                                const CText(
                                  text: "100",
                                  color: textColor3,
                                  size: 13,
                                  fontFamily: UsedFonts.poppins,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          SizedBox(height: heightSize(5)),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: heightSize(9),
              horizontal: widthSize(20),
            ),
            decoration: const BoxDecoration(color: Color(0xFF28282C)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: heightSize(30),
                  child: Row(
                    children: [
                      Icon(
                        Icons.group,
                        size: heightSize(18),
                        color: textColor,
                      ),
                      CText(
                          text: homeController
                              .engagementShortened(widget.postVideos.comments)),
                      const CText(
                        text: "engagements",
                        color: textColor3,
                        size: 12,
                        fontFamily: UsedFonts.poppins,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => promoteDialog(context, widget.width),
                  child: Container(
                    height: heightSize(30),
                    decoration: BoxDecoration(
                        color: const Color(0xFF1A2137),
                        borderRadius: BorderRadius.all(
                          Radius.circular(widthSize(10)),
                        ),
                        border: Border.all(color: const Color(0xFF515174))),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/crown.png",
                          fit: BoxFit.fill,
                          height: heightSize(16),
                          width: widthSize(16),
                        ),
                        const CText(
                          text: "Promote",
                          color: textColor3,
                          size: 12,
                          fontFamily: UsedFonts.blackhan,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
