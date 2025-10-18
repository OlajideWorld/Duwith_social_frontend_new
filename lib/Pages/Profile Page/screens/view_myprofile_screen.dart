// ignore_for_file: invalid_use_of_protected_member, must_be_immutable

import "package:duwith_social/Pages/Profile%20Page/components/profile_list_widget.dart";
import "package:duwith_social/Pages/Profile%20Page/components/profile_top_widget.dart";
import "package:duwith_social/Pages/Profile%20Page/controller/profile_controller.dart";
import "package:duwith_social/utils/color.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../common/custom-text.dart";
import "../../Post page/screens/post_page.dart";
import "../../View Profile Page/components/profile_appBar.dart";
import "../../Wallet Page/screens/new_wallet_screen.dart";

class ViewUserProfileScreen extends StatelessWidget {
  final bool isyou;
  ViewUserProfileScreen({super.key, required this.isyou});

  ProfileController profileController = ProfileController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF161925),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: SafeArea(
              child: Obx(() {
                return SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      myProfileTopWidget(context, constraints.maxWidth,
                          profileController.viewProfileData.value, isyou),
                      SizedBox(height: heightSize(10)),
                      isyou == true
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: widthSize(10)),
                              child: Container(
                                height: heightSize(50),
                                width: constraints.maxWidth,
                                padding: EdgeInsets.only(
                                    left: widthSize(15), right: widthSize(10)),
                                decoration: BoxDecoration(
                                    color: Color(0xFF0e121e),
                                    border: Border.all(color: mainColor),
                                    borderRadius:
                                        BorderRadius.circular(widthSize(15))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () => Get.to(
                                          () => NewWalletMainScreenPage()),
                                      child: SizedBox(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.wallet,
                                              size: heightSize(15),
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: widthSize(5),
                                            ),
                                            Text(
                                              "Wallet",
                                              style: GoogleFonts.poppins(
                                                color: textColor,
                                                fontSize: fontSize(14),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () =>
                                          Get.to(() => PostContentPage()),
                                      child: CircleAvatar(
                                        backgroundColor: mainColor,
                                        radius: widthSize(18),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: heightSize(25),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.public,
                                            size: heightSize(15),
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: widthSize(5),
                                          ),
                                          Text(
                                            "Connections",
                                            style: GoogleFonts.poppins(
                                              color: textColor,
                                              fontSize: fontSize(14),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox(),
                      isyou == true
                          ? SizedBox(height: heightSize(10))
                          : SizedBox(),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: widthSize(20)),
                        child: selectUserViewTab(context, constraints.maxWidth),
                      ),
                      SizedBox(height: heightSize(10)),
                      profileController.viewprofileslide.value == 0
                          ? profileController.profileLoading.value == true
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: mainColor,
                                  ),
                                )
                              : viewUserPostList(context, constraints.maxWidth)
                          : profileController.viewprofileslide.value == 1
                              ? profileController.profileLoading.value == true
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: mainColor,
                                      ),
                                    )
                                  : myProfileViewPosts(
                                      context, constraints.maxWidth, 2)
                              : profileController.viewprofileslide.value == 2
                                  ? profileController.profileLoading.value ==
                                          true
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
                                            "Opps, Incoming Page will soon be released",
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
