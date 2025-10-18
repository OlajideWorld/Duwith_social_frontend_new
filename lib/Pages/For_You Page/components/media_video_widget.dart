import "package:cached_network_image/cached_network_image.dart";
import "package:duwith_social/Pages/For_You%20Page/components/media_video_widget2.dart";
import "package:duwith_social/Pages/Home%20Page/screens/comments_display.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../common/custom-text.dart";
import "../../../models/post-data.dart";
import "../../../utils/color.dart";
import "../../../utils/sizes.dart";
import "../../Auth Page/controller/auth_controller.dart";
import "../../Auth Page/services/socket_sevice.dart";
import "../../Home Page/controllers/home_controller.dart";
import "../../View Profile Page/screens/view_profile_screen.dart";

AuthController authController = AuthController.instance;
HomeController homeController = HomeController.instance;
SocketService socket = SocketService.instance;

videoTopWidget(double width) {
  return SizedBox(
    height: heightSize(45),
    width: width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Container(
        //   height: heightSize(40),
        //   width: widthSize(40),
        //   alignment: Alignment.center,
        //   decoration: const BoxDecoration(
        //     color: Color(0xFF222631),
        //     borderRadius: BorderRadius.all(Radius.circular(20)),
        //   ),
        //   child: CText(
        //     text: authController.userdata.value.username.trim()[0],
        //     size: fontSize(23),
        //     fontFamily: UsedFonts.archivo,
        //     fontWeight: FontWeight.w400,
        //     color: const Color(0xFFFA2CD7),
        //   ),
        // ),
        // SizedBox(
        //   width: widthSize(220),
        //   height: heightSize(20),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       GestureDetector(
        //         onTap: () {
        //           homeController.forYouOption.value = 0;
        //         },
        //         child: Text(
        //           'Feed',
        //           textAlign: TextAlign.center,
        //           style: GoogleFonts.poppins(
        //             color: homeController.forYouOption.value == 0
        //                 ? const Color(0xFFECECEC)
        //                 : textColor3,
        //             fontSize: fontSize(15),
        //             fontWeight: homeController.forYouOption.value == 0
        //                 ? FontWeight.w600
        //                 : FontWeight.w500,
        //           ),
        //         ),
        //       ),
        //       GestureDetector(
        //         onTap: () {
        //           homeController.forYouOption.value = 1;
        //         },
        //         child: Text(
        //           'Following',
        //           textAlign: TextAlign.center,
        //           style: GoogleFonts.poppins(
        //             color: homeController.forYouOption.value == 1
        //                 ? const Color(0xFFECECEC)
        //                 : textColor3,
        //             fontSize: fontSize(15),
        //             fontWeight: homeController.forYouOption.value == 1
        //                 ? FontWeight.w600
        //                 : FontWeight.w500,
        //           ),
        //         ),
        //       ),
        //       GestureDetector(
        //         onTap: () {
        //           homeController.forYouOption.value = 2;
        //         },
        //         child: Text(
        //           'Connection',
        //           textAlign: TextAlign.center,
        //           style: GoogleFonts.poppins(
        //             color: homeController.forYouOption.value == 2
        //                 ? const Color(0xFFECECEC)
        //                 : textColor3,
        //             fontSize: fontSize(15),
        //             fontWeight: homeController.forYouOption.value == 2
        //                 ? FontWeight.w600
        //                 : FontWeight.w500,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        SizedBox(
          height: heightSize(30),
          width: widthSize(30),
          child: Image.asset(
            'assets/images/Home/searchglass.png',
            fit: BoxFit.contain,
            // color: homeController.viewBarOption.value == 1
            //     ? const Color(0xFFECECEC)
            //     : textColor3,
          ),
        ),
      ],
    ),
  );
}

foryouEnganementButtons(BuildContext context, PostForYou posts, double width) {
  bool userLiked = posts.likes.any(
      (interaction) => interaction.user == authController.userdata.value.id);
  return SizedBox(
    height: heightSize(360),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            height: heightSize(70),
            width: widthSize(50),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () async {
                    homeController.loadingProfile.value = true;
                    await socket.getUserWithId(posts.user.id);
                    await socket.getUserPosts(posts.user.id);
                    await Future.delayed(const Duration(seconds: 2), () {});
                    homeController.loadingProfile.value = false;
                    Get.to(() => ViewProfileScreen());
                  },
                  child: CachedNetworkImage(
                    imageUrl: posts.user.profileImage,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    imageBuilder: (context, imageprovider) {
                      return Container(
                        height: heightSize(50),
                        width: widthSize(50),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                                image: imageprovider, fit: BoxFit.fill)),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: heightSize(10),
                  left: widthSize(20),
                  right: widthSize(20),
                  child: Icon(
                    Icons.add_circle_outlined,
                    size: heightSize(20),
                    color: mainColor,
                  ),
                )
              ],
            )),

        // Like Button
        GestureDetector(
          onTap: () async {
            await socket.likePost(
                posts.id, authController.userdata.value.id, 1);
          },
          child: SizedBox(
            height: heightSize(60),
            width: widthSize(60),
            child: Column(
              children: [
                Icon(
                  userLiked == true
                      ? CupertinoIcons.heart_fill
                      : FontAwesomeIcons.heart,
                  size: heightSize(35),
                  color: userLiked ? mainColor : textColor,
                ),
                SizedBox(height: heightSize(5)),
                CText(
                  text: homeController.engagementShortened(posts.likes.length),
                  size: 20,
                  color: Color(0xFF8A8A8A),
                )
              ],
            ),
          ),
        ),

        // Comment
        GestureDetector(
          onTap: () async {
            homeController.loadingComment.value = true;
            //  debugPrint(widget.postsData.id);
            showComments(
                context: context,
                postId: posts.id,
                postUserName: posts.user.username,
                userImage: posts.user.profileImage);
            await socket.getCommentByPostId(posts.id, 1);
          },
          child: SizedBox(
            height: heightSize(60),
            width: widthSize(60),
            child: Column(
              children: [
                // Icon(
                //   FontAwesomeIcons.comment,
                //   size: heightSize(25),
                //   color: textColor,
                // ),
                SizedBox(
                  height: heightSize(35),
                  width: widthSize(35),
                  child: Image.asset(
                    'assets/images/Home/chatIcon.png',
                    fit: BoxFit.contain,
                    // color: homeController.viewBarOption.value == 1
                    //     ? const Color(0xFFECECEC)
                    //     : textColor3,
                  ),
                ),
                SizedBox(height: heightSize(5)),
                CText(
                  text: homeController.engagementShortened(posts.comments),
                  size: 20,
                  color: Color(0xFF8A8A8A),
                )
              ],
            ),
          ),
        ),

        // Share
        SizedBox(
          height: heightSize(60),
          width: widthSize(60),
          child: Column(
            children: [
              // Icon(
              //   FontAwesomeIcons.share,
              //   size: heightSize(25),
              //   color: textColor,
              // ),
              SizedBox(
                height: heightSize(35),
                width: widthSize(35),
                child: Image.asset(
                  'assets/images/Home/shareIcon.png',
                  fit: BoxFit.contain,
                  // color: homeController.viewBarOption.value == 1
                  //     ? const Color(0xFFECECEC)
                  //     : textColor3,
                ),
              ),
              SizedBox(height: heightSize(5)),
              CText(
                // text: homeController.engagementShortened(posts.comments),
                text: "100",
                size: 20,
                color: Color(0xFF8A8A8A),
              )
            ],
          ),
        ),

        // gift
        SizedBox(
          height: heightSize(60),
          width: widthSize(83),
          child: Column(
            children: [
              SizedBox(
                height: heightSize(35),
                width: widthSize(35),
                child: Image.asset(
                  'assets/images/Home/dotIcon.png',
                  fit: BoxFit.contain,
                  // color: homeController.viewBarOption.value == 1
                  //     ? const Color(0xFFECECEC)
                  //     : textColor3,
                ),
              ),
              SizedBox(height: heightSize(5)),
              const CText(
                text: "100DOT",
                size: 17,
              )
            ],
          ),
        ),

        // Icon(
        //   Icons.more_horiz,
        //   size: heightSize(35),
        //   color: textColor,
        // )
      ],
    ),
  );
}
