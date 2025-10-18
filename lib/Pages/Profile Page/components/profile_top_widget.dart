import 'package:cached_network_image/cached_network_image.dart';
import 'package:duwith_social/Pages/Profile%20Page/controller/profile_controller.dart';
import 'package:duwith_social/Pages/Profile%20Page/screens/edit_profile.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/models/user_data.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/custom-text.dart';
import '../../Auth Page/controller/auth_controller.dart';
import '../../Auth Page/services/socket_sevice.dart';
import '../../View Profile Page/components/profile_appBar.dart';

ProfileController profileController = ProfileController.instance;
SocketService socketService = SocketService.instance;
AuthController authController = AuthController.instance;

myProfileTopWidget(
    BuildContext context, double width, User userdata, bool isYou) {
  RxBool isExpanded = false.obs;
  return Container(
    width: width,
    padding: EdgeInsets.only(
      left: widthSize(20),
      right: widthSize(20),
      top: heightSize(30),
    ),
    decoration: const BoxDecoration(
      color: Color(0xFF0e121e),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: widthSize(32),
                    backgroundColor: Color.fromARGB(255, 188, 58, 15),
                    child: CircleAvatar(
                      radius: widthSize(28),
                      backgroundColor: Color.fromARGB(255, 255, 68, 6),
                      child: CachedNetworkImage(
                        imageUrl: userdata.profileImage,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        imageBuilder: (context, imageprovider) {
                          return Container(
                            height: heightSize(62),
                            width: widthSize(62),
                            decoration: const ShapeDecoration(
                                shape: OvalBorder(), color: Colors.black),
                            child: Container(
                              height: heightSize(58),
                              width: widthSize(58),
                              decoration: ShapeDecoration(
                                  shape: const OvalBorder(),
                                  image: DecorationImage(
                                      image: imageprovider, fit: BoxFit.fill)),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: widthSize(20)),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              userdata.username,
                              style: GoogleFonts.poppins(
                                color: textColor,
                                fontSize: fontSize(18),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: heightSize(16),
                              width: widthSize(16),
                              child: Image.asset(
                                "assets/images/verified.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSize(5)),
                        CText(
                          text: userdata.useruniqueId,
                          size: 11,
                          color: const Color(0xFFA3A2A2),
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            isYou == true
                ? SizedBox(
                    width: widthSize(110),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.public,
                          size: heightSize(25),
                          color: Colors.white,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => EditProfileScreen());
                          },
                          child: SizedBox(
                            child: Icon(
                              Icons.edit,
                              color: textColor,
                              size: heightSize(25),
                            ),
                          ),
                        ),
                        Container(
                          height: heightSize(30),
                          width: widthSize(30),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.grey),
                            shape: BoxShape.rectangle, // square/rectangular
                            borderRadius: BorderRadius.circular(
                                8), // make slightly rounded if you want
                          ),
                          child: Icon(
                            Icons.person_outline,
                            color: Colors.grey,
                            size: heightSize(20),
                          ),
                        )
                      ],
                    ),
                  )
                : Icon(
                    Icons.more_vert,
                    size: heightSize(16),
                    color: textColor,
                  )
          ],
        ),
        SizedBox(height: heightSize(15)),
        PostContent(
            isExpanded: isExpanded,
            text: userdata.bio,
            size: 14,
            color: textColor,
            fontWeight: FontWeight.w500),
        SizedBox(height: heightSize(10)),
        Text(
          'Joined Feb Febuary',
          style: GoogleFonts.poppins(
            color: textColor3,
            fontSize: fontSize(15),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: heightSize(5)),
        Row(
          children: [
            Text(
              'Nigeria |',
              style: GoogleFonts.poppins(
                color: textColor3,
                fontSize: fontSize(15),
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '  www.${userdata.email}',
              style: GoogleFonts.poppins(
                color: mainColor,
                fontSize: fontSize(15),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(
          width: width,
          height: heightSize(49),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              numbersWidget2(
                  profileController.engagementShortened(
                      profileController.viewProfileData.value.followers.length),
                  "Followers"),
              SizedBox(width: widthSize(10)),
              VerticalDivider(
                width: widthSize(2),
                color: textColor3,
              ),
              SizedBox(width: widthSize(10)),
              numbersWidget2(
                  profileController.engagementShortened(
                      profileController.viewProfileData.value.following.length),
                  "Following"),
              const Spacer(),
              isYou == false
                  ? SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (authController.userdata.value.id !=
                              userdata.id) ...[
                            if (!authController.userdata.value.following
                                .contains(userdata.id))
                              buttonsWidget(
                                context,
                                heightSize(30),
                                widthSize(70),
                                "follow",
                                mainColor,
                                12,
                                () async {
                                  await socket.followUser(
                                    authController.userdata.value.id,
                                    userdata.id,
                                  );
                                },
                                false,
                                textColor,
                              ),
                            if (authController.userdata.value.following
                                .contains(userdata.id))
                              buttonsWidget(
                                context,
                                heightSize(30),
                                widthSize(70),
                                "Unfollow",
                                mainColor,
                                12,
                                () async {
                                  await socket.unfollowUser(
                                    authController.userdata.value.id,
                                    userdata.id,
                                  );
                                },
                                false,
                                textColor,
                              ),
                          ],
                          // SizedBox(width: widthSize(10)),
                          // buttonsWidget(context, heightSize(30), widthSize(70),
                          //     "Message", mainColor, 13, () {}, false, textColor)
                        ],
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ],
    ),
  );
}

selectUserViewTab(BuildContext context, double width) {
  return Container(
    width: width,
    height: heightSize(50),
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(
        horizontal: widthSize(30), vertical: heightSize(10)),
    decoration: const BoxDecoration(
      color: Color(0xFF0e121e),
    ),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              profileController.viewprofileslide.value = 0;
              profileController.profileLoading.value = true;
              await socketService
                  .getUserPosts(profileController.viewProfileData.value.id);
              profileController.profileLoading.value = false;
            },
            child: SizedBox(
              height: heightSize(30),
              child: Text(
                'Post',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: profileController.viewprofileslide.value == 0
                      ? const Color(0xFFECECEC)
                      : textColor3,
                  fontSize: fontSize(18),
                  fontFamily: UsedFonts.poppins,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          //
          GestureDetector(
            onTap: () async {
              profileController.viewprofileslide.value = 1;
              profileController.profileLoading.value = true;

              await socketService
                  .getUserPosts(profileController.viewProfileData.value.id);

              profileController.imagesPost.value = profileController
                  .userPostList
                  .where((post) => post.media.single.type == "image")
                  .toList();
              profileController.profileLoading.value = false;
            },
            child: SizedBox(
              height: heightSize(30),
              child: Text(
                'Image',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: profileController.viewprofileslide.value == 1
                      ? const Color(0xFFECECEC)
                      : textColor3,
                  fontSize: fontSize(18),
                  fontFamily: UsedFonts.poppins,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () async {
              profileController.viewprofileslide.value = 2;
              profileController.profileLoading.value = true;
              await socketService.getUserVideoPosts(
                  profileController.viewProfileData.value.id);
              profileController.profileLoading.value = false;
            },
            child: SizedBox(
              height: heightSize(30),
              child: Text(
                'Videos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: profileController.viewprofileslide.value == 2
                      ? const Color(0xFFECECEC)
                      : textColor3,
                  fontSize: fontSize(18),
                  fontFamily: UsedFonts.poppins,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          // GestureDetector(
          //   onTap: () async {
          //     profileController.viewprofileslide.value = 3;
          //     profileController.profileLoading.value = true;

          //     await socketService
          //         .getUserPosts(profileController.viewProfileData.value.id);
          //     profileController.profileLoading.value = false;
          //   },
          //   child: SizedBox(
          //     height: heightSize(30),
          //     child: Text(
          //       'Quiz',
          //       textAlign: TextAlign.center,
          //       style: TextStyle(
          //         color: profileController.viewprofileslide.value == 3
          //             ? const Color(0xFFECECEC)
          //             : textColor3,
          //         fontSize: fontSize(14),
          //         fontFamily: UsedFonts.poppins,
          //         fontWeight: FontWeight.w700,
          //       ),
          //     ),
          //   ),
          // ),

          // GestureDetector(
          //   onTap: () async {
          //     profileController.viewprofileslide.value = 4;
          //     profileController.profileLoading.value = true;

          //     await socketService
          //         .getUserPosts(profileController.viewProfileData.value.id);
          //     profileController.profileLoading.value = false;
          //   },
          //   child: SizedBox(
          //     height: heightSize(30),
          //     child: Text(
          //       'Voting',
          //       textAlign: TextAlign.center,
          //       style: TextStyle(
          //         color: profileController.viewprofileslide.value == 4
          //             ? const Color(0xFFECECEC)
          //             : textColor3,
          //         fontSize: fontSize(14),
          //         fontFamily: UsedFonts.poppins,
          //         fontWeight: FontWeight.w700,
          //       ),
          //     ),
          //   ),
          // ),

          // GestureDetector(
          //   onTap: () async {
          //     profileController.viewprofileslide.value = 5;
          //     profileController.profileLoading.value = true;

          //     await socketService
          //         .getUserPosts(profileController.viewProfileData.value.id);
          //     profileController.profileLoading.value = false;
          //   },
          //   child: SizedBox(
          //     height: heightSize(30),
          //     child: Text(
          //       'Saved',
          //       textAlign: TextAlign.center,
          //       style: TextStyle(
          //         color: profileController.viewprofileslide.value == 5
          //             ? const Color(0xFFECECEC)
          //             : textColor3,
          //         fontSize: fontSize(14),
          //         fontFamily: UsedFonts.poppins,
          //         fontWeight: FontWeight.w700,
          //       ),
          //     ),
          //   ),
          // ),
        ]),
  );
}
