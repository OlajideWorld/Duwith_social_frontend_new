// ignore_for_file: invalid_use_of_protected_member
import 'package:cached_network_image/cached_network_image.dart';
import 'package:duwith_social/Pages/Home%20Page/components/home_for_you.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../common/custom-text.dart';
import '../../../utils/color.dart';
import '../../../utils/sizes.dart';
import '../controllers/home_controller.dart';

HomeController homeController = HomeController.instance;

airdropList(BuildContext context, double width) {
  return Expanded(
    child: ListView.builder(
        itemCount: homeController.postDatas.value.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: heightSize(10)),
            child: Column(
              children: [
                AirdropDesign(
                    width: width,
                    name: homeController.postDatas.value[index].name,
                    image: homeController.postDatas.value[index].image,
                    content: homeController.postDatas.value[index].content,
                    likes: homeController.postDatas.value[index].likes,
                    dislike: homeController.postDatas.value[index].dislikes,
                    comment: homeController.postDatas.value[index].comment,
                    postType: homeController.postDatas.value[index].postType),
              ],
            ),
          );
        }),
  );
}

class AirdropDesign extends StatefulWidget {
  final double width;
  final String name;
  final String image;
  final String content;
  final int likes;
  final int dislike;
  final int comment;
  final int postType;
  const AirdropDesign(
      {super.key,
      required this.width,
      required this.name,
      required this.image,
      required this.content,
      required this.likes,
      required this.dislike,
      required this.comment,
      required this.postType});

  @override
  State<AirdropDesign> createState() => _AirdropDesignState();
}

class _AirdropDesignState extends State<AirdropDesign> {
  RxBool isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: widget.postType == 1 || widget.postType == 2
            ? isExpanded.value
                ? heightSize(440)
                : heightSize(350)
            : isExpanded.value
                ? heightSize(260)
                : heightSize(200),
        width: widget.width,
        decoration: const BoxDecoration(color: Color(0xFF28282C)),
        padding: EdgeInsets.symmetric(
            horizontal: widthSize(10), vertical: heightSize(23)),
        child: Column(
          children: [
            postBarTitle(
                widget.width, widget.name, widget.image, context, false),
            SizedBox(height: heightSize(5)),
            widget.postType == 1 || widget.postType == 2
                ?
                // CachedNetworkImage(
                //     imageUrl: widget.image,
                //     placeholder: (context, url) =>
                //         const CircularProgressIndicator(),
                //     imageBuilder: (context, imageprovider) {
                //       return Container(
                //         height: heightSize(168),
                //         width: widget.width,
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.all(Radius.circular(10)),
                //             image: DecorationImage(
                //                 image: imageprovider, fit: BoxFit.fill)),
                //       );
                //     },
                //   )

                Container(
                    height: heightSize(168),
                    width: widget.width,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Image.asset(
                      "assets/images/post.png",
                      fit: BoxFit.contain,
                    ),
                  )
                : const SizedBox(),
            SizedBox(height: heightSize(13)),
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
