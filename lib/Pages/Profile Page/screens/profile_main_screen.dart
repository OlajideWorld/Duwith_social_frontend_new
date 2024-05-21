import "package:duwith_social/Pages/Profile%20Page/components/profile_container_widget.dart";
import "package:duwith_social/Pages/View%20Profile%20Page/components/profile_appBar.dart";
import "package:duwith_social/common/custom-text.dart";
import "package:duwith_social/utils/color.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";

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
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
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
                        top: heightSize(23),
                        left: widthSize(20),
                        right: widthSize(20),
                        bottom: heightSize(14)),
                    decoration: const BoxDecoration(color: faintColor),
                    child: Column(
                      children: [
                        const CText(
                          text: "Account",
                          size: 13,
                          color: Color(0xFFA3A2A2),
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: heightSize(16)),
                        profileWidget("assets/images/Profile/profile1.svg",
                            "My profiles", () {}),
                        SizedBox(height: heightSize(12)),
                        profileWidget("assets/images/Profile/profile2.svg",
                            "My profiles", () {}),
                        SizedBox(height: heightSize(12)),
                        profileWidget("assets/images/Profile/profile2.svg",
                            "My profiles", () {}),
                        SizedBox(height: heightSize(12)),
                        profileWidget("assets/images/Profile/profile3.svg",
                            "My profiles", () {}),
                      ],
                    ),
                  ),
                  // Others
                  SizedBox(height: heightSize(5)),
                  Container(
                    height: heightSize(271),
                    width: constraints.maxWidth,
                    padding: EdgeInsets.only(
                        top: heightSize(23),
                        left: widthSize(20),
                        right: widthSize(20),
                        bottom: heightSize(14)),
                    decoration: const BoxDecoration(color: faintColor),
                    child: Column(
                      children: [
                        const CText(
                          text: "Others",
                          size: 13,
                          color: Color(0xFFA3A2A2),
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: heightSize(16)),
                        profileWidget("assets/images/Profile/profile4.svg",
                            "My profiles", () {}),
                        SizedBox(height: heightSize(12)),
                        profileWidget("assets/images/Profile/profile5.svg",
                            "My profiles", () {}),
                        SizedBox(height: heightSize(12)),
                        profileWidget("assets/images/Profile/profile6.svg",
                            "My profiles", () {}),
                        SizedBox(height: heightSize(12)),
                        profileWidget("assets/images/Profile/profile7.svg",
                            "My profiles", () {}),
                      ],
                    ),
                  ),
                  // Support
                  Container(
                    height: heightSize(163),
                    width: constraints.maxWidth,
                    padding: EdgeInsets.only(
                        top: heightSize(23),
                        left: widthSize(20),
                        right: widthSize(20),
                        bottom: heightSize(14)),
                    decoration: const BoxDecoration(color: faintColor),
                    child: Column(
                      children: [
                        const CText(
                          text: "Support",
                          size: 13,
                          color: Color(0xFFA3A2A2),
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: heightSize(16)),
                        profileWidget("assets/images/Profile/profile8.svg",
                            "My profiles", () {}),
                        SizedBox(height: heightSize(12)),
                        profileWidget("assets/images/Profile/profile8.svg",
                            "My profiles", () {}),
                      ],
                    ),
                  ),
                  SizedBox(height: heightSize(6)),
                  SizedBox(
                    height: heightSize(20),
                    width: widthSize(70),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.logout_rounded,
                          size: 20,
                          color: Colors.red,
                        ),
                        CText(
                          text: "Logout",
                          size: 12,
                          color: Color(0xFFFF4F4F),
                          fontFamily: UsedFonts.poppins,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
