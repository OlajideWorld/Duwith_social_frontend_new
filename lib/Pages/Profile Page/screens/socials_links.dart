// ignore_for_file: must_be_immutable

import 'package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart';
import 'package:duwith_social/Pages/Profile%20Page/components/social_binding_widget.dart';
import 'package:duwith_social/Pages/Profile%20Page/controller/profile_controller.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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

  Future<void> _handlePaste(int type) async {
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    if (data != null && data.text != null) {
      if (type == 1) {
        facebook.text = data.text!;
      } else if (type == 2) {
        instagram.text = data.text!;
      } else if (type == 3) {
        youtube.text = data.text!;
      } else if (type == 4) {
        twitter.text = data.text!;
      }
      // setState(() {
      //   _controller.text = data.text!;
      // });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Clipboard is empty!')),
      );
    }
  }

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
            context, heightSize(50), widthSize(100), "Bind Data", mainColor, 18,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            socialBindingAppBar(),
                            SizedBox(height: heightSize(35)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Verify your socials to start earning ",
                                  style: GoogleFonts.poppins(
                                    fontSize: widthSize(20),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.verified, // built-in verified badge
                                  color: Colors
                                      .blue, // Instagram/Twitter-style blue
                                  size: heightSize(18),
                                ),
                              ],
                            ),
                            SizedBox(height: heightSize(5)),
                            Text(
                              "Lets discover some great places today",
                              style: GoogleFonts.poppins(
                                fontSize: widthSize(15),
                                fontWeight: FontWeight.w500,
                                color: textColor3,
                              ),
                            ),
                            SizedBox(height: heightSize(20)),
                            socialParameters(
                                image: "assets/images/Earn/facebook.png",
                                name: "Facebook.com/",
                                parsedValue: facebook,
                                onchanged: (val) {
                                  profileController.facebookStored.value = val!;
                                },
                                onTap: () => _handlePaste(1)),
                            SizedBox(height: heightSize(10)),
                            socialParameters(
                                image: "assets/images/Earn/instagram.png",
                                name: "Instagram.com",
                                parsedValue: instagram,
                                onchanged: (val) {
                                  profileController.instagramStored.value =
                                      val!;
                                },
                                onTap: () => _handlePaste(2)),
                            SizedBox(height: heightSize(10)),
                            socialParameters(
                                image: "assets/images/Earn/youtube.png",
                                name: "Youtube.com/",
                                parsedValue: youtube,
                                onchanged: (val) {
                                  profileController.youtubeStored.value = val!;
                                },
                                onTap: () => _handlePaste(3)),
                            SizedBox(height: heightSize(10)),
                            socialParameters(
                                image: "assets/images/Earn/twitter.png",
                                name: "x.com/",
                                parsedValue: twitter,
                                onchanged: (val) {
                                  profileController.twitterStored.value = val!;
                                },
                                onTap: () => _handlePaste(4)),
                            // SizedBox(height: heightSize(10)),
                            // socialParameters(
                            //     image: "assets/images/Earn/Telegram.png",
                            //     name: "x.com/",
                            //     parsedValue: twitter,
                            //     onchanged: (val) {
                            //       // profileController.twitterStored.value = val!;
                            //     }),
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
      required Function(String?)? onchanged,
      required VoidCallback onTap}) {
    return Container(
      height: heightSize(60),
      padding: EdgeInsets.symmetric(
          horizontal: widthSize(15), vertical: heightSize(10)),
      decoration: ShapeDecoration(
        color: Color(0xFF151B2E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
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
          SizedBox(width: widthSize(10)),
          Expanded(
            child: TextField(
              style: TextStyle(
                  fontFamily: UsedFonts.poppins,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFB4B4B4),
                  fontSize: fontSize(14)),
              maxLines: 5,
              onChanged: onchanged,
              controller: parsedValue,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: "https://$name",
                hintStyle: const TextStyle(color: Color(0xFF918F99)),
                filled: true,
                fillColor: Color(0xFF151B2E),
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFF151B2E),
                    ),
                    borderRadius: BorderRadius.circular(16)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFF151B2E),
                    ),
                    borderRadius: BorderRadius.circular(16)),
                contentPadding: EdgeInsets.only(
                    left: widthSize(10),
                    top: heightSize(5),
                    right: widthSize(5),
                    bottom: heightSize(5)),
              ),
            ),
          ),
          SizedBox(width: widthSize(10)),
          GestureDetector(
            onTap: onTap,
            child: Text(
              "Paste",
              style: GoogleFonts.inter(
                fontSize: widthSize(15),
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
