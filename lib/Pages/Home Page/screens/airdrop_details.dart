// ignore_for_file: invalid_use_of_protected_member, must_be_immutable

import "package:cached_network_image/cached_network_image.dart";
import "package:duwith_social/common/button-widget.dart";
import "package:duwith_social/models/airdrop_model.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get/get.dart";

import "package:url_launcher/url_launcher.dart";

import "../../../common/custom-text.dart";
import "../../../common/getxmessage.dart";
import "../../../utils/color.dart";
import "../../Auth Page/controller/auth_controller.dart";
import "../../Auth Page/services/socket_sevice.dart";
import "../components/comments_replies_display.dart";
import "../controllers/home_controller.dart";

class AirdropDetailsScreen extends StatelessWidget {
  AirdropModel airdropDetails;
  AirdropDetailsScreen({
    super.key,
    required this.airdropDetails,
  });

  HomeController homeController = HomeController.instance;

  SocketService socket = SocketService.instance;

  AuthController authController = AuthController.instance;

  @override
  Widget build(BuildContext context) {
    RxBool userLiked = airdropDetails.likes
        .any((interaction) =>
            interaction.user == authController.userdata.value.id)
        .obs;
    RxBool userDisliked = airdropDetails.dislikes
        .any((interaction) =>
            interaction.user == authController.userdata.value.id)
        .obs;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Obx(() {
              return SafeArea(
                  child: SizedBox(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: widthSize(20), vertical: heightSize(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        backbutton(onTap: () => Get.back()),
                        SizedBox(height: heightSize(20)),
                        Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: airdropDetails.media.single.url,
                              placeholder: (context, url) => Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                      height: heightSize(30),
                                      width: widthSize(30),
                                      child:
                                          const CircularProgressIndicator())),
                              imageBuilder: (context, imageprovider) {
                                return Container(
                                  height: heightSize(20),
                                  width: widthSize(20),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      image: DecorationImage(
                                          image: imageprovider,
                                          fit: BoxFit.fill)),
                                );
                              },
                            ),
                            SizedBox(width: widthSize(10)),
                            CText(
                              text: truncate(airdropDetails.title, length: 7),
                              size: 15,
                              color: textColor,
                              height: 0.8,
                              fontFamily: UsedFonts.stalinistOne,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        SizedBox(height: heightSize(20)),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: widthSize(10),
                              vertical: heightSize(10)),
                          decoration: BoxDecoration(
                            color: buttonColor2,
                            borderRadius: BorderRadius.all(
                                Radius.circular(widthSize(20))),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CText(
                                text: "Description",
                                size: 18,
                                color: const Color(0xFFECECEC),
                                fontFamily: UsedFonts.blackhan,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(height: heightSize(10)),
                              CText(
                                text: airdropDetails.title,
                                size: 15,
                                color: const Color(0xFFECECEC),
                                fontFamily: UsedFonts.archivo,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(height: heightSize(10)),
                              CText(
                                text: airdropDetails.caption,
                                size: 13,
                                color: const Color(0xFFECECEC),
                                fontFamily: UsedFonts.poppins,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: heightSize(20)),
                        ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: airdropDetails.activities.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return SizedBox(
                                child: Column(
                                  children: [
                                    Container(
                                      height: heightSize(70),
                                      width: constraints.maxWidth,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: widthSize(10),
                                          vertical: heightSize(10)),
                                      decoration: BoxDecoration(
                                          color: navbarColor2,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(widthSize(10)))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl:
                                                airdropDetails.media.single.url,
                                            placeholder: (context, url) => Align(
                                                alignment: Alignment.center,
                                                child: SizedBox(
                                                    height: heightSize(50),
                                                    width: widthSize(50),
                                                    child:
                                                        const CircularProgressIndicator())),
                                            imageBuilder:
                                                (context, imageprovider) {
                                              return Container(
                                                height: heightSize(20),
                                                width: widthSize(20),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    image: DecorationImage(
                                                        image: imageprovider,
                                                        fit: BoxFit.fill)),
                                              );
                                            },
                                          ),
                                          SizedBox(width: widthSize(9)),
                                          Expanded(
                                            child: CText(
                                              text: airdropDetails
                                                  .activities[index],
                                              textAlign: TextAlign.left,
                                              size: 15,
                                              color: navbarColor,
                                              fontFamily: UsedFonts.poppins,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: heightSize(15))
                                  ],
                                ),
                              );
                            }),
                        SizedBox(height: heightSize(10)),
                        Row(
                          children: [
                            const CText(
                              text: "Reward: ",
                              size: 18,
                              color: textColor,
                              fontFamily: UsedFonts.poppins,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(width: widthSize(10)),
                            Container(
                              height: heightSize(20),
                              width: widthSize(100),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(widthSize(15))),
                                  color: Color.fromARGB(255, 146, 182, 223)),
                              child: const CText(
                                text: "50 Points",
                                size: 12,
                                color: textColor,
                                fontFamily: UsedFonts.poppins,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: heightSize(30)),
                        buttonsWidget(context, heightSize(50),
                            constraints.maxWidth, "Claim", mainColor, 18, () {
                          final website = Uri.parse(airdropDetails.airdropLink);
                          // External App
                          launchUrl(website,
                              mode: LaunchMode.externalApplication);
                          // In App Webview
                          // launchUrl(website, mode: LaunchMode.inAppBrowserView);
                        }, false, textColor),
                        SizedBox(height: heightSize(30)),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: heightSize(49),
                                width: widthSize(150),
                                padding: EdgeInsets.symmetric(
                                    horizontal: widthSize(20),
                                    vertical: heightSize(10)),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 27, 40, 55),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(widthSize(15)))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        await socket.likeAirdropPost(
                                            airdropDetails.id,
                                            authController.userdata.value.id);
                                      },
                                      child: SizedBox(
                                        height: heightSize(18),
                                        child: Row(
                                          children: [
                                            Icon(
                                              userLiked.value == true
                                                  ? CupertinoIcons.heart_fill
                                                  : FontAwesomeIcons.heart,
                                              size: heightSize(20),
                                              color: userLiked.value
                                                  ? mainColor
                                                  : textColor,
                                            ),
                                            SizedBox(width: widthSize(5)),
                                            CText(
                                                text: homeController
                                                    .engagementShortened(
                                                        airdropDetails
                                                            .likes.length))
                                          ],
                                        ),
                                      ),
                                    ),

                                    VerticalDivider(
                                      width: widthSize(2),
                                      color: Color(0xFF171717),
                                    ),
                                    // dislikes
                                    GestureDetector(
                                      onTap: () async {
                                        await socket.dislikeAirdropPost(
                                            airdropDetails.id,
                                            authController.userdata.value.id);
                                      },
                                      child: SizedBox(
                                        height: heightSize(18),
                                        child: Row(
                                          children: [
                                            Icon(
                                              userDisliked.value == true
                                                  ? Icons.thumb_down_rounded
                                                  : FontAwesomeIcons.thumbsDown,
                                              size: heightSize(20),
                                              color: userDisliked.value == true
                                                  ? Colors.red
                                                  : textColor,
                                            ),
                                            SizedBox(width: widthSize(5)),
                                            CText(
                                                text: homeController
                                                    .engagementShortened(
                                                        airdropDetails
                                                            .dislikes.length))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: heightSize(20)),
                              CText(
                                text:
                                    "Comments ${homeController.commentsAirdrop.length}",
                                size: 18,
                                color: const Color(0xFFBEBEBE),
                                fontFamily: UsedFonts.poppins,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(height: heightSize(20)),
                              ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount:
                                      homeController.commentsAirdrop.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return commentsListView(
                                        context,
                                        constraints.maxWidth,
                                        homeController.commentsAirdrop.value,
                                        homeController.commentsAirdrop
                                            .value[index], () async {
                                      await socket.likeAirdropComment(
                                          homeController
                                              .commentsAirdrop.value[index].id,
                                          authController.userId.value);
                                    });
                                  }),
                              SizedBox(height: heightSize(20)),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: heightSize(60),
                                  width: constraints.maxWidth,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF151B2E),
                                      border: Border.all(color: buttonColor2),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(widthSize(20)))),
                                  padding: EdgeInsets.symmetric(
                                      vertical: heightSize(5),
                                      horizontal: widthSize(8)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          style: TextStyle(
                                              fontFamily: UsedFonts.poppins,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFFB4B4B4),
                                              fontSize: fontSize(14)),
                                          maxLines: 5,
                                          controller:
                                              homeController.commentsText,
                                          textInputAction: TextInputAction.done,
                                          decoration: InputDecoration(
                                            hintText: "Add Comments",
                                            hintStyle: const TextStyle(
                                                color: Color(0xFF918F99)),
                                            filled: true,
                                            fillColor: Color(0xFF151B2E),
                                            border: InputBorder.none,
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color(0xFF1F2138)),
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color(0xFF1F2138)),
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            contentPadding: EdgeInsets.only(
                                                left: widthSize(15),
                                                top: heightSize(4),
                                                right: widthSize(4),
                                                bottom: heightSize(5)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: widthSize(10)),
                                      GestureDetector(
                                          onTap: () async {
                                            if (homeController.commentsText.text
                                                    .trim() ==
                                                "") {
                                              getErrorSnackBar(
                                                  "you have to input a message to comment");
                                            } else {
                                              homeController
                                                  .isCommenting.value = true;
                                              final data = {
                                                "post": airdropDetails.id,
                                                "user": authController
                                                    .userdata.value.id,
                                                "content": homeController
                                                    .commentsText.text
                                                    .trim(),
                                                "parentComment":
                                                    homeController.isReply.value
                                                        ? homeController
                                                            .parentCommentId
                                                            .value
                                                        : null,
                                              };
                                              await socket
                                                  .addAirdropComment(data);
                                              await socket
                                                  .getCommentByAirdropId(
                                                      airdropDetails.id);
                                              homeController.commentsText.text =
                                                  "";
                                            }
                                          },
                                          child: homeController
                                                      .isCommenting.value ==
                                                  true
                                              ? Container(
                                                  height: heightSize(50),
                                                  width: widthSize(50),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: widthSize(10),
                                                      vertical: heightSize(10)),
                                                  alignment: Alignment.center,
                                                  decoration:
                                                      const ShapeDecoration(
                                                          shape: OvalBorder(),
                                                          color: mainColor),
                                                  child:
                                                      const CircularProgressIndicator(
                                                    color: textColor,
                                                  ))
                                              : Container(
                                                  height: heightSize(50),
                                                  width: widthSize(50),
                                                  alignment: Alignment.center,
                                                  decoration:
                                                      const ShapeDecoration(
                                                          shape: OvalBorder(),
                                                          color: mainColor),
                                                  child: Icon(
                                                    Icons.send,
                                                    size: heightSize(30),
                                                    color: textColor,
                                                  ),
                                                )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
            }),
          );
        },
      ),
    );
  }
}
