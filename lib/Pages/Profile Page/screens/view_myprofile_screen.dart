// ignore_for_file: invalid_use_of_protected_member, must_be_immutable

import "package:duwith_social/Pages/Profile%20Page/components/profile_list_widget.dart";
import "package:duwith_social/Pages/Profile%20Page/components/profile_top_widget.dart";
import "package:duwith_social/Pages/Profile%20Page/controller/profile_controller.dart";
import "package:duwith_social/utils/color.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../common/custom-text.dart";
import "../../View Profile Page/components/profile_appBar.dart";

class ViewUserProfileScreen extends StatelessWidget {
  ViewUserProfileScreen({super.key});

  ProfileController profileController = ProfileController.instance;

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
                return SizedBox(
                  child: Column(
                    children: [
                      myProfileTopWidget(constraints.maxWidth,
                          profileController.viewProfileData.value),
                      SizedBox(height: heightSize(15)),
                      SizedBox(
                        child: CText(
                          text: profileController.viewProfileData.value.bio,
                          size: 15,
                          textAlign: TextAlign.center,
                          color: const Color(0xFFDBDBDB),
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: heightSize(15)),
                      SizedBox(
                        height: heightSize(49),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            numbersWidget(
                                profileController.engagementShortened(
                                    profileController.viewProfileData.value
                                        .followers.length),
                                "Followers"),
                            SizedBox(width: widthSize(20)),
                            VerticalDivider(
                              width: widthSize(2),
                              color: const Color(0xFF317ACF),
                            ),
                            SizedBox(width: widthSize(20)),
                            numbersWidget(
                                profileController.engagementShortened(
                                    profileController.viewProfileData.value
                                        .following.length),
                                "Following"),
                            SizedBox(width: widthSize(20)),
                            VerticalDivider(
                              width: widthSize(2),
                              color: const Color(0xFF317ACF),
                            ),
                            SizedBox(width: widthSize(20)),
                            numbersWidget(
                                profileController.engagementShortened(
                                    profileController
                                        .userPostList.value.length),
                                "Posts")
                          ],
                        ),
                      ),
                      SizedBox(height: heightSize(20)),
                      selectUserViewTab(context, constraints.maxWidth),
                      SizedBox(height: heightSize(15)),
                      profileController.viewprofileslide.value == 0
                          ? profileController.profileLoading.value == true
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: mainColor,
                                  ),
                                )
                              : myProfileViewPosts(
                                  context, constraints.maxWidth, 2)
                          : profileController.viewprofileslide.value == 2
                              ? profileController.profileLoading.value == true
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: mainColor,
                                      ),
                                    )
                                  : myProfileViewVideos(
                                      context, constraints.maxWidth, 2)
                              : const Center(
                                  child: CText(
                                    text:
                                        "Opps unable to fetch data at this points, try again",
                                    size: 15,
                                    color: Color(0xFFA3A2A2),
                                    fontFamily: UsedFonts.poppins,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                    ],
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
