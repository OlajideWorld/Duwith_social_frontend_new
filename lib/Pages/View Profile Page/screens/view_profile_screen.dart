// ignore_for_file: must_be_immutable

import 'package:duwith_social/Pages/Auth%20Page/components/login_select.dart';
import 'package:duwith_social/Pages/View%20Profile%20Page/components/profile_appBar.dart';
import 'package:duwith_social/Pages/View%20Profile%20Page/components/view_profie_list.dart';
import 'package:duwith_social/Pages/View%20Profile%20Page/components/view_profile_slide.dart';
import 'package:duwith_social/Pages/View%20Profile%20Page/components/view_profile_stories.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Home Page/controllers/home_controller.dart';

class ViewProfileScreen extends StatelessWidget {
  final String name;
  final String image;
  final String nickname;
  final String description;
  final String followers;
  final String following;
  final String postNumber;
  ViewProfileScreen(
      {super.key,
      required this.name,
      required this.image,
      required this.nickname,
      required this.description,
      required this.followers,
      required this.following,
      required this.postNumber});

  HomeController homeController = HomeController.instance;
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
              return SizedBox(
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
                          Padding(
                            padding: const EdgeInsets.only(top: 45.0),
                            child: profileAppBar(),
                          ),
                          SizedBox(height: heightSize(13)),
                          profileData(name, image, nickname, description,
                              followers, following, postNumber),
                        ],
                      ),
                    ),
                    Container(
                      height: heightSize(130),
                      width: constraints.maxWidth,
                      decoration: const BoxDecoration(color: Color(0xFF28282C)),
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
                          selectViewProfile(context, constraints.maxWidth),
                        ],
                      ),
                    ),
                    SizedBox(height: heightSize(19)),
                    if (homeController.viewprofileslide.value == 0)
                      viewProfilePostList(context, constraints.maxWidth),
                    if (homeController.viewprofileslide.value == 1)
                      viewProfileStoriesList(context),
                    if (homeController.viewprofileslide.value == 2)
                      viewProfileVideosList(context)
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
