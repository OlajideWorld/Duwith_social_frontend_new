// ignore_for_file: invalid_use_of_protected_member

import 'package:cached_network_image/cached_network_image.dart';
import 'package:duwith_social/models/post-data.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

import '../../../common/button-widget.dart';
import '../../../common/custom-text.dart';
import '../../../common/stream_video.dart';
import '../../../utils/sizes.dart';
import '../../View Profile Page/screens/view_profile_screen.dart';
import '../controllers/home_controller.dart';

HomeController homeController = HomeController.instance;

videosHome(BuildContext context, double width) {
  return Expanded(
    child: ListView.builder(
        itemCount: homeController.postListVideo.value.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: heightSize(10)),
            child: Column(
              children: [
                homeController.postListVideo.value != []
                    ? VideosPostWidget(
                        width: width,
                        name: homeController
                            .postListVideo.value[index].user.username,
                        image: homeController
                            .postListVideo.value[index].user.profileImage,
                        content:
                            homeController.postListVideo.value[index].caption,
                        likes: homeController.postListVideo.value[index].likes,
                        dislike:
                            homeController.postListVideo.value[index].dislikes,
                        comment: homeController
                            .postListVideo.value[index].commentsCount,
                        media: homeController.postListVideo.value[index].media,
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
  final String name;
  final String image;
  final List<Media> media;
  final String content;
  final int likes;
  final int dislike;
  final int comment;

  const VideosPostWidget({
    Key? key,
    required this.width,
    required this.name,
    required this.media,
    required this.image,
    required this.content,
    required this.likes,
    required this.dislike,
    required this.comment,
  }) : super(key: key);

  @override
  _VideosPostWidgetState createState() => _VideosPostWidgetState();
}

class _VideosPostWidgetState extends State<VideosPostWidget> {
  RxBool isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: isExpanded.value ? heightSize(440) : heightSize(360),
        width: widget.width,
        decoration: const BoxDecoration(color: Color(0xFF28282C)),
        padding: EdgeInsets.symmetric(
            horizontal: widthSize(10), vertical: heightSize(23)),
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
            FutureBuilder<VideoPlayerController>(
              future: _initializeVideoPlayer(widget.media.single.url),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final controller = snapshot.data!;
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => VideoStreamPage(
                            url: widget.media.single.url,
                          ));
                    },
                    child: AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: VideoPlayer(controller),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),

            // Container(
            //     height: heightSize(168),
            //     width: widget.width,
            //     decoration: const BoxDecoration(
            //         borderRadius: BorderRadius.all(Radius.circular(10))),
            //     child: Image.asset(
            //       "assets/images/post.png",
            //       fit: BoxFit.fill,
            //     ),
            //   )

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
                          SizedBox(
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
                          // dislikes
                          SizedBox(
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
                          // comment
                          SizedBox(
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
