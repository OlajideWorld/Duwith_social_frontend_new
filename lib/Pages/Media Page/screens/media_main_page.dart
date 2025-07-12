import "package:duwith_social/Pages/Media%20Page/components/media_widget.dart";
import "package:duwith_social/utils/color.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../common/custom-nav-bar.dart";
import "../../../common/text-field.dart";
import "../../Home Page/controllers/home_controller.dart";
import "../components/media_list_widget.dart";
import "../components/media_video_player.dart";

class MediaMainPage extends StatelessWidget {
  MediaMainPage({super.key});

  HomeController homeController = HomeController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavBarWidget(),
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Column(
              children: [
                SizedBox(height: heightSize(50)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
                  child: SizedBox(
                    height: heightSize(40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: widthSize(350),
                          child: const InputTextField(
                              showPrefixIcon: true,
                              prefixIcon: Icons.search,
                              obscureText: false,
                              innerColor: Color(0xFF1A2137),
                              hintText: "Search",
                              textColor: textColor,
                              differentiate: 1),
                        ),
                        SizedBox(
                          height: heightSize(20),
                          width: widthSize(20),
                          child: Image.asset(
                            'assets/images/Home/add-square.png',
                            fit: BoxFit.contain,
                            // color: homeController.viewBarOption.value == 1
                            //     ? const Color(0xFFECECEC)
                            //     : textColor3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: heightSize(30)),
                mediaPageSelectOption(context, constraints.maxWidth),
                SizedBox(height: heightSize(20)),
                Expanded(
                    child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      mediaListWidget(context, constraints.maxWidth),
                      Padding(
                        padding: EdgeInsets.only(left: widthSize(10)),
                        child: Text(
                          "Exclusive Originals",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: textColor,
                            fontSize: fontSize(15),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: heightSize(10)),
                      mediaPageListViewWidget(context, constraints.maxWidth),
//                       //
                      // New Releases

                      Padding(
                        padding: EdgeInsets.only(left: widthSize(10)),
                        child: Text(
                          "New Releases",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: textColor,
                            fontSize: fontSize(15),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: heightSize(10)),
                      mediaPageListViewWidget2(context, constraints.maxWidth),
// //
// Romance
                      Padding(
                        padding: EdgeInsets.only(left: widthSize(10)),
                        child: Text(
                          "Romance",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: textColor,
                            fontSize: fontSize(15),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: heightSize(10)),
                      mediaPageListViewWidget3(context, constraints.maxWidth),
//                       //
                      // Marriage

                      Padding(
                        padding: EdgeInsets.only(left: widthSize(10)),
                        child: Text(
                          "Marriage",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: textColor,
                            fontSize: fontSize(15),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: heightSize(10)),
                      mediaPageListViewWidget4(context, constraints.maxWidth)
                    ],
                  ),
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}
