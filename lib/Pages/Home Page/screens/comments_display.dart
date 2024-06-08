// ignore_for_file: invalid_use_of_protected_member

import "package:duwith_social/Pages/Home%20Page/components/comments_replies_display.dart";
import "package:duwith_social/utils/demo_data.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:google_mobile_ads/google_mobile_ads.dart";

import "../../../common/custom-text.dart";
import "../../../utils/color.dart";
import "../../../utils/sizes.dart";
import "../controllers/home_controller.dart";

HomeController homeController = HomeController.instance;

showComments(
    BuildContext context, double width, int commentsLength, int repliesLength) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: heightSize(700),
          padding: EdgeInsets.only(
              top: heightSize(15), left: widthSize(20), right: widthSize(20)),
          decoration: BoxDecoration(
            color: const Color(0xFF151B2E),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(widthSize(15)),
                topRight: Radius.circular(widthSize(15))),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: heightSize(3),
                  width: widthSize(127),
                  decoration: BoxDecoration(
                      color: textColor,
                      borderRadius:
                          BorderRadius.all(Radius.circular(widthSize(5)))),
                ),
                SizedBox(height: heightSize(21)),
                SizedBox(
                    height: heightSize(100),
                    width: width,
                    child: AdWidget(ad: homeController.bannerAd!)),
                CText(
                  text: "$commentsLength Comments",
                  size: 14,
                  color: const Color(0xFFBEBEBE),
                  fontFamily: UsedFonts.poppins,
                  fontWeight: FontWeight.w500,
                ),
                commentsListView(width, commentsLength, repliesLength),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
                  child: Row(
                    children: [
                      const Expanded(
                        child: TextField(
                          // controller: _controller,
                          decoration: InputDecoration(
                            labelText: 'Type a comment',
                          ),
                        ),
                      ),
                      Container(
                        height: heightSize(40),
                        width: widthSize(40),
                        alignment: Alignment.center,
                        decoration: const ShapeDecoration(
                            shape: OvalBorder(), color: mainColor),
                        child: IconButton(
                          icon: Icon(
                            Icons.send,
                            size: heightSize(12),
                            color: textColor,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
