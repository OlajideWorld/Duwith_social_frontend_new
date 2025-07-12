import "package:duwith_social/Pages/Chat%20Page/components/chat_history_widget.dart";
import "package:duwith_social/common/button-widget.dart";
import "package:duwith_social/utils/color.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../utils/sizes.dart";

class ChatHistoryPage extends StatelessWidget {
  const ChatHistoryPage({super.key});

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
                      children: [
                        Row(
                          children: [
                            backbutton(onTap: () => Get.back()),
                            SizedBox(width: constraints.maxWidth / 3.3),
                            Text(
                              "Chat",
                              style: GoogleFonts.poppins(
                                color: textColor,
                                fontSize: fontSize(13),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSize(30)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            statusWidget(
                                Image: "assets/images/chatAdd.png",
                                text: "Add"),
                            statusWidget(
                                Image: "assets/images/Spin/people.png",
                                text: "Marjorie"),
                            statusWidget(
                                Image: "assets/images/Spin/people2.png",
                                text: "Kristin"),
                            statusWidget(
                                Image: "assets/images/Spin/people3.png",
                                text: "Mitchell"),
                            statusWidget(
                                Image: "assets/images/Spin/people.png",
                                text: "Victoria"),
                            statusWidget(
                                Image: "assets/images/Spin/people2.png",
                                text: "Darlene"),
                          ],
                        ),
                        SizedBox(height: heightSize(30)),
                        chatwithPeople(
                            image: "assets/images/Spin/people2.png",
                            width: constraints.maxWidth,
                            nameText: "Gabriel Jons",
                            text:
                                "Kindly remember to bring that book along .....",
                            dayTime: "Tues",
                            testColor: textColor3,
                            number: 3),
                        SizedBox(height: heightSize(10)),
                        chatwithPeople(
                            image: "assets/images/Spin/people3.png",
                            width: constraints.maxWidth,
                            nameText: "Floyd Miles",
                            text: "Typing.....",
                            dayTime: "Mon",
                            testColor: mainColor,
                            number: 1),
                        SizedBox(height: heightSize(10)),
                        chatwithPeople(
                            image: "assets/images/Spin/people.png",
                            width: constraints.maxWidth,
                            nameText: "Marvin McKinney",
                            text: "Chat you later honey",
                            dayTime: "April 13",
                            testColor: textColor3,
                            number: 6),
                        SizedBox(height: heightSize(10)),
                        chatwithPeople(
                            image: "assets/images/Spin/people3.png",
                            width: constraints.maxWidth,
                            nameText: "Guy Hawkins",
                            text:
                                "Kindly remember to bring that book along .....",
                            dayTime: "April 12",
                            testColor: textColor3,
                            number: 1),
                        SizedBox(height: heightSize(10)),
                        chatwithPeople(
                            image: "assets/images/Spin/people2.png",
                            width: constraints.maxWidth,
                            nameText: "Cody Fisher",
                            text: "Hi .....",
                            dayTime: "Mon",
                            testColor: textColor3,
                            number: 1),
                        SizedBox(height: heightSize(10)),
                        chatwithPeople(
                            image: "assets/images/Spin/people.png",
                            width: constraints.maxWidth,
                            nameText: "Leslie Alexander",
                            text:
                                "Kindly remember to bring that book along .....",
                            dayTime: "Mon",
                            testColor: textColor3,
                            number: 1),
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
