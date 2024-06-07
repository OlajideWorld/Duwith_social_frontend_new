import "package:duwith_social/Pages/Profile%20Page/components/profile_container_widget.dart";
import "package:duwith_social/common/custom-text.dart";
import "package:duwith_social/utils/color.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";
import "../../../common/custom-nav-bar.dart";

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
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
                            profileWidget("assets/images/Profile/profile.png",
                                "My profiles", () {}, true),
                            SizedBox(height: heightSize(12)),
                            profileWidget("assets/images/Profile/profile2.png",
                                "Leaderboard", () {}, true),
                            SizedBox(height: heightSize(12)),
                            profileWidget("assets/images/Profile/profile2.png",
                                "Wallet", () {}, true),
                            SizedBox(height: heightSize(12)),
                            profileWidget("assets/images/Profile/profile3.png",
                                "Promote", () {}, false),
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
                            profileWidget("assets/images/Profile/profile4.png",
                                "Referral", () {}, true),
                            SizedBox(height: heightSize(12)),
                            profileWidget("assets/images/Profile/profile5.png",
                                "Dark theme", () {}, true),
                            SizedBox(height: heightSize(12)),
                            profileWidget("assets/images/Profile/profile6.png",
                                "Social", () {}, true),
                            SizedBox(height: heightSize(12)),
                            profileWidget("assets/images/Profile/profile7.png",
                                "Notifications", () {}, false),
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
                            profileWidget("assets/images/Profile/profile8.png",
                                "Customer support", () {}, true),
                            SizedBox(height: heightSize(12)),
                            profileWidget("assets/images/Profile/profile9.png",
                                "Delete my account", () {}, false),
                          ],
                        ),
                      ),
                      SizedBox(height: heightSize(22)),
                      SizedBox(
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
        },
      ),
    );
  }
}
