// ignore_for_file: invalid_use_of_protected_member, must_be_immutable

import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/custom-text.dart';
import '../../../utils/color.dart';
import '../../../utils/demo_data.dart';

class GamesScreen extends StatelessWidget {
  final String title;
  GamesScreen({super.key, required this.title});

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
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
                child: Column(
                  children: [
                    SizedBox(
                      height: heightSize(32),
                      child: Row(
                        children: [
                          backbutton(onTap: () => Get.back()),
                          SizedBox(width: widthSize(131)),
                          CText(
                            text: title,
                            size: 15,
                            color: Color(0xFFE9E9E9),
                            fontFamily: UsedFonts.poppins,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: heightSize(28)),
                    Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Number of items per row
                              crossAxisSpacing:
                                  heightSize(12), // Spacing between columns
                              mainAxisSpacing:
                                  widthSize(15), // Spacing between rows
                              childAspectRatio:
                                  1.0, // Aspect ratio of each item (width / height)
                            ),
                            itemCount: gameslist.value.length,
                            itemBuilder: (context, index) {
                              return gamesWidget(
                                  gameslist.value[index].description,
                                  gameslist.value[index].image);
                            }))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

gamesWidget(String textUsed, String image) {
  return Container(
    height: heightSize(165),
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(
        vertical: heightSize(30), horizontal: widthSize(16)),
    decoration: BoxDecoration(
        color: const Color(0xFF192138),
        borderRadius: BorderRadius.all(Radius.circular(widthSize(15)))),
    child: SizedBox(
      height: heightSize(97),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: heightSize(71),
            width: widthSize(107),
            child: Image.asset(image, fit: BoxFit.contain),
          ),
          CText(
            text: textUsed,
            color: const Color(0xFFD6D6E4),
            textAlign: TextAlign.center,
            size: 11,
            fontFamily: UsedFonts.poppins,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    ),
  );
}
