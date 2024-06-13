// ignore_for_file: invalid_use_of_protected_member

import 'package:cached_network_image/cached_network_image.dart';
import 'package:duwith_social/Pages/Home%20Page/screens/comments_display_news.dart';
import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/models/news_models.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../utils/color.dart';
import '../../Auth Page/controller/auth_controller.dart';
import '../../Auth Page/services/socket_sevice.dart';
import '../controllers/home_controller.dart';

HomeController homeController = HomeController.instance;
SocketService socket = SocketService.instance;
AuthController authController = AuthController.instance;

newsList(BuildContext context, double width) {
  return homeController.newsUpdateList.value.isEmpty ||
          homeController.newsUpdateList.value == null
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
              itemCount: homeController.newsUpdateList.value.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: heightSize(10)),
                  child: Column(
                    children: [
                      NewsPostDesign(
                        width: width,
                        newsPost: homeController.newsUpdateList.value[index],
                      ),
                    ],
                  ),
                );
              }),
        );
}

class NewsPostDesign extends StatefulWidget {
  final double width;
  final NewsUpdate newsPost;

  const NewsPostDesign({
    super.key,
    required this.width,
    required this.newsPost,
  });

  @override
  State<NewsPostDesign> createState() => _NewsPostDesignState();
}

class _NewsPostDesignState extends State<NewsPostDesign> {
  RxBool isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    bool userLiked = widget.newsPost.likes.any(
        (interaction) => interaction.user == authController.userdata.value.id);
    bool userDisliked = widget.newsPost.dislikes.any(
        (interaction) => interaction.user == authController.userdata.value.id);
    return Obx(() {
      return Container(
        height: widget.newsPost.media.single.type == "image"
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
            // postBarTitle(
            //     widget.width, widget.name, widget.image, context, false),
            // SizedBox(height: heightSize(10)),
            PostContent(
                isExpanded: isExpanded,
                text: widget.newsPost.caption,
                size: 10,
                color: const Color(0xFFD7D7D7),
                fontFamily: UsedFonts.poppins,
                fontWeight: FontWeight.w400),
            SizedBox(height: heightSize(8)),
            widget.newsPost.media.single.type == "image"
                ? CachedNetworkImage(
                    imageUrl: widget.newsPost.media.single.url,
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
                : const SizedBox(),
            SizedBox(height: heightSize(12)),
            Padding(
              padding: EdgeInsets.only(left: widthSize(20)),
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
                              await socket.likeNewsPost(widget.newsPost.id,
                                  authController.userdata.value.id);
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
                                          widget.newsPost.likes.length))
                                ],
                              ),
                            ),
                          ),

                          // dislikes
                          GestureDetector(
                            onTap: () async {
                              await socket.dislikeNewsPost(widget.newsPost.id,
                                  authController.userdata.value.id);
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
                                          widget.newsPost.dislikes.length))
                                ],
                              ),
                            ),
                          ),

                          // comment
                          GestureDetector(
                            onTap: () async {
                              homeController.loadingComment.value = true;
                              showNewsComments(
                                  context: context, postId: widget.newsPost.id);

                              await socket
                                  .getCommentByNewsId(widget.newsPost.id);
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
                                          widget.newsPost.comments.length))
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
