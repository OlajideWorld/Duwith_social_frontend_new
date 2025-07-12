import "package:cached_network_image/cached_network_image.dart";
import "package:duwith_social/models/post-data.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../common/custom-text.dart";
import "../../../utils/color.dart";
import "../../Auth Page/services/socket_sevice.dart";
import "../../Home Page/components/home_for_you.dart";
import "../../Home Page/controllers/home_controller.dart";
import "../../View Profile Page/screens/view_profile_screen.dart";

HomeController homeController = HomeController.instance;
SocketService socket = SocketService.instance;

foryouBottomContent(BuildContext context, PostForYou post, double width) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: heightSize(12),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min, // <–– shrink‐wrap to its children
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        forYouUserDetails(post.user.id, width, post.user.username,
            post.user.profileImage, context, true),
        SizedBox(height: heightSize(15)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widthSize(10)),
          child: PostContent(
              isExpanded: homeController.isExpanded,
              text: post.caption,
              size: 10,
              color: const Color(0xFFD7D7D7),
              fontFamily: UsedFonts.poppins,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(height: heightSize(15)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widthSize(10)),
          child: SizedBox(
            height: heightSize(60),
            width: width,
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
                          SizedBox(
                            height: heightSize(30),
                            width: widthSize(150),
                            child: LinearProgressIndicator(
                              backgroundColor: const Color(0xFF292C37),
                              value: 0.3,
                              valueColor: const AlwaysStoppedAnimation(
                                  Color(0xFF1C202B)),
                              borderRadius:
                                  BorderRadius.circular(widthSize(20)),
                              minHeight: heightSize(30),
                            ),
                          ),
                          SizedBox(
                              height: heightSize(30),
                              width: widthSize(150),
                              child: Padding(
                                padding: EdgeInsets.all(widthSize(10)),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CText(
                                      text: "Amazing",
                                      color: textColor,
                                      size: 12,
                                    ),
                                    CText(
                                      text: "30%",
                                      color: textColor,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: heightSize(30),
                      width: widthSize(150),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: heightSize(30),
                            width: widthSize(150),
                            child: LinearProgressIndicator(
                              backgroundColor: const Color(0xFF1C202B),
                              value: 0.5,
                              valueColor: const AlwaysStoppedAnimation(
                                  Color(0xFF292C37)),
                              borderRadius:
                                  BorderRadius.circular(widthSize(20)),
                              minHeight: heightSize(30),
                            ),
                          ),
                          SizedBox(
                              height: heightSize(30),
                              width: widthSize(150),
                              child: Padding(
                                padding: EdgeInsets.all(widthSize(10)),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CText(
                                      text: "50%",
                                      color: textColor,
                                      size: 12,
                                    ),
                                    CText(
                                      text: "Good",
                                      color: textColor,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

forYouUserDetails(String userId, double width, String name, String image,
    BuildContext context, bool showwidget) {
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
                    Get.to(() => ViewProfileScreen());
                  },
                  child: CachedNetworkImage(
                    imageUrl: image,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    imageBuilder: (context, imageprovider) {
                      return Container(
                        height: heightSize(50),
                        width: widthSize(50),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
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
                        color: textColor,
                        fontSize: fontSize(15),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: heightSize(3)),
                    Text(
                      "4 hours ago",
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
          // showwidget
          //     ? SizedBox(
          //         height: heightSize(25),
          //         width: widthSize(80),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             buttonsWidget(context, heightSize(25), widthSize(52),
          //                 "Follow", mainColor, 8, () {}, false, Colors.white),
          //             Icon(
          //               Icons.more_vert,
          //               size: heightSize(16),
          //               color: textColor,
          //             )
          //           ],
          //         ),
          //       )
          //     : const SizedBox(),
          Icon(
            Icons.more_vert,
            size: heightSize(20),
            color: textColor,
          )
        ],
      ),
    ),
  );
}
