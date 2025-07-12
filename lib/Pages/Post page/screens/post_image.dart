// ignore_for_file: invalid_use_of_protected_member, must_be_immutable

import 'dart:io';

import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:duwith_social/Pages/Post%20page/components/post_content_widget.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/common/getxmessage.dart';
import 'package:duwith_social/common/play_video.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:video_player/video_player.dart';

import '../../../common/custom-text.dart';

class PostImageVideosScreen extends StatelessWidget {
  final List<XFile>? files;
  final String type;
  PostImageVideosScreen({super.key, required this.files, required this.type});

  HomeController homeController = HomeController.instance;
  VideoPlayerController? videoController;

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
              child: Obx(() {
                return LoadingOverlayPro(
                  isLoading: homeController.homeloading.value,
                  progressIndicator: const LoadingBouncingGrid.circle(
                    backgroundColor: mainColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: widthSize(20), vertical: heightSize(30)),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: SizedBox(
                        child: Column(
                          children: [
                            SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  backbutton(onTap: () => Get.back()),
                                  const CText(
                                    text: "Post",
                                    size: 13,
                                    color: textColor,
                                    fontFamily: UsedFonts.poppins,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  buttonsWidget(
                                      context,
                                      heightSize(30),
                                      widthSize(87),
                                      "Publish",
                                      mainColor,
                                      12, () async {
                                    if (homeController.postCaption.text
                                                .trim() ==
                                            "" ||
                                        homeController.postcategories.value ==
                                            [] ||
                                        files == []) {
                                      getSuccessSnackBarEdit("Post hint",
                                          "you need to add a caption, a category and an Image to post");
                                    } else {
                                      homeController.homeloading.value = true;
                                      if (type == "image") {
                                        var done = await homeController
                                            .uploadImages(files!);
                                        if (done) {
                                          homeController.homeloading.value =
                                              false;
                                          uploadComplete(
                                              context,
                                              constraints.maxWidth,
                                              "Upload Successful",
                                              "Click on the button below to continue exploring",
                                              true);
                                        } else {
                                          homeController.homeloading.value =
                                              false;
                                          uploadComplete(
                                              context,
                                              constraints.maxWidth,
                                              "Upload Failed",
                                              "Click on the button below to try again",
                                              false);
                                        }
                                      } else if (type == "video") {
                                        var done = await homeController
                                            .uploadVideos(files!);
                                        if (done) {
                                          homeController.homeloading.value =
                                              false;
                                          uploadComplete(
                                              context,
                                              constraints.maxWidth,
                                              "Upload Successful",
                                              "Click on the button below to continue exploring",
                                              true);
                                        } else {
                                          homeController.homeloading.value =
                                              false;
                                          uploadComplete(
                                              context,
                                              constraints.maxWidth,
                                              "Upload Failed",
                                              "Click on the button below to try again",
                                              false);
                                        }
                                      }
                                    }
                                  }, false, Colors.white),
                                ],
                              ),
                            ),
                            SizedBox(height: heightSize(34)),
                            writeOpinions(constraints.maxWidth),
                            SizedBox(height: heightSize(34)),
                            SizedBox(
                              height: heightSize(190),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: files!.length,
                                  itemBuilder: (context, index) {
                                    return type == "image"
                                        ? Padding(
                                            padding: EdgeInsets.only(
                                                left: widthSize(13)),
                                            child: Container(
                                              height: heightSize(190),
                                              width: widthSize(170),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF151B2E),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                        widthSize(10))),
                                              ),
                                              child: Image.file(
                                                File(files![index].path),
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          )
                                        : FutureBuilder<VideoPlayerController>(
                                            future: _initializeVideoPlayer(
                                                files![index]),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.done) {
                                                final controller =
                                                    snapshot.data!;
                                                return GestureDetector(
                                                  onTap: () {
                                                    Get.to(() =>
                                                        VideoPlayerPage(
                                                            videoFile:
                                                                files![index]));
                                                  },
                                                  child: AspectRatio(
                                                    aspectRatio: controller
                                                        .value.aspectRatio,
                                                    child:
                                                        VideoPlayer(controller),
                                                  ),
                                                );
                                              } else {
                                                return const Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              }
                                            },
                                          );
                                  }),
                            ),
                            SizedBox(height: heightSize(20)),
                            Padding(
                              padding: EdgeInsets.only(right: widthSize(15)),
                              child: SizedBox(
                                height: heightSize(180),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const CText(
                                      text: "Select your post category",
                                      size: 12,
                                      color: Color(0xFFA7AEB8),
                                      fontFamily: UsedFonts.poppins,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    SizedBox(
                                      height: heightSize(150),
                                      child: Wrap(
                                        spacing: widthSize(6),
                                        runSpacing: heightSize(8),
                                        children: [
                                          SelectTags(name: "Nature"),
                                          SelectTags(name: "Travels"),
                                          SelectTags(name: "Pest & Animals"),
                                          SelectTags(name: "Events"),
                                          SelectTags(name: "Events"),
                                          SelectTags(name: "Quotes"),
                                          SelectTags(name: "Books"),
                                          SelectTags(name: "Music"),
                                          SelectTags(name: "Tech"),
                                          SelectTags(name: "Gadgets"),
                                          SelectTags(name: "Fitness"),
                                          SelectTags(name: "Adventures"),
                                          SelectTags(name: "Food"),
                                          SelectTags(name: "Fashion"),
                                          SelectTags(name: "Tech"),
                                          SelectTags(name: "Lifestyles"),
                                          SelectTags(name: "Arts")
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: heightSize(16)),
                            postContentSettings(constraints.maxWidth)
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }

  Future<VideoPlayerController> _initializeVideoPlayer(XFile videoFile) async {
    final controller = VideoPlayerController.file(File(videoFile.path));
    await controller.initialize();
    return controller;
  }
}
