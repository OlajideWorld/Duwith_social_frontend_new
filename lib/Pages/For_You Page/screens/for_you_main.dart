import "package:duwith_social/Pages/For_You%20Page/screens/video_player_widget.dart";
import "package:duwith_social/common/custom-nav-bar.dart";
import "package:duwith_social/common/shimmer_loading_widget.dart";
import "package:duwith_social/utils/color.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../Home Page/controllers/home_controller.dart";

class ForYouMainPage extends StatefulWidget {
  const ForYouMainPage({super.key});

  @override
  State<ForYouMainPage> createState() => _ForYouMainPageState();
}

class _ForYouMainPageState extends State<ForYouMainPage> {
  HomeController homeController = HomeController.instance;
  late PageController _pageController;
  int _currentPage = 0;

  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavBarWidget(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Obx(() {
            return homeController.foryouisLoading.value == true
                ? Container(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    decoration: const BoxDecoration(color: mainColor),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(textColor),
                    ),
                  )
                : PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    itemCount: homeController.postListVideo.value.length,
                    onPageChanged: _onPageChanged,
                    itemBuilder: (context, index) {
                      return VideoPlayerWidget(
                          post: homeController.postListVideo.value[index],
                          isActive: index == _currentPage,
                          width: constraints.maxWidth);
                    },
                  );
          });
        },
      ),
    );
  }
}
