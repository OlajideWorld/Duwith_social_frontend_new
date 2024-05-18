import 'package:duwith_social/Pages/View%20Profile%20Page/components/profile_appBar.dart';
import 'package:duwith_social/Pages/View%20Profile%20Page/components/view_profile_slide.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';

class ViewProfileScreen extends StatelessWidget {
  final String name;
  final String image;
  final String nickname;
  final String description;
  final String followers;
  final String following;
  final String postNumber;
  const ViewProfileScreen(
      {super.key,
      required this.name,
      required this.image,
      required this.nickname,
      required this.description,
      required this.followers,
      required this.following,
      required this.postNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Column(
              children: [
                Container(
                  height: heightSize(295),
                  width: constraints.maxWidth,
                  padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
                  decoration: const BoxDecoration(
                    color: Color(0xFF015AC2),
                  ),
                  child: Column(
                    children: [
                      SafeArea(
                        child: profileAppBar(),
                      ),
                      SizedBox(height: heightSize(13)),
                      profileData(name, image, nickname, description, followers,
                          following, postNumber),
                    ],
                  ),
                ),
                SizedBox(height: heightSize(20)),
                Row(
                  children: [
                    buttonsWidget(context, heightSize(36), constraints.maxWidth,
                        "Message", const Color(0xFF28282C), 10, () {}),
                    SizedBox(width: widthSize(16)),
                    buttonsWidget(context, heightSize(36), constraints.maxWidth,
                        "Follow", highlightColor, 10, () {}),
                  ],
                ),
                SizedBox(height: heightSize(24)),
                selectViewProfile(context, constraints.maxWidth),
              ],
            ),
          );
        },
      ),
    );
  }
}
