// ignore_for_file: file_names, invalid_use_of_protected_member, library_private_types_in_public_api

import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:duwith_social/Pages/View%20Profile%20Page/screens/view_profile_screen.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

HomeController homeController = HomeController.instance;

forYouList(BuildContext context, double width) {
  return Expanded(
    child: ListView.builder(
        itemCount: homeController.postDatas.value.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: heightSize(10)),
            child: Column(
              children: [
                PostWidget(
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

class PostWidget extends StatefulWidget {
  final double width;
  final String name;
  final String image;
  final String content;
  final int likes;
  final int dislike;
  final int comment;
  final int postType;

  const PostWidget({
    Key? key,
    required this.width,
    required this.name,
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
            widget.postType == 1 || widget.postType == 2
                ? Container(
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
                child: CircleAvatar(
                  backgroundImage: AssetImage(image),
                  radius: widthSize(15),
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
