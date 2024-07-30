// ignore_for_file: must_be_immutable

import 'package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart';
import 'package:duwith_social/Pages/Profile%20Page/components/social_binding_widget.dart';
import 'package:duwith_social/Pages/Profile%20Page/controller/profile_controller.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

import '../../../common/custom-text.dart';
import '../../../common/text-field.dart';
import '../../Auth Page/services/socket_sevice.dart';

ProfileController profileController = ProfileController.instance;
AuthController authController = AuthController.instance;
SocketService socketService = SocketService.instance;

class SocialLinkBindingPage extends StatefulWidget {
  SocialLinkBindingPage({super.key});

  @override
  State<SocialLinkBindingPage> createState() => _SocialLinkBindingPageState();
}

class _SocialLinkBindingPageState extends State<SocialLinkBindingPage> {
  SocketService socketService = SocketService.instance;
  TextEditingController facebook = TextEditingController(
      text: authController.userdata.value.socialMediaLinks.facebook);

  TextEditingController instagram = TextEditingController(
      text: authController.userdata.value.socialMediaLinks.instagram);

  TextEditingController youtube = TextEditingController(
      text: authController.userdata.value.socialMediaLinks.youtube);

  TextEditingController twitter = TextEditingController(
      text: authController.userdata.value.socialMediaLinks.twitter);

  @override
  void dispose() {
    super.dispose();
    facebook.dispose();
    instagram.dispose();
    youtube.dispose();
    twitter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            vertical: heightSize(10), horizontal: widthSize(20)),
        child: buttonsWidget(
            context, heightSize(40), widthSize(200), "Bind Data", mainColor, 18,
            () async {
          profileController.profileLoading.value = true;
          final profiledata = {
            "socialMediaLinks": {
              "facebook": profileController.facebookStored.value,
              "youtube": profileController.youtubeStored.value,
              "instagram": profileController.instagramStored.value,
              "twitter": profileController.twitterStored.value
            }
          };
          await socketService.updateUser(
              authController.userdata.value.id, profiledata);
          profileController.profileLoading.value = false;
        }, false, textColor),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: SafeArea(
              child: Obx(() {
                return LoadingOverlayPro(
                  isLoading: profileController.profileLoading.value,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: heightSize(30),
                        left: widthSize(20),
                        right: widthSize(20)),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: SizedBox(
                        child: Column(
                          children: [
                            socialBindingAppBar(),
                            SizedBox(height: heightSize(35)),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFFA3ABBB)),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(widthSize(10)))),
                              padding: EdgeInsets.symmetric(
                                  vertical: heightSize(14),
                                  horizontal: widthSize(11)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CText(
                                    text: "Know how much  📢🍋😊 ",
                                    size: 15,
                                    color: textColor,
                                    fontFamily: UsedFonts.poppins,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(height: heightSize(5)),
                                  const CText(
                                    text:
                                        "Your opinions shape our community! Whether it’s a stunning photo, a captivating video, or a compelling story, we want to hear from you. Express yourself, inspire others, and make your voice heard. Join the conversation and let your creativity! ",
                                    size: 12,
                                    color: Color(0XFFA3ABBB),
                                    fontFamily: UsedFonts.poppins,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: heightSize(20)),
                            socialParameters(
                                image: "assets/images/Earn/facebook.png",
                                name: "Facebook",
                                parsedValue: facebook,
                                onchanged: (val) {
                                  profileController.facebookStored.value = val!;
                                }),
                            SizedBox(height: heightSize(10)),
                            socialParameters(
                                image: "assets/images/Earn/instagram.png",
                                name: "Instagram",
                                parsedValue: instagram,
                                onchanged: (val) {
                                  profileController.instagramStored.value =
                                      val!;
                                }),
                            SizedBox(height: heightSize(10)),
                            socialParameters(
                                image: "assets/images/Earn/youtube.png",
                                name: "Youtube",
                                parsedValue: youtube,
                                onchanged: (val) {
                                  profileController.youtubeStored.value = val!;
                                }),
                            SizedBox(height: heightSize(10)),
                            socialParameters(
                                image: "assets/images/Earn/twitter.png",
                                name: "Twitter",
                                parsedValue: twitter,
                                onchanged: (val) {
                                  profileController.twitterStored.value = val!;
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }

  socialParameters(
      {required String image,
      required String name,
      required TextEditingController parsedValue,
      required Function(String?)? onchanged}) {
    return SizedBox(
      height: heightSize(120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: heightSize(36),
                width: widthSize(36),
                decoration: BoxDecoration(
                    color: const Color(0xFF343232),
                    borderRadius:
                        BorderRadius.all(Radius.circular(widthSize(19.5)))),
                child: Padding(
                  padding: EdgeInsets.all(widthSize(9)),
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: widthSize(8)),
              Padding(
                padding: EdgeInsets.only(top: heightSize(10)),
                child: CText(
                  text: name,
                  size: 13,
                  color: const Color(0xFF939393),
                  fontFamily: UsedFonts.poppins,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          InputTextField(
              obscureText: false,
              textInputAction: true,
              showPrefixIcon: false,
              controller: parsedValue,
              innerColor: buttonColor2,
              onChanged: onchanged,
              textColor: textColor,
              differentiate: 1),
        ],
      ),
    );
  }
}
