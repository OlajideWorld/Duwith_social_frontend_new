import 'package:duwith_social/Pages/Home%20Page/components/home_appBar.dart';
import 'package:duwith_social/Pages/Home%20Page/components/home_components.dart';
import 'package:duwith_social/Pages/Home%20Page/components/home_for_you.dart';
import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

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
              child: Obx(() {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
                  child: Column(
                    children: [
                      homeAppBar(constraints.maxWidth),
                      SizedBox(height: heightSize(13)),
                      selectHomeView(context, constraints.maxWidth),
                      SizedBox(height: heightSize(5)),
                      if (homeController.viewNext.value == 0)
                        forYouList(
                          context,
                          constraints.maxWidth,
                        )
                    ],
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
