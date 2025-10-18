import "package:duwith_social/Pages/Profile%20Page/components/notification_component.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../common/button-widget.dart";
import "../../../utils/color.dart";
import "../../../utils/sizes.dart";

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: widthSize(20),
                      right: widthSize(20),
                      top: heightSize(20)),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        backbutton(onTap: () => Get.back()),
                        SizedBox(height: heightSize(30)),
                        Text(
                          "Taday",
                          style: GoogleFonts.poppins(
                            color: Color(0xFFA3A2A2),
                            fontSize: fontSize(18),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: heightSize(20)),
                        notificationWidget(
                            constraints.maxWidth,
                            "assets/images/Profile/map.png",
                            "New Message 📩",
                            "You have a new message from Olivia"),
                        SizedBox(height: heightSize(20)),
                        notificationWidget(
                            constraints.maxWidth,
                            "assets/images/Profile/closecircle.png",
                            "Comment and like ❤️",
                            "Raphael Olie commented on your post: 'Great photo!'"),
                        SizedBox(height: heightSize(20)),
                        Text(
                          "Yesterday",
                          style: GoogleFonts.poppins(
                            color: Color(0xFFA3A2A2),
                            fontSize: fontSize(18),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: heightSize(20)),
                        notificationWidget(
                            constraints.maxWidth,
                            "assets/images/Profile/tickcircle.png",
                            "Event Reminder 📅",
                            "Don't forget about [Event Name] happening tomorrow!"),
                        SizedBox(height: heightSize(20)),
                        notificationWidget(
                            constraints.maxWidth,
                            "assets/images/Profile/map.png",
                            "Follow: 🌟",
                            "Frank started following you."),
                        SizedBox(height: heightSize(20)),
                        Text(
                          "12 May",
                          style: GoogleFonts.poppins(
                            color: Color(0xFFA3A2A2),
                            fontSize: fontSize(18),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: heightSize(20)),
                        notificationWidget(
                            constraints.maxWidth,
                            "assets/images/Profile/map.png",
                            "Milestone: 🎉",
                            "Congratulations! You’ve reached [Number] followers!"),
                        SizedBox(height: heightSize(20)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
