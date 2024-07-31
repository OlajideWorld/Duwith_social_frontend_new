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

import '../../../common/custom-text.dart';
import '../../Auth Page/services/socket_sevice.dart';

ProfileController profileController = ProfileController.instance;
SocketService socketService = SocketService.instance;

myProfileTopWidget(double width, User userdata) {
  return SizedBox(
    height: heightSize(215),
    width: width,
    child: Stack(
      children: [
        Image.asset(
          "assets/images/Profile/myprofile.png",
          fit: BoxFit.fill,
          height: heightSize(157),
          width: width,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: widthSize(30), vertical: heightSize(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              backbutton(onTap: () => Get.back()),
              const CText(
                text: "Profile",
                size: 15,
                color: textColor,
                fontFamily: UsedFonts.poppins,
                fontWeight: FontWeight.w500,
              ),
              GestureDetector(
                onTap: () {
                  // profileController.usernameStored.value =
                  //     profileController.viewProfileData.value.username;
                  // profileController.useruniqueIdStored.value =
                  //     profileController.viewProfileData.value.useruniqueId;
                  // profileController.bioStored.value =
                  //     profileController.viewProfileData.value.bio;
                  // profileController.phoneNumberStored.value =
                  //     profileController.viewProfileData.value.phoneNumber;
                  // profileController.emailStored.value =
                  //     profileController.viewProfileData.value.email;
                  // profileController.genderStored.value =
                  //     profileController.viewProfileData.value.gender;
                  // profileController.savedImage.value =
                  //     profileController.viewProfileData.value.profileImage;

                  Get.to(() => EditProfileScreen());
                },
                child: SizedBox(
                  child: Icon(
                    Icons.edit,
                    color: textColor,
                    size: heightSize(16),
                  ),
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: heightSize(97),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: userdata.profileImage,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  imageBuilder: (context, imageprovider) {
                    return Container(
                      height: heightSize(62),
                      width: widthSize(62),
                      decoration: const ShapeDecoration(
                          shape: OvalBorder(), color: textColor),
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
                SizedBox(
                  height: heightSize(27),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CText(
                            text: userdata.username,
                            size: 15,
                            color: textColor,
                            fontFamily: UsedFonts.poppins,
                            fontWeight: FontWeight.w500,
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
                      CText(
                        text: userdata.useruniqueId,
                        size: 11,
                        color: const Color(0xFFA3A2A2),
                        fontFamily: UsedFonts.poppins,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

selectUserViewTab(BuildContext context, double width) {
  return Container(
    width: width,
    height: heightSize(50),
    padding:
        EdgeInsets.symmetric(horizontal: widthSize(6), vertical: heightSize(6)),
    decoration: const BoxDecoration(
      color: Colors.transparent,
    ),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () async {
                profileController.viewprofileslide.value = 0;
                profileController.profileLoading.value = true;
                await socketService
                    .getUserPosts(profileController.viewProfileData.value.id);
                profileController.profileLoading.value = false;
              },
              child: Container(
                // width: widthSize(176),
                height: heightSize(50),

                decoration: const BoxDecoration(color: Colors.transparent),
                child: Column(
                  children: [
                    Text(
                      'Posts',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: profileController.viewprofileslide.value == 0
                            ? const Color(0xFFECECEC)
                            : textColor3,
                        fontSize: fontSize(14),
                        fontFamily: UsedFonts.poppins,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: heightSize(7)),
                    Divider(
                        height: heightSize(3),
                        thickness: 2,
                        color: profileController.viewprofileslide.value == 0
                            ? const Color(0xFFECECEC)
                            : faintColor),
                  ],
                ),
              ),
            ),
          ),
          //
          // Expanded(
          //   child: GestureDetector(
          //     onTap: () {
          //       profileController.viewprofileslide.value = 1;
          //     },
          //     child: Container(
          //       height: heightSize(50),
          //       decoration: const BoxDecoration(color: Colors.transparent),
          //       child: Column(
          //         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             'Stories',
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //               color: profileController.viewprofileslide.value == 1
          //                   ? const Color(0xFFECECEC)
          //                   : textColor3,
          //               fontSize: fontSize(14),
          //               fontFamily: UsedFonts.poppins,
          //               fontWeight: FontWeight.w700,
          //             ),
          //           ),
          //           SizedBox(height: heightSize(7)),
          //           Divider(
          //               height: heightSize(3),
          //               thickness: 2,
          //               color: profileController.viewprofileslide.value == 1
          //                   ? const Color(0xFFECECEC)
          //                   : faintColor),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),

          Expanded(
            child: GestureDetector(
              onTap: () async {
                profileController.viewprofileslide.value = 2;
                profileController.profileLoading.value = true;
                await socketService.getUserVideoPosts(
                    profileController.viewProfileData.value.id);
                profileController.profileLoading.value = false;
              },
              child: Container(
                height: heightSize(50),
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Videos',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: profileController.viewprofileslide.value == 2
                            ? const Color(0xFFECECEC)
                            : textColor3,
                        fontSize: fontSize(14),
                        fontFamily: UsedFonts.poppins,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: heightSize(7)),
                    Divider(
                        height: heightSize(3),
                        thickness: 2,
                        color: profileController.viewprofileslide.value == 2
                            ? const Color(0xFFECECEC)
                            : faintColor),
                  ],
                ),
              ),
            ),
          ),
        ]),
  );
}
