// ignore_for_file: invalid_use_of_protected_member

import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:duwith_social/Pages/Post%20page/components/post_content_widget.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/custom-text.dart';

class PostImageVideosScreen extends StatelessWidget {
  PostImageVideosScreen({super.key});

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
              padding: EdgeInsets.symmetric(
                  horizontal: widthSize(20), vertical: heightSize(30)),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  child: Column(
                    children: [
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            backbutton(onTap: () => Get.back()),
                            const CText(
                              text: "Post",
                              size: 13,
                              color: textColor,
                              fontFamily: UsedFonts.poppins,
                              fontWeight: FontWeight.w600,
                            ),
                            buttonsWidget(
                                context,
                                heightSize(30),
                                widthSize(87),
                                "Publish",
                                mainColor,
                                12,
                                () {},
                                false,
                                Colors.white),
                          ],
                        ),
                      ),
                      SizedBox(height: heightSize(34)),
                      writeOpinions(constraints.maxWidth),
                      SizedBox(height: heightSize(34)),
                      SizedBox(
                        height: heightSize(190),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(left: widthSize(13)),
                                child: Container(
                                  height: heightSize(190),
                                  width: widthSize(170),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(widthSize(10))),
                                      image: DecorationImage(
                                          image: AssetImage(homeController
                                              .postDatasPost
                                              .value[index]
                                              .image))),
                                ),
                              );
                            }),
                      ),
                      SizedBox(height: heightSize(16)),
                      Padding(
                        padding: EdgeInsets.only(right: widthSize(15)),
                        child: SizedBox(
                          height: heightSize(180),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CText(
                                text: "Select your post category",
                                size: 12,
                                color: Color(0xFFA7AEB8),
                                fontFamily: UsedFonts.poppins,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: heightSize(150),
                                child: Wrap(
                                  spacing: widthSize(6),
                                  runSpacing: heightSize(8),
                                  children: [
                                    SelectTags(name: "Nature"),
                                    SelectTags(name: "Travels"),
                                    SelectTags(name: "Pest & Animals"),
                                    SelectTags(name: "Events"),
                                    SelectTags(name: "Quotes"),
                                    SelectTags(name: "Books"),
                                    SelectTags(name: "Music"),
                                    SelectTags(name: "Tech"),
                                    SelectTags(name: "Gadgets"),
                                    SelectTags(name: "Fitness"),
                                    SelectTags(name: "Adventures"),
                                    SelectTags(name: "Food"),
                                    SelectTags(name: "Fashion"),
                                    SelectTags(name: "Tech"),
                                    SelectTags(name: "Lifestyles"),
                                    SelectTags(name: "Arts")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: heightSize(16)),
                      postContentSettings(constraints.maxWidth)
                    ],
                  ),
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}
