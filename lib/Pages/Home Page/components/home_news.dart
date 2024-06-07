// ignore_for_file: invalid_use_of_protected_member

import 'package:cached_network_image/cached_network_image.dart';
import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/models/news_models.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../utils/color.dart';
import '../controllers/home_controller.dart';

HomeController homeController = HomeController.instance;

newsList(BuildContext context, double width) {
  return Expanded(
    child: ListView.builder(
        itemCount: homeController.newsUpdateList.value.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: heightSize(10)),
            child: Column(
              children: [
                NewsPostDesign(
                  width: width,
                  content: homeController.newsUpdateList.value[index].caption,
                  image: homeController.newsUpdateList.value[index].media,
                  likes:
                      homeController.newsUpdateList.value[index].likes.length,
                  dislike: homeController
                      .newsUpdateList.value[index].dislikes.length,
                  comment: homeController
                      .newsUpdateList.value[index].comments.length,
                ),
              ],
            ),
          );
        }),
  );
}

class NewsPostDesign extends StatefulWidget {
  final double width;
  final List<Media> image;
  final String content;
  final int likes;
  final int dislike;
  final int comment;

  const NewsPostDesign({
    super.key,
    required this.width,
    required this.image,
    required this.content,
    required this.likes,
    required this.dislike,
    required this.comment,
  });

  @override
  State<NewsPostDesign> createState() => _NewsPostDesignState();
}

class _NewsPostDesignState extends State<NewsPostDesign> {
  RxBool isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: widget.image[0].type == "image"
            ? isExpanded.value
                ? heightSize(440)
                : heightSize(360)
            : isExpanded.value
                ? heightSize(260)
                : heightSize(200),
        width: widget.width,
        decoration: const BoxDecoration(color: Color(0xFF28282C)),
        padding: EdgeInsets.symmetric(
            horizontal: widthSize(10), vertical: heightSize(23)),
        child: Column(
          children: [
            // postBarTitle(
            //     widget.width, widget.name, widget.image, context, false),
            // SizedBox(height: heightSize(10)),
            Padding(
              padding: EdgeInsets.only(left: widthSize(30)),
              child: PostContent(
                  isExpanded: isExpanded,
                  text: widget.content,
                  size: 10,
                  color: const Color(0xFFD7D7D7),
                  fontFamily: UsedFonts.poppins,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: heightSize(8)),
            widget.image[0].type == "image"
                ? CachedNetworkImage(
                    imageUrl: widget.image[0].url,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    imageBuilder: (context, imageprovider) {
                      return Padding(
                        padding: EdgeInsets.only(left: widthSize(30)),
                        child: Container(
                          height: heightSize(168),
                          width: widget.width,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  image: imageprovider, fit: BoxFit.fill)),
                        ),
                      );
                    },
                  )
                : const SizedBox(),
            SizedBox(height: heightSize(12)),
            Padding(
              padding: EdgeInsets.only(left: widthSize(40)),
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
          ],
        ),
      );
    });
  }
}
