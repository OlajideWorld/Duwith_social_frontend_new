// ignore_for_file: file_names, invalid_use_of_protected_member, library_private_types_in_public_api

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart';
import 'package:duwith_social/Pages/Auth%20Page/services/socket_sevice.dart';
import 'package:duwith_social/Pages/Home%20Page/components/comments_replies_display.dart';
import 'package:duwith_social/Pages/Home%20Page/components/time_reveal.dart';
import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:duwith_social/Pages/Home%20Page/screens/comments_display.dart';
import 'package:duwith_social/Pages/View%20Profile%20Page/screens/view_profile_screen.dart';
import 'package:duwith_social/common/button-widget.dart';

import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/common/stream_video.dart';
import 'package:duwith_social/models/post-data.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:path_provider/path_provider.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../Services/Ads Service/unity_ads_manager.dart';
import '../../Profile Page/screens/view_myprofile_screen.dart';
import '../screens/posts_View_Page.dart';

HomeController homeController = HomeController.instance;
SocketService socket = SocketService.instance;
AuthController authController = AuthController.instance;

forYouList(BuildContext context, double width) {
  return homeController.postList.value.isEmpty ||
          homeController.postList.value == null
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
              itemCount: homeController.postList.value.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    PostWidget(
                      postsData: homeController.postList.value[index],
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

class PostWidget extends StatefulWidget {
  final PostForYou postsData;
  final double width;
  const PostWidget({
    Key? key,
    required this.postsData,
    required this.width,
  }) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  RxBool isExpanded = false.obs;
  RxString thumbnailPath = "".obs;

  // late BetterPlayerController betterPlayerController;
  // late BetterPlayerDataSource betterPlayerDataSource;

  // @override
  // void initState() {
  //   BetterPlayerConfiguration betterPlayerConfiguration =
  //       const BetterPlayerConfiguration(
  //     aspectRatio: 16 / 9,
  //     fit: BoxFit.contain,
  //   );
  //   betterPlayerDataSource = BetterPlayerDataSource(
  //     BetterPlayerDataSourceType.network,
  //     widget.postsData.media.single.url,
  //     cacheConfiguration: const BetterPlayerCacheConfiguration(
  //       useCache: true,
  //       preCacheSize: 10 * 1024 * 1024,
  //       maxCacheSize: 10 * 1024 * 1024,
  //       maxCacheFileSize: 10 * 1024 * 1024,

  //       ///Android only option to use cached video between app sessions
  //       key: "testCacheKey",
  //     ),
  //   );
  //   betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
  //   super.initState();
  // }

  // Static Map to cache thumbnails
  static Map<String, String> thumbnailCache = {};
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  final fixedBanner = "ca-app-pub-3940256099942544/6300978111";

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: fixedBanner,
      listener: BannerAdListener(
        onAdLoaded: (ad) => setState(() => _isLoaded = true),
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
          // optionally retry or fallback
        },
      ),
      request: AdRequest(),
    )..load();
    if (widget.postsData.media.single.type == "video") {
      loadThumbnail();
    }
  }

  // Future<void> generateThumbnail() async {
  //   final directory = await getTemporaryDirectory();
  //   final path = await VideoThumbnail.thumbnailFile(
  //     video: widget.postsData.media.single.url,
  //     thumbnailPath: directory.path,
  //     imageFormat: ImageFormat.JPEG,
  //     quality: 75,
  //   );

  //   thumbnailPath.value = path!;
  // }

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
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool userLiked = widget.postsData.likes.any(
        (interaction) => interaction.user == authController.userdata.value.id);
    bool userDisliked = widget.postsData.dislikes.any(
        (interaction) => interaction.user == authController.userdata.value.id);
    final adSize = _bannerAd!.size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widthSize(10)),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF0e121e),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widthSize(10)),
            topRight: Radius.circular(widthSize(10)),
          ),
        ),
        padding: EdgeInsets.only(top: heightSize(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            postBarTitle(
                widget.postsData.user.id,
                widget.width,
                widget.postsData.user.username,
                widget.postsData.user.profileImage,
                widget.postsData,
                context,
                true),
            SizedBox(height: heightSize(5)),

            widget.postsData.media.single.type == "text"
                ? GestureDetector(
                    onTap: () => Get.to(
                        () => PostsViewPage(postsData: widget.postsData)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: widthSize(10)),
                      child: UserTextItem(
                        text: widget.postsData.caption,
                        isExpanded: isExpanded,
                        width: widget.width,
                      ),
                    ),
                  )
                : SizedBox(),

            // Post media section
            widget.postsData.media.single.type == "image" ||
                    widget.postsData.media.single.type == "video"
                ? widget.postsData.media.single.type == "image"
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: widthSize(10)),
                            child: GestureDetector(
                              onTap: () => Get.to(() =>
                                  PostsViewPage(postsData: widget.postsData)),
                              child: PostContent(
                                  isExpanded: isExpanded,
                                  text: widget.postsData.caption,
                                  size: 14,
                                  color: textColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: heightSize(8)),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: widthSize(10)),
                            child: Container(
                              height: heightSize(400),
                              width: widget.width,
                              decoration: BoxDecoration(
                                color: Colors
                                    .grey[200], // background while loading
                                borderRadius: BorderRadius.circular(12),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: CachedNetworkImage(
                                imageUrl: widget.postsData.media.single.url,
                                fit: BoxFit.contain,
                                placeholder: (context, url) => const Center(
                                  child:
                                      CircularProgressIndicator(strokeWidth: 2),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.broken_image),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: widthSize(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () => Get.to(() =>
                                  PostsViewPage(postsData: widget.postsData)),
                              child: PostContent(
                                  isExpanded: isExpanded,
                                  text: widget.postsData.caption,
                                  size: 14,
                                  color: const Color(0xFFD7D7D7),
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: heightSize(8)),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => VideoStreamPage(
                                      url: widget.postsData.media.single.url,
                                    ));
                              },
                              child: Stack(children: [
                                // vIDEO iNSTANCE
                                // where is that noted

                                // Container(
                                //   height: heightSize(400),
                                //   decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.all(
                                //           Radius.circular(widthSize(20)))),
                                //   child: BetterPlayer.network(
                                //     widget.postsData.media.single.url,
                                //     betterPlayerConfiguration:
                                //         const BetterPlayerConfiguration(
                                //       aspectRatio: 1,
                                //     ),
                                //   ),
                                // ),
                                if (thumbnailPath.value != "")
                                  Container(
                                    height: heightSize(400),
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
                          ],
                        ),
                      )
                : const SizedBox(),
            SizedBox(height: heightSize(10)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: widthSize(15)),
              child: Divider(
                  height: heightSize(3), thickness: 2, color: faintColor),
            ),
            SizedBox(height: heightSize(10)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: widthSize(10)),
              child: SizedBox(
                height: heightSize(60),
                width: widget.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What's your Opinions?",
                      style: GoogleFonts.plusJakartaSans(
                        color: textColor,
                        fontSize: fontSize(14),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: heightSize(30),
                          width: widthSize(150),
                          child: Stack(
                            children: [
                              Container(
                                height: heightSize(40),
                                width: widthSize(150),
                                decoration: BoxDecoration(
                                  border: Border.all(color: textColor),
                                  borderRadius:
                                      BorderRadius.circular(widthSize(20)),
                                ),
                                child: LinearProgressIndicator(
                                  backgroundColor: Colors.transparent,
                                  value: 0.3,
                                  valueColor:
                                      const AlwaysStoppedAnimation(mainColor),
                                  borderRadius:
                                      BorderRadius.circular(widthSize(20)),
                                  minHeight: heightSize(40),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: widthSize(5)),
                                child: SizedBox(
                                    height: heightSize(30),
                                    width: widthSize(150),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Amazing',
                                          style: GoogleFonts.poppins(
                                            color: textColor,
                                            fontSize: fontSize(12),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          '30%',
                                          style: GoogleFonts.poppins(
                                            color: textColor,
                                            fontSize: fontSize(12),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    )),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: heightSize(30),
                          width: widthSize(150),
                          child: Stack(
                            children: [
                              Container(
                                height: heightSize(40),
                                width: widthSize(150),
                                decoration: BoxDecoration(
                                  border: Border.all(color: textColor),
                                  borderRadius:
                                      BorderRadius.circular(widthSize(20)),
                                ),
                                child: LinearProgressIndicator(
                                  backgroundColor: Colors.transparent,
                                  value: 0.5,
                                  valueColor:
                                      const AlwaysStoppedAnimation(mainColor),
                                  borderRadius:
                                      BorderRadius.circular(widthSize(20)),
                                  minHeight: heightSize(40),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: widthSize(5)),
                                child: SizedBox(
                                    height: heightSize(30),
                                    width: widthSize(150),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '50%',
                                          style: GoogleFonts.poppins(
                                            color: textColor,
                                            fontSize: fontSize(12),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          'Good',
                                          style: GoogleFonts.poppins(
                                            color: textColor,
                                            fontSize: fontSize(12),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    )),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: heightSize(25)),
            if (_isLoaded || _bannerAd != null)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widthSize(15)),
                child: SizedBox(
                  width: adSize.width.toDouble(),
                  height: adSize.height.toDouble(),
                  child: AdWidget(ad: _bannerAd!),
                ),
              ),
            SizedBox(height: heightSize(20)),
            SizedBox(
              height: heightSize(40),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: heightSize(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: widthSize(10)),
                        // Likes
                        GestureDetector(
                          onTap: () async {
                            await socket.likePost(widget.postsData.id,
                                authController.userdata.value.id, 1);
                          },
                          child: SizedBox(
                            height: heightSize(30),
                            width: widthSize(60),
                            child: Row(
                              children: [
                                Icon(
                                  userLiked == true
                                      ? CupertinoIcons.heart_fill
                                      : FontAwesomeIcons.heart,
                                  size: heightSize(20),
                                  color: userLiked ? mainColor : textColor,
                                ),
                                SizedBox(width: widthSize(5)),
                                CText(
                                  text: homeController.engagementShortened(
                                      widget.postsData.likes.length),
                                  size: 20,
                                  color: Color(0xFF8A8A8A),
                                )
                              ],
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () async {
                            homeController.loadingComment.value = true;
                            // debugPrint(widget.postsData.id);
                            showComments(
                                context: context,
                                postId: widget.postsData.id,
                                userImage: widget.postsData.user.profileImage,
                                postUserName: widget.postsData.user.username);
                            await socket.getCommentByPostId(
                                widget.postsData.id, 1);
                          },
                          child: SizedBox(
                            height: heightSize(30),
                            width: widthSize(60),
                            child: Row(
                              children: [
                                // Icon(
                                //   FontAwesomeIcons.comment,
                                //   size: heightSize(25),
                                //   color: textColor,
                                // ),
                                SizedBox(
                                  height: heightSize(20),
                                  width: widthSize(20),
                                  child: Image.asset(
                                    'assets/images/Home/chatIcon.png',
                                    fit: BoxFit.contain,
                                    // color: homeController.viewBarOption.value == 1
                                    //     ? const Color(0xFFECECEC)
                                    //     : textColor3,
                                  ),
                                ),
                                SizedBox(width: widthSize(5)),
                                CText(
                                  text: homeController.engagementShortened(
                                      widget.postsData.comments),
                                  size: 20,
                                  color: Color(0xFF8A8A8A),
                                )
                              ],
                            ),
                          ),
                        ),

                        // Share
                        SizedBox(
                          height: heightSize(25),
                          width: widthSize(60),
                          child: Row(
                            children: [
                              // Icon(
                              //   FontAwesomeIcons.share,
                              //   size: heightSize(25),
                              //   color: textColor,
                              // ),
                              SizedBox(
                                height: heightSize(20),
                                width: widthSize(20),
                                child: Image.asset(
                                  'assets/images/Home/shareIcon.png',
                                  fit: BoxFit.contain,
                                  // color: homeController.viewBarOption.value == 1
                                  //     ? const Color(0xFFECECEC)
                                  //     : textColor3,
                                ),
                              ),
                              SizedBox(width: widthSize(5)),
                              CText(
                                text: homeController.engagementShortened(
                                    widget.postsData.comments),
                                size: 20,
                                color: Color(0xFF8A8A8A),
                              )
                            ],
                          ),
                        ),

                        // send
                        SizedBox(
                          height: heightSize(30),
                          width: widthSize(60),
                          child: Row(
                            children: [
                              SizedBox(
                                height: heightSize(20),
                                width: widthSize(20),
                                child: Image.asset(
                                  'assets/images/Home/sendIcon.png',
                                  fit: BoxFit.contain,
                                  // color: homeController.viewBarOption.value == 1
                                  //     ? const Color(0xFFECECEC)
                                  //     : textColor3,
                                ),
                              ),
                              SizedBox(width: widthSize(5)),
                              CText(
                                text: homeController.engagementShortened(
                                    widget.postsData.comments),
                                size: 20,
                                color: Color(0xFF8A8A8A),
                              )
                            ],
                          ),
                        ),

                        // details
                        SizedBox(
                          height: heightSize(25),
                          width: widthSize(60),
                          child: Row(
                            children: [
                              SizedBox(
                                height: heightSize(20),
                                width: widthSize(20),
                                child: Image.asset(
                                  'assets/images/Home/detailsIcon.png',
                                  fit: BoxFit.contain,
                                  // color: homeController.viewBarOption.value == 1
                                  //     ? const Color(0xFFECECEC)
                                  //     : textColor3,
                                ),
                              ),
                              SizedBox(width: widthSize(5)),
                              CText(
                                text: homeController.engagementShortened(
                                    widget.postsData.comments),
                                size: 20,
                                color: Color(0xFF8A8A8A),
                              )
                            ],
                          ),
                        ),

                        // gift
                        SizedBox(
                          height: heightSize(30),
                          width: widthSize(83),
                          child: Row(
                            children: [
                              SizedBox(
                                height: heightSize(20),
                                width: widthSize(20),
                                child: Image.asset(
                                  'assets/images/Home/dotIcon.png',
                                  fit: BoxFit.contain,
                                  // color: homeController.viewBarOption.value == 1
                                  //     ? const Color(0xFFECECEC)
                                  //     : textColor3,
                                ),
                              ),
                              // SizedBox(width: widthSize(2)),
                              const CText(
                                text: "100DOT",
                                size: 17,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: heightSize(20),
                  //   width: widthSize(20),
                  //   child: Image.asset("assets/images/gift.png"),
                  // )
                ],
              ),
            ),
            SizedBox(height: heightSize(20)),
          ],
        ),
      ),
    );
  }
}

postBarTitle(String userId, double width, String name, String image,
    PostForYou post, BuildContext context, bool showwidget) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: widthSize(10)),
    child: SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    homeController.loadingProfile.value = true;
                    await socket.getUserWithId(userId);
                    await socket.getUserPosts(userId);
                    await Future.delayed(const Duration(seconds: 2), () {});
                    homeController.loadingProfile.value = false;
                    Get.to(() => ViewUserProfileScreen(
                          isyou: false,
                        ));
                  },
                  child: CachedNetworkImage(
                    imageUrl: image,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    imageBuilder: (context, imageprovider) {
                      return Container(
                        height: heightSize(50),
                        width: widthSize(50),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(widthSize(2)),
                          child: Image(
                            image: imageprovider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: widthSize(10)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.poppins(
                        color: textColor,
                        fontSize: fontSize(18),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: heightSize(3)),
                    Text(
                      timeAgo(post.createdAt),
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF858585),
                        fontSize: fontSize(10),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Row(children: [
            if (authController.userdata.value.id != userId) ...[
              if (!authController.userdata.value.following.contains(userId))
                GestureDetector(
                  onTap: () async {
                    await socket.followUser(
                      authController.userdata.value.id,
                      userId,
                    );
                  },
                  child: CircleAvatar(
                    radius: widthSize(14),
                    backgroundColor: mainColor,
                    child: Icon(
                      Icons.add,
                      color: textColor,
                      size: heightSize(20),
                    ),
                  ),
                ),
              if (authController.userdata.value.following.contains(userId))
                SizedBox(
                  width: widthSize(3),
                ),
              // buttonsWidget(
              //   context,
              //   heightSize(30),
              //   widthSize(60),
              //   "Unfollow",
              //   mainColor,
              //   12,
              //   () async {
              //     await socket.unfollowUser(
              //       authController.userdata.value.id,
              //       userId,
              //     );
              //   },
              //   false,
              //   textColor,
              // ),
            ],
            SizedBox(width: widthSize(10)),
            if (authController.userdata.value.id == userId)
              Icon(
                Icons.more_vert,
                size: heightSize(30),
                color: textColor,
              ),
          ])
        ],
      ),
    ),
  );
}
