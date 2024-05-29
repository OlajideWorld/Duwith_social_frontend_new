import 'package:duwith_social/Pages/Post%20page/screens/post_image.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../common/custom-nav-bar.dart';
import '../../../common/custom-text.dart';
import '../../../utils/sizes.dart';

class PostContentPage extends StatelessWidget {
  const PostContentPage({super.key});

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
              child: Stack(
                children: [
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: heightSize(55),
                          left: widthSize(20),
                          right: widthSize(20)),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CText(
                              text: "Post",
                              size: 13,
                              color: textColor,
                              fontFamily: UsedFonts.poppins,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: heightSize(30)),
                            Container(
                              height: heightSize(92),
                              padding: EdgeInsets.symmetric(
                                  horizontal: widthSize(14),
                                  vertical: heightSize(11)),
                              width: constraints.maxWidth,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF1A2137),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(widthSize(10))),
                                  border: Border.all(
                                      color: const Color(0xFF2A2A49))),
                              child: const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CText(
                                    text:
                                        "Share Your Thoughts Through Images, Videos, and Stories 📢🍋😊 ",
                                    textAlign: TextAlign.center,
                                    size: 14,
                                    color: textColor,
                                    fontFamily: UsedFonts.poppins,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  CText(
                                    text:
                                        "Your opinions shape our community! Whether it’s a stunning photo, a captivating video, or a compelling story, we want to hear from you. Express yourself, inspire others, and make your voice heard. Join the conversation and let your creativity!",
                                    size: 12,
                                    textAlign: TextAlign.center,
                                    color: Color(0xFF9291A4),
                                    fontFamily: UsedFonts.poppins,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: heightSize(20)),
                            Row(
                              children: [
                                optionsUsed(
                                    "assets/images/Post/posticon.png",
                                    const Color(0xFF9176D0),
                                    "Image opinion", () {
                                  Get.to(() => PostImageVideosScreen());
                                }),
                                SizedBox(width: widthSize(12)),
                                optionsUsed(
                                    "assets/images/Post/posticon2.png",
                                    const Color(0xFF5E5EB2),
                                    "Videos opinion", () {
                                  Get.to(() => PostImageVideosScreen());
                                })
                              ],
                            ),
                            SizedBox(height: heightSize(11)),
                            Row(
                              children: [
                                optionsUsed(
                                    "assets/images/Post/posticon3.png",
                                    const Color(0xFFD444E4),
                                    "Texts opinion",
                                    () {}),
                                SizedBox(width: widthSize(12)),
                                optionsUsed(
                                    "assets/images/Post/posticon4.png",
                                    const Color(0xFF8D59CE),
                                    "Article opinion",
                                    () {})
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomNavBarWidget(),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  optionsUsed(
      String image, Color background, String textused, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: heightSize(135),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              vertical: heightSize(33), horizontal: widthSize(28)),
          decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.all(Radius.circular(widthSize(10)))),
          child: SizedBox(
            height: heightSize(68),
            width: widthSize(109),
            child: Column(
              children: [
                SizedBox(
                    height: heightSize(50),
                    width: widthSize(50),
                    child: Image.asset(image)),
                CText(
                  text: textused,
                  size: 14,
                  color: textColor,
                  fontFamily: UsedFonts.poppins,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
