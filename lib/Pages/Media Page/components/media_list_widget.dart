import 'package:cached_network_image/cached_network_image.dart';
import 'package:duwith_social/Pages/Media%20Page/components/media_video_player.dart';
import 'package:duwith_social/Pages/Media%20Page/components/media_video_player2.dart';
import 'package:duwith_social/Pages/Media%20Page/components/media_video_player3.dart';
import 'package:duwith_social/Pages/Media%20Page/components/media_video_player4.dart';
import 'package:duwith_social/Pages/Media%20Page/components/media_video_player5.dart';
import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/models/post-data.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color.dart';
import '../../Home Page/controllers/home_controller.dart';
import '../../View Profile Page/screens/view_profile_screen.dart';
import 'media_temp_list_design.dart';

HomeController homeController = HomeController.instance;

mediaListWidget(BuildContext context, double width) {
  return Obx(() {
    return homeController.mediapageisLoading.value == true
        ? Container(
            height: heightSize(260),
            width: width,
            decoration: const BoxDecoration(color: mainColor),
            alignment: Alignment.center,
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
            ),
          )
        : SizedBox(
            height: heightSize(260),
            width: width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: homeController.newsUpdateList.value.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: widthSize(20)),
                    child: MediaTempMediaDesign(
                      newsPost: homeController.newsUpdateList.value[index],
                      width: widthSize(338),
                    ),
                  );
                }),
          );
  });
}

mediaPostUserDetails(String userId, double width, String name, String image,
    BuildContext context, bool showwidget) {
  return SizedBox(
    height: heightSize(38),
    width: width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          height: heightSize(25),
                          width: widthSize(25),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  image: imageprovider, fit: BoxFit.fill)),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: widthSize(10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF858585),
                          fontSize: fontSize(10),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "540,459 views ",
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF858585),
                      fontSize: fontSize(10),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "4 hours ago",
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF858585),
                      fontSize: fontSize(10),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

mediaPageListViewWidget(BuildContext context, double width) {
  return Obx(() {
    return homeController.mediapageisLoading.value == true
        ? Container(
            height: heightSize(250),
            width: width,
            decoration: const BoxDecoration(color: mainColor),
            alignment: Alignment.center,
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
            ),
          )
        : SizedBox(
            height: heightSize(270),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: homeController.newsUpdateList.value.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: widthSize(10),
                      right: widthSize(10),
                      bottom: heightSize(20)),
                  child: showMediaImages(
                    newsPost: homeController.newsUpdateList.value[index],
                    width: width,
                  ),
                );
              },
            ),
          );
  });
}

mediaPageListViewWidget2(BuildContext context, double width) {
  return Obx(() {
    return homeController.mediapageisLoading.value == true
        ? Container(
            height: heightSize(250),
            width: width,
            decoration: const BoxDecoration(color: mainColor),
            alignment: Alignment.center,
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
            ),
          )
        : SizedBox(
            height: heightSize(270),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: homeController.newsUpdateList.value.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: widthSize(10),
                      right: widthSize(10),
                      bottom: heightSize(20)),
                  child: showMediaImages(
                    newsPost: homeController.newsUpdateList.value[index],
                    width: width,
                  ),
                );
              },
            ),
          );
  });
}

mediaPageListViewWidget3(BuildContext context, double width) {
  return Obx(() {
    return homeController.mediapageisLoading.value == true
        ? Container(
            height: heightSize(270),
            width: width,
            decoration: const BoxDecoration(color: mainColor),
            alignment: Alignment.center,
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
            ),
          )
        : SizedBox(
            height: heightSize(270),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: homeController.newsUpdateList.value.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: widthSize(10),
                      right: widthSize(10),
                      bottom: heightSize(20)),
                  child: showMediaImages(
                    newsPost: homeController.newsUpdateList.value[index],
                    width: width,
                  ),
                );
              },
            ),
          );
  });
}

mediaPageListViewWidget4(BuildContext context, double width) {
  return Obx(() {
    return homeController.mediapageisLoading.value == true
        ? Container(
            height: heightSize(250),
            width: width,
            decoration: const BoxDecoration(color: mainColor),
            alignment: Alignment.center,
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
            ),
          )
        : SizedBox(
            height: heightSize(270),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: homeController.newsUpdateList.value.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: widthSize(10),
                      right: widthSize(10),
                      bottom: heightSize(20)),
                  child: showMediaImages(
                    newsPost: homeController.newsUpdateList.value[index],
                    width: width,
                  ),
                );
              },
            ),
          );
  });
}

mediaPageListViewWidget5(BuildContext context, double width) {
  return Obx(() {
    return homeController.mediapageisLoading.value == true
        ? Container(
            height: heightSize(550),
            width: width,
            decoration: const BoxDecoration(color: mainColor),
            alignment: Alignment.center,
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
            ),
          )
        : SizedBox(
            height: heightSize(550),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: homeController.postListVideo.value.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: widthSize(10),
                      right: widthSize(10),
                      bottom: heightSize(20)),
                  child: MediaVideoPlayerWidget5(
                    post: homeController.postListVideo.value[index],
                    isActive: false,
                    width: width,
                    type: 2,
                  ),
                );
              },
            ),
          );
  });
}
