// ignore_for_file: must_be_immutable, deprecated_member_use, invalid_use_of_protected_member

import 'package:duwith_social/Pages/Home%20Page/components/home_appBar.dart';
import 'package:duwith_social/Pages/Home%20Page/components/home_components.dart';
import 'package:duwith_social/Pages/Home%20Page/components/home_for_you.dart';

import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:duwith_social/common/custom-nav-bar.dart';
import 'package:duwith_social/common/shimmer_loading_widget.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import '../../../common/custom-text.dart';
import '../../Auth Page/controller/auth_controller.dart';
import '../../Auth Page/services/socket_sevice.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController homeController = HomeController.instance;
  SocketService socket = SocketService.instance;
  AuthController authController = AuthController.instance;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF161925),
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
                      await socket.getUserData2(authController.userEmail.value);
                      // await homeController.fetchNews();
                      await homeController.fetchvideos();
                      await homeController.fetchAirdrops();
                    },
                    child: LoadingOverlayPro(
                      isLoading: homeController.homeloading.value,
                      child: SizedBox(
                        child: Column(
                          children: [
                            homeAppBar(constraints.maxWidth),
                            Container(
                              width: constraints.maxWidth,
                              height: heightSize(20),
                              padding: EdgeInsets.symmetric(
                                  horizontal: widthSize(9)),
                              decoration: const BoxDecoration(
                                color: backgroundColor,
                              ),
                            ),
                            selectHomeView(context, constraints.maxWidth),
                            SizedBox(height: heightSize(10)),
                            // SizedBox(height: heightSize(5)),
                            // UnityBannerAd(
                            //   placementId: AdManager.bannerAdPlacementId,
                            //   onLoad: (placementId) =>
                            //       print('Banner loaded: $placementId'),
                            //   onClick: (placementId) =>
                            //       print('Banner clicked: $placementId'),
                            //   onShown: (placementId) =>
                            //       print('Banner shown: $placementId'),
                            //   onFailed: (placementId, error, message) => print(
                            //       'Banner Ad $placementId failed: $error $message'),
                            // ),
                            // SizedBox(height: heightSize(13)),
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
                              //   homeController.homeloading.value == true
                              //       ? ShimmerLoadingWidget(
                              //           width: constraints.maxWidth)
                              //       :
                              homeController.postListVideo.value.isEmpty
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
                                  : SizedBox(),
                            //           : videosHome(
                            //               context,
                            //               constraints.maxWidth,
                            //             ),
                            if (homeController.viewBarOption.value == 2)
                              // homeController.homeloading.value == true
                              //     ? ShimmerLoadingWidget(
                              //         width: constraints.maxWidth)
                              //     :
                              homeController.newsUpdateList.value.isEmpty
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
                                  : SizedBox(),
                            //: newsList(context, constraints.maxWidth),
                            if (homeController.viewBarOption.value == 3)
                              // homeController.homeloading.value == true
                              //     ? ShimmerLoadingWidget(
                              //         width: constraints.maxWidth)
                              //     :
                              homeController.airdropList.value.isEmpty
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
                                  : SizedBox(),
                            //  AirdropListWidget(
                            //     width: constraints.maxWidth),
                            if (homeController.viewBarOption.value == 4)
                              // homeController.homeloading.value == true
                              //     ? ShimmerLoadingWidget(
                              //         width: constraints.maxWidth)
                              //     :
                              homeController.mainquizList.value.isEmpty
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
                                  : SizedBox()
                            // quizListWidget(
                            //     context, constraints.maxWidth)
                          ],
                        ),
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
