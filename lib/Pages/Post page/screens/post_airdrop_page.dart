import "package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart";
import "package:duwith_social/Pages/Post%20page/components/post_airdrop_widgets.dart";
import "package:duwith_social/common/button-widget.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../utils/color.dart";
import "../../../utils/sizes.dart";

// ignore: must_be_immutable
class PostAirdropPage extends StatelessWidget {
  PostAirdropPage({super.key});

  HomeController homeController = HomeController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SafeArea(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                  top: heightSize(20),
                  left: widthSize(20),
                  right: widthSize(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      backbutton(onTap: () => Get.back()),
                      SizedBox(width: constraints.maxWidth / 3.3),
                      Text(
                        "Airdrop",
                        style: GoogleFonts.poppins(
                          color: textColor,
                          fontSize: fontSize(13),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: heightSize(20)),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Eligible users receive the same amount of token",
                      style: GoogleFonts.poppins(
                        color: textColor,
                        fontSize: fontSize(12),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: heightSize(20)),
                  Container(
                    height: heightSize(190),
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 26, 37, 61)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: heightSize(20)),
                        Padding(
                          padding: EdgeInsets.only(
                              left: widthSize(10), right: widthSize(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Token",
                                style: GoogleFonts.poppins(
                                    color: textColor,
                                    fontSize: fontSize(13),
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: widthSize(60),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.help_sharp,
                                      size: heightSize(15),
                                      color: textColor,
                                    ),
                                    Text(
                                      "DOT",
                                      style: GoogleFonts.poppins(
                                          color: textColor,
                                          fontSize: fontSize(13),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: heightSize(15),
                                      color: textColor,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: heightSize(20)),
                        Divider(
                            height: heightSize(3),
                            thickness: 2,
                            color: const Color.fromARGB(255, 26, 37, 61)),
                        LabeledInput(
                          label: "Quantity",
                          hintText: "Enter 0 - 100",
                          controller: homeController.enterquantity,
                        ),
                        Divider(
                            height: heightSize(3),
                            thickness: 2,
                            color: const Color.fromARGB(255, 26, 37, 61)),
                        LabeledInput(
                          label: "Engagment  to distribute",
                          hintText: "0.55 - 6000",
                          controller: homeController.enterDistribution,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: heightSize(20)),
                  Text(
                    "Task",
                    style: GoogleFonts.poppins(
                      color: textColor,
                      fontSize: fontSize(12),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: heightSize(5)),
                  Container(
                    height: heightSize(190),
                    width: constraints.maxWidth,
                    padding: EdgeInsets.only(
                        top: heightSize(20),
                        bottom: heightSize(20),
                        left: widthSize(10),
                        right: widthSize(10)),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 26, 37, 61)),
                      borderRadius: BorderRadius.circular(widthSize(10)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        showTextforTask(
                            constraints.maxWidth,
                            "Post interaction",
                            "Pertispate can earn 10 points for replying to liking, voting, or sharing post",
                            50.0),
                        Divider(
                            height: heightSize(3),
                            thickness: 2,
                            color: const Color.fromARGB(255, 26, 37, 61)),
                        showTextforTask(
                            constraints.maxWidth,
                            "Like interaction",
                            "Pertispate can earn 10 points for replying to liking, voting, or sharing post. yOUR OPINOINS matters alot so do make sure to make it count",
                            70.0),
                      ],
                    ),
                  ),
                  SizedBox(height: heightSize(20)),
                  SizedBox(
                    height: heightSize(91),
                    width: constraints.maxWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Balance: 0 DOT (\$0)",
                          style: GoogleFonts.poppins(
                            color: textColor,
                            fontSize: fontSize(12),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "Total",
                          style: GoogleFonts.poppins(
                            color: textColor,
                            fontSize: fontSize(15),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "The airdrop is valid for 24 hours.  Unclaimed airdrops will be refunded to you within 24 hours after expiration",
                          style: GoogleFonts.poppins(
                            color: textColor,
                            fontSize: fontSize(12),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: heightSize(50)),
                  buttonsWidget(context, heightSize(50), constraints.maxWidth,
                      "Confirm", mainColor, 12, () {}, false, textColor)
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
