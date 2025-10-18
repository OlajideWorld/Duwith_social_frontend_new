import "package:cached_network_image/cached_network_image.dart";
import "package:duwith_social/models/post-data.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../common/custom-text.dart";
import "../../../utils/color.dart";
import "../../Auth Page/services/socket_sevice.dart";
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
        SizedBox(height: heightSize(15)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widthSize(10)),
          child: PostContent(
              isExpanded: homeController.isExpanded,
              text: post.caption,
              size: 10,
              color: const Color(0xFFD7D7D7),
              fontWeight: FontWeight.w400),
        ),
        SizedBox(height: heightSize(15)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widthSize(10)),
          child: SizedBox(
            height: heightSize(70),
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
                SizedBox(height: heightSize(7)),
                Divider(
                    height: heightSize(3),
                    thickness: 1,
                    color: Color(0xFF2A2D3C)),
                SizedBox(height: heightSize(7)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: heightSize(30),
                      width: widthSize(150),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(widthSize(20)),
                          color: Color(0xFF1C202B)),
                      child: Center(
                        child: Text(
                          'Amazing',
                          style: GoogleFonts.podkova(
                            fontSize: widthSize(20),
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: heightSize(30),
                      width: widthSize(150),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(widthSize(20)),
                          color: Color(0xFF1C202B)),
                      child: Center(
                          child: Text(
                        'Good',
                        style: GoogleFonts.podkova(
                          fontSize: widthSize(20),
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      )),
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
                            color: Colors.black,
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
                        fontSize: fontSize(18),
                        fontWeight: FontWeight.w600,
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
        ],
      ),
    ),
  );
}
