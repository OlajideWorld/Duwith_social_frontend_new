// ignore_for_file: must_be_immutable

import 'package:duwith_social/Pages/Shop%20Page/components/dog_list.dart';

import 'package:duwith_social/Pages/Shop%20Page/components/jar_list.dart';
import 'package:duwith_social/Pages/Shop%20Page/components/shop_components.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/custom-nav-bar.dart';
import '../../../common/custom-text.dart';
import '../../../utils/sizes.dart';
import '../../Home Page/controllers/home_controller.dart';
import '../../Wallet Page/components/wallet_app_bar.dart';
import '../components/box_list.dart';

class ShoppingMainScreen extends StatelessWidget {
  ShoppingMainScreen({super.key});

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
            child: Stack(
              children: [
                SizedBox(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Obx(() {
                      return Padding(
                        padding: EdgeInsets.only(
                            top: heightSize(30), bottom: heightSize(30)),
                        child: SafeArea(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CText(
                                text: "Shop",
                                size: 13,
                                color: textColor,
                                fontFamily: UsedFonts.poppins,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(height: heightSize(32)),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: shopAppBar(),
                              ),
                              SizedBox(height: heightSize(22)),
                              if (homeController.shoptype.value == 0)
                                showDogList(context),
                              if (homeController.shoptype.value == 1)
                                showJarList(context),
                              if (homeController.shoptype.value == 2)
                                showBoxList(context),
                              SizedBox(height: heightSize(33)),
                              Container(
                                height: heightSize(58),
                                width: constraints.maxWidth,
                                decoration: const BoxDecoration(
                                    color: Color(0xFF121726)),
                                child: selectQuestions(),
                              ),
                              SizedBox(height: heightSize(4)),
                              Container(
                                height: heightSize(230),
                                width: constraints.maxWidth,
                                padding: EdgeInsets.symmetric(
                                    vertical: heightSize(14),
                                    horizontal: widthSize(20)),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF121726),
                                ),
                                child: Column(
                                  children: [
                                    WalletFaqWidget(
                                        width: constraints.maxWidth,
                                        question:
                                            "How do I start streaming live video?",
                                        answer:
                                            "It's important to address common questions and concerns that users may have about the app. Here are some necessary questions to include "),
                                    SizedBox(height: heightSize(12)),
                                    WalletFaqWidget(
                                        width: constraints.maxWidth,
                                        question:
                                            "How do I start streaming live video?",
                                        answer:
                                            "It's important to address common questions and concerns that users may have about the app. Here are some necessary questions to include "),
                                    SizedBox(height: heightSize(12)),
                                    WalletFaqWidget(
                                        width: constraints.maxWidth,
                                        question:
                                            "How do I start streaming live video?",
                                        answer:
                                            "It's important to address common questions and concerns that users may have about the app. Here are some necessary questions to include "),
                                    SizedBox(height: heightSize(12)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomNavBarWidget(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
