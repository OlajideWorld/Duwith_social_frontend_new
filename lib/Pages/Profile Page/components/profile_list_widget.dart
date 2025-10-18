// ignore_for_file: invalid_use_of_protected_member

import "dart:io";
import "package:cached_network_image/cached_network_image.dart";
import "package:duwith_social/Pages/Profile%20Page/controller/profile_controller.dart";
import "package:duwith_social/models/post-data.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:path_provider/path_provider.dart";
import "package:video_thumbnail/video_thumbnail.dart";

import "../../../common/custom-text.dart";
import "../../../common/stream_video.dart";
import "../../../utils/color.dart";
import "../../../utils/sizes.dart";
import "../../Home Page/components/home_for_you.dart";
import "../screens/my_post_List.dart";

ProfileController profileController = ProfileController.instance;

myProfileViewPosts(BuildContext context, double width, int type) {
  return profileController.userPostList.value.isEmpty ||
          profileController.userPostList.value == null
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
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of items per row
                crossAxisSpacing: heightSize(12), // Spacing between columns
                mainAxisSpacing: widthSize(9), // Spacing between rows
                childAspectRatio:
                    1.0, // Aspect ratio of each item (width / height)
              ),
              itemCount: profileController.imagesPost.length,
              itemBuilder: (context, index) {
                return MyProfileViewPostWidget(
                  postsData: profileController.imagesPost.value[index],
                  type: type,
                  width: width,
                );
              }),
        );
}

class MyProfileViewPostWidget extends StatefulWidget {
  final PostForYou postsData;
  final double width;
  final int type;
  const MyProfileViewPostWidget(
      {super.key,
      required this.postsData,
      required this.width,
      required this.type});

  @override
  State<MyProfileViewPostWidget> createState() =>
      _MyProfileViewPostWidgetState();
}

class _MyProfileViewPostWidgetState extends State<MyProfileViewPostWidget> {
  RxString thumbnailPath = "".obs;

  static Map<String, String> thumbnailCache = {};

  @override
  void initState() {
    super.initState();
    if (widget.postsData.media.single.type == "video") {
      loadThumbnail();
    }
  }

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
  Widget build(BuildContext context) {
    return Container(
      height: heightSize(112),
      decoration: BoxDecoration(
          color: const Color(0xFF383840),
          borderRadius: BorderRadius.all(Radius.circular(widthSize(10)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.postsData.media.single.type == "image" ||
                  widget.postsData.media.single.type == "video"
              ? widget.postsData.media.single.type == "image"
                  ? GestureDetector(
                      onTap: () {
                        if (widget.type == 1) {
                          return;
                        } else {
                          Get.to(() => MyProfilePostList(
                                postdata: profileController.userPostList.value,
                              ));
                        }
                      },
                      child: CachedNetworkImage(
                        imageUrl: widget.postsData.media.single.url,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        imageBuilder: (context, imageprovider) {
                          return Container(
                            height: heightSize(88),
                            width: widget.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(widthSize(10)),
                                    topRight: Radius.circular(widthSize(10))),
                                image: DecorationImage(
                                    image: imageprovider, fit: BoxFit.fill)),
                          );
                        },
                      ),
                    )
                  // : GestureDetector(
                  //     onTap: () {
                  //       if (widget.type == 1) {
                  //         Get.to(() => VideoStreamPage(
                  //               url: widget.postsData.media.single.url,
                  //             ));
                  //       } else {
                  //         Get.to(() => MyProfilePostList(
                  //               postdata: profileController.userPostList.value,
                  //             ));
                  //       }
                  //     },
                  //     child: SizedBox(
                  //       height: heightSize(88),
                  //       child: Stack(children: [
                  //         if (thumbnailPath.value != "")
                  //           Container(
                  //             height: heightSize(88),
                  //             width: widget.width,
                  //             decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.all(
                  //                     Radius.circular(widthSize(20))),
                  //                 image: DecorationImage(
                  //                     image:
                  //                         FileImage(File(thumbnailPath.value)),
                  //                     fit: BoxFit.cover)),
                  //           )
                  //         else
                  //           const Center(child: CircularProgressIndicator()),
                  //         // Padding(
                  //         //   padding: EdgeInsets.symmetric(
                  //         //       horizontal: widthSize(170),
                  //         //       vertical: heightSize(170)),
                  //         //   child: SizedBox(
                  //         //       height: heightSize(52),
                  //         //       width: widthSize(52),
                  //         //       child: Image.asset(
                  //         //         "assets/images/playsymbols.png",
                  //         //         fit: BoxFit.contain,
                  //         //       )),
                  //         // )
                  //       ]),
                  //     ),
                  //   )
                  : const SizedBox()
              : SizedBox(),
          SizedBox(height: heightSize(15)),
          SizedBox(
            height: heightSize(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.visibility_outlined,
                  size: 12,
                  color: textColor,
                ),
                SizedBox(width: widthSize(5)),
                CText(
                  text: "${widget.postsData.likes.length} Likes",
                  color: textColor,
                  size: 9,
                  fontFamily: UsedFonts.poppins,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

myProfileViewVideos(BuildContext context, double width, int type) {
  return Expanded(
    child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of items per row
          crossAxisSpacing: heightSize(11), // Spacing between columns
          mainAxisSpacing: widthSize(13), // Spacing between rows
          childAspectRatio: 1.0, // Aspect ratio of each item (width / height)
        ),
        itemCount: profileController.userVideoList.value.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: heightSize(20)),
            child: Stack(
              children: [
                MyProfileViewVideoWidget(
                  postData: profileController.userVideoList.value[index],
                  type: type,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/playsymbols.png",
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          );
        }),
  );
}

class MyProfileViewVideoWidget extends StatefulWidget {
  final PostForYou postData;
  final int type;
  const MyProfileViewVideoWidget(
      {super.key, required this.postData, required this.type});

  @override
  State<MyProfileViewVideoWidget> createState() =>
      _MyProfileViewVideoWidgetState();
}

class _MyProfileViewVideoWidgetState extends State<MyProfileViewVideoWidget> {
  RxString thumbnailPath = "".obs;

  static Map<String, String> thumbnailCache = {};

  @override
  void initState() {
    super.initState();

    loadThumbnail();
  }

  Future<void> loadThumbnail() async {
    // Check if the thumbnail is already in the cache
    if (thumbnailCache.containsKey(widget.postData.media.single.url)) {
      setState(() {
        thumbnailPath.value = thumbnailCache[widget.postData.media.single.url]!;
      });
    } else {
      final directory = await getTemporaryDirectory();
      final path = await VideoThumbnail.thumbnailFile(
        video: widget.postData.media.single.url,
        thumbnailPath: directory.path,
        imageFormat: ImageFormat.PNG,
        quality: 75,
      );
      // Store the generated thumbnail in the cache
      if (path != null) {
        thumbnailCache[widget.postData.media.single.url] = path;
        setState(() {
          thumbnailPath.value = path;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: heightSize(186),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.all(
    //       Radius.circular(widthSize(10)),
    //     ),
    //   ),
    //   child: BetterPlayer.network(
    //     widget.postData.media.single.url,
    //     betterPlayerConfiguration: const BetterPlayerConfiguration(
    //       aspectRatio: 1,
    //     ),
    //   ),
    // );
    return thumbnailPath.value != ""
        ? GestureDetector(
            onTap: () {
              if (widget.type == 1) {
                Get.to(() => VideoStreamPage(
                      url: widget.postData.media.single.url,
                    ));
              } else {
                Get.to(() => MyProfilePostList(
                      postdata: profileController.userPostList.value,
                    ));
              }
            },
            child: Container(
              height: heightSize(186),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(widthSize(20))),
                  image: DecorationImage(
                      image: FileImage(File(thumbnailPath.value)),
                      fit: BoxFit.fill)),
            ),
          )
        : const Center(child: CircularProgressIndicator());
  }
}

viewUserPostList(BuildContext context, double width) {
  return profileController.userPostList.value.isEmpty ||
          profileController.userPostList.value == null
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
              shrinkWrap: true,
              itemCount: profileController.userPostList.value.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    PostWidget(
                      postsData: profileController.userPostList.value[index],
                      width: width,
                    ),
                    SizedBox(
                      height: heightSize(10),
                    ),
                  ],
                );
              }),
        );
}
