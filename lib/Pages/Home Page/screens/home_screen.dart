// ignore_for_file: must_be_immutable

import 'package:duwith_social/Pages/Home%20Page/components/home_airdrop.dart';
import 'package:duwith_social/Pages/Home%20Page/components/home_appBar.dart';
import 'package:duwith_social/Pages/Home%20Page/components/home_components.dart';
import 'package:duwith_social/Pages/Home%20Page/components/home_for_you.dart';
import 'package:duwith_social/Pages/Home%20Page/components/home_news.dart';
import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:duwith_social/common/shimmer_loading_widget.dart';
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
                return SizedBox(
                  child: Column(
                    children: [
                      homeAppBar(constraints.maxWidth),
                      SizedBox(height: heightSize(13)),
                      selectHomeView(context, constraints.maxWidth),
                      SizedBox(height: heightSize(5)),
                      if (homeController.viewBarOption.value == 0 ||
                          homeController.viewBarOption.value == 1)
                        homeController.homeloading.value
                            ? ShimmerLoadingWidget(width: constraints.maxWidth)
                            : forYouList(
                                context,
                                constraints.maxWidth,
                              ),
                      if (homeController.viewBarOption.value == 2)
                        homeController.homeloading.value
                            ? ShimmerLoadingWidget(width: constraints.maxWidth)
                            : newsList(context, constraints.maxWidth),
                      if (homeController.viewBarOption.value == 3)
                        homeController.homeloading.value
                            ? ShimmerLoadingWidget(width: constraints.maxWidth)
                            : airdropList(context, constraints.maxWidth)
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
