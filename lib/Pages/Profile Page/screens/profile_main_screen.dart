// ignore_for_file: must_be_immutable

import "package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart";
import "package:duwith_social/Pages/Auth%20Page/services/socket_sevice.dart";
import "package:duwith_social/Pages/Profile%20Page/components/profile_container_widget.dart";
import "package:duwith_social/Pages/Profile%20Page/components/social_binding_widget.dart";
import "package:duwith_social/Pages/Profile%20Page/controller/profile_controller.dart";
import "package:duwith_social/Pages/Profile%20Page/screens/customer_support.dart";
import "package:duwith_social/Pages/Profile%20Page/screens/referral_screen.dart";
import "package:duwith_social/Pages/Profile%20Page/screens/socials_links.dart";
import "package:duwith_social/Pages/Profile%20Page/screens/view_myprofile_screen.dart";
import "package:duwith_social/Pages/Wallet%20Page/screens/wallet_screen.dart";
import "package:duwith_social/common/custom-text.dart";
import "package:duwith_social/routes/routes.dart";
import "package:duwith_social/utils/color.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:loading_overlay_pro/loading_overlay_pro.dart";
import "../../../common/custom-nav-bar.dart";

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  AuthController authController = AuthController.instance;
  SocketService socketService = SocketService.instance;
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
            child: Obx(() {
              return LoadingOverlayPro(
                isLoading: profileController.profileLoading.value,
                child: Stack(children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          mainprofileAppBar(constraints.maxWidth),
                          // Accounts
                          SizedBox(height: heightSize(5)),
                          Container(
                            height: heightSize(271),
                            width: constraints.maxWidth,
                            padding: EdgeInsets.only(
                                top: heightSize(10),
                                left: widthSize(20),
                                right: widthSize(20),
                                bottom: heightSize(14)),
                            decoration: const BoxDecoration(color: faintColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CText(
                                  text: "Account",
                                  size: 13,
                                  color: Color(0xFFA3A2A2),
                                  fontFamily: UsedFonts.poppins,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(height: heightSize(5)),
                                profileWidget(
                                    "assets/images/Profile/profile.png",
                                    "My profiles", () async {
                                  profileController.profileLoading.value = true;
                                  await socketService.getUserWithId(
                                      authController.userdata.value.id);
                                  await socketService.getUserPosts(
                                      authController.userdata.value.id);
                                  await Future.delayed(
                                      const Duration(seconds: 2), () {});
                                  profileController.profileLoading.value =
                                      false;
                                  Get.to(
                                      () => ViewUserProfileScreen(isyou: true));
                                }, true),
                                SizedBox(height: heightSize(12)),
                                profileWidget(
                                    "assets/images/Profile/profile2.png",
                                    "Leaderboard",
                                    () {},
                                    true),
                                SizedBox(height: heightSize(12)),
                                profileWidget(
                                    "assets/images/Profile/profile2.png",
                                    "Wallet", () {
                                  Get.to(() => WalletScreen());
                                }, true),
                                SizedBox(height: heightSize(12)),
                                profileWidget(
                                    "assets/images/Profile/profile3.png",
                                    "Promote",
                                    () {},
                                    false),
                              ],
                            ),
                          ),
                          // Others
                          SizedBox(height: heightSize(5)),
                          Container(
                            height: heightSize(271),
                            width: constraints.maxWidth,
                            padding: EdgeInsets.only(
                                top: heightSize(10),
                                left: widthSize(20),
                                right: widthSize(20),
                                bottom: heightSize(14)),
                            decoration: const BoxDecoration(color: faintColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CText(
                                  text: "Others",
                                  size: 13,
                                  color: Color(0xFFA3A2A2),
                                  fontFamily: UsedFonts.poppins,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(height: heightSize(5)),
                                profileWidget(
                                    "assets/images/Profile/profile4.png",
                                    "Referral", () {
                                  Get.to(() => ReferralScreen());
                                }, true),
                                SizedBox(height: heightSize(12)),
                                profileWidget(
                                    "assets/images/Profile/profile5.png",
                                    "Dark theme",
                                    () {},
                                    true),
                                SizedBox(height: heightSize(12)),
                                profileWidget(
                                    "assets/images/Profile/profile6.png",
                                    "Social", () {
                                  Get.to(() => SocialLinkBindingPage());
                                }, true),
                                SizedBox(height: heightSize(12)),
                                profileWidget(
                                    "assets/images/Profile/profile7.png",
                                    "Notifications",
                                    () {},
                                    false),
                              ],
                            ),
                          ),
                          SizedBox(height: heightSize(5)),
                          // Support
                          Container(
                            height: heightSize(170),
                            width: constraints.maxWidth,
                            padding: EdgeInsets.only(
                                top: heightSize(23),
                                left: widthSize(20),
                                right: widthSize(20),
                                bottom: heightSize(14)),
                            decoration: const BoxDecoration(color: faintColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CText(
                                  text: "Support",
                                  size: 13,
                                  color: Color(0xFFA3A2A2),
                                  fontFamily: UsedFonts.poppins,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(height: heightSize(16)),
                                profileWidget(
                                    "assets/images/Profile/profile8.png",
                                    "Customer support",
                                    () => Get.to(() => CustomerSupportScreen()),
                                    true),
                                SizedBox(height: heightSize(12)),
                                profileWidget(
                                    "assets/images/Profile/profile9.png",
                                    "Delete my account",
                                    () => logoutDetails(
                                        context,
                                        "Delete this Account",
                                        "Are you sure you want to delete this account?",
                                        constraints.maxWidth,
                                        () {}),
                                    false),
                              ],
                            ),
                          ),
                          SizedBox(height: heightSize(22)),
                          GestureDetector(
                            onTap: () => logoutDetails(
                                context,
                                "Logout this Account",
                                "Are you sure you want to logout this account?",
                                constraints.maxWidth, () {
                              authController.saveCounter(true);
                              Get.offAllNamed(MyRoutes.onboardScreeen);
                            }),
                            child: SizedBox(
                              height: heightSize(20),
                              width: widthSize(70),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: heightSize(16),
                                    width: widthSize(16),
                                    child: Image.asset(
                                      "assets/images/logout.png",
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  SizedBox(width: widthSize(8)),
                                  const CText(
                                    text: "Logout",
                                    size: 12,
                                    color: Color(0xFFFF4F4F),
                                    fontFamily: UsedFonts.poppins,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: heightSize(145))
                        ],
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomNavBarWidget(),
                  )
                ]),
              );
            }),
          );
        },
      ),
    );
  }
}
