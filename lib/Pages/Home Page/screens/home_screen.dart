// ignore_for_file: must_be_immutable, deprecated_member_use, invalid_use_of_protected_member

import 'package:duwith_social/Pages/Home%20Page/components/home_airdrop.dart';
import 'package:duwith_social/Pages/Home%20Page/components/home_appBar.dart';
import 'package:duwith_social/Pages/Home%20Page/components/home_components.dart';
import 'package:duwith_social/Pages/Home%20Page/components/home_for_you.dart';
import 'package:duwith_social/Pages/Home%20Page/components/home_news.dart';
import 'package:duwith_social/Pages/Home%20Page/components/home_quiz.dart';
import 'package:duwith_social/Pages/Home%20Page/components/home_videos.dart';
import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:duwith_social/common/custom-nav-bar.dart';
import 'package:duwith_social/common/shimmer_loading_widget.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';
import '../../../Services/Ads Service/unity_ads_manager.dart';
import '../../../common/custom-text.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController homeController = HomeController.instance;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        bottomNavigationBar: const CustomNavBarWidget(),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: SafeArea(
                child: Obx(() {
                  return RefreshIndicator(
                    onRefresh: () async {
                      await homeController.fetchPosts();
                      await homeController.fetchNews();
                      await homeController.fetchvideos();
                      await homeController.fetchAirdrops();
                    },
                    child: SizedBox(
                      child: Column(
                        children: [
                          homeAppBar(constraints.maxWidth),
                          selectHomeView(context, constraints.maxWidth),
                          SizedBox(height: heightSize(5)),
                          UnityBannerAd(
                            placementId: AdManager.bannerAdPlacementId,
                            onLoad: (placementId) =>
                                print('Banner loaded: $placementId'),
                            onClick: (placementId) =>
                                print('Banner clicked: $placementId'),
                            onShown: (placementId) =>
                                print('Banner shown: $placementId'),
                            onFailed: (placementId, error, message) => print(
                                'Banner Ad $placementId failed: $error $message'),
                          ),
                          SizedBox(height: heightSize(13)),
                          if (homeController.viewBarOption.value == 0)
                            homeController.homeloading.value == true
                                ? ShimmerLoadingWidget(
                                    width: constraints.maxWidth)
                                : homeController.postList.value.isEmpty
                                    ? const Center(
                                        child: CText(
                                          text:
                                              "Unable to get the Posts, check internet connection and try again",
                                          size: 12,
                                          color: timeColor,
                                          fontFamily: UsedFonts.poppins,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    : forYouList(
                                        context,
                                        constraints.maxWidth,
                                      ),
                          if (homeController.viewBarOption.value == 1)
                            homeController.homeloading.value == true
                                ? ShimmerLoadingWidget(
                                    width: constraints.maxWidth)
                                : homeController.postListVideo.value.isEmpty
                                    ? const Center(
                                        child: CText(
                                          text:
                                              "Unable to get the Posts, check internet connection and try again",
                                          size: 12,
                                          color: timeColor,
                                          fontFamily: UsedFonts.poppins,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    : videosHome(
                                        context,
                                        constraints.maxWidth,
                                      ),
                          if (homeController.viewBarOption.value == 2)
                            homeController.homeloading.value == true
                                ? ShimmerLoadingWidget(
                                    width: constraints.maxWidth)
                                : homeController.newsUpdateList.value.isEmpty
                                    ? const Center(
                                        child: CText(
                                          text:
                                              "Unable to get the Posts, check internet connection and try again",
                                          size: 12,
                                          color: timeColor,
                                          fontFamily: UsedFonts.poppins,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    : newsList(context, constraints.maxWidth),
                          if (homeController.viewBarOption.value == 3)
                            homeController.homeloading.value == true
                                ? ShimmerLoadingWidget(
                                    width: constraints.maxWidth)
                                : homeController.airdropList.value.isEmpty
                                    ? const Center(
                                        child: CText(
                                          text:
                                              "Unable to get the Posts, check internet connection and try again",
                                          size: 12,
                                          color: timeColor,
                                          fontFamily: UsedFonts.poppins,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    : AirdropListWidget(
                                        width: constraints.maxWidth),
                          if (homeController.viewBarOption.value == 4)
                            homeController.homeloading.value == true
                                ? ShimmerLoadingWidget(
                                    width: constraints.maxWidth)
                                : homeController.mainquizList.value.isEmpty
                                    ? const Center(
                                        child: CText(
                                          text:
                                              "Unable to get the Quiz, check internet connection and try again",
                                          size: 12,
                                          color: timeColor,
                                          fontFamily: UsedFonts.poppins,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    : quizListWidget(
                                        context, constraints.maxWidth)
                        ],
                      ),
                    ),
                  );
                }),
              ),
            );
          },
        ),
      ),
    );
  }
}
