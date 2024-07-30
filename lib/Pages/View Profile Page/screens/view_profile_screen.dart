// ignore_for_file: must_be_immutable, invalid_use_of_protected_member
import 'package:duwith_social/Pages/Profile%20Page/components/profile_list_widget.dart';
import 'package:duwith_social/Pages/Profile%20Page/controller/profile_controller.dart';
import 'package:duwith_social/Pages/View%20Profile%20Page/components/profile_appBar.dart';
import 'package:duwith_social/Pages/View%20Profile%20Page/components/view_profile_slide.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewProfileScreen extends StatelessWidget {
  ViewProfileScreen({
    super.key,
  });

  ProfileController profileController = ProfileController.instance;
  @override
  Widget build(BuildContext context) {
    var data = profileController.viewProfileData.value;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Obx(() {
              return SizedBox(
                child: profileController.viewProfileData.value.email == ""
                    ? const Center(
                        child: CText(
                          text: "User data is not available",
                          color: textColor,
                          size: 15,
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : Column(
                        children: [
                          Container(
                            height: heightSize(300),
                            width: constraints.maxWidth,
                            padding:
                                EdgeInsets.symmetric(horizontal: widthSize(20)),
                            decoration: const BoxDecoration(
                              color: Color(0xFF015AC2),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 45.0),
                                  child: profileAppBar(),
                                ),
                                SizedBox(height: heightSize(13)),
                                profileData(
                                    data.username,
                                    data.profileImage,
                                    data.useruniqueId,
                                    data.bio,
                                    profileController.engagementShortened(
                                        data.followers.length),
                                    profileController.engagementShortened(
                                        data.following.length),
                                    profileController.engagementShortened(
                                        profileController
                                            .userPostList.value.length)),
                              ],
                            ),
                          ),
                          Container(
                            height: heightSize(130),
                            width: constraints.maxWidth,
                            decoration:
                                const BoxDecoration(color: Color(0xFF28282C)),
                            child: Column(
                              children: [
                                SizedBox(height: heightSize(19)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    buttonsWidget(
                                        context,
                                        heightSize(36),
                                        widthSize(165),
                                        "Message",
                                        const Color(0xFF28282C),
                                        10,
                                        () {},
                                        true,
                                        Colors.white),
                                    SizedBox(width: widthSize(16)),
                                    buttonsWidget(
                                        context,
                                        heightSize(36),
                                        widthSize(165),
                                        "Follow",
                                        highlightColor,
                                        10,
                                        () {},
                                        false,
                                        Colors.white),
                                  ],
                                ),
                                SizedBox(height: heightSize(24)),
                                selectViewProfile(
                                    context, constraints.maxWidth),
                              ],
                            ),
                          ),
                          SizedBox(height: heightSize(19)),
                          if (profileController.viewprofileslide.value == 0)
                            profileController.userPostList.value.isEmpty
                                ? const Center(
                                    child: CText(
                                      text: "No Posts available",
                                      color: textColor,
                                      size: 15,
                                      fontFamily: UsedFonts.poppins,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                : myProfileViewPosts(
                                    context, constraints.maxWidth, 1),

                          // if (profileController.viewprofileslide.value == 1)
                          //   viewProfileStoriesList(context),
                          if (profileController.viewprofileslide.value == 2)
                            profileController.userVideoList.value.isEmpty
                                ? const Center(
                                    child: CText(
                                      text: "No Videos available",
                                      color: textColor,
                                      size: 15,
                                      fontFamily: UsedFonts.poppins,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                : myProfileViewVideos(
                                    context, constraints.maxWidth, 1)
                        ],
                      ),
              );
            }),
          );
        },
      ),
    );
  }
}
