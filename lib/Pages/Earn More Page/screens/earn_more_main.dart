// ignore_for_file: must_be_immutable

import 'dart:async';
import 'dart:math';

import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:duwith_social/Pages/Earn%20More%20Page/components/daily_target_widget.dart';
import 'package:duwith_social/Pages/Earn%20More%20Page/components/earn_money_component.dart';
import 'package:duwith_social/Pages/Earn%20More%20Page/components/earn_points_Widget.dart';
import 'package:duwith_social/Pages/Earn%20More%20Page/components/earn_tap_widget.dart';
import 'package:duwith_social/Pages/Earn%20More%20Page/controller/earn_controller.dart';
import 'package:duwith_social/common/custom-nav-bar.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/sizes.dart';
import '../../Auth Page/controller/auth_controller.dart';
import '../../Auth Page/services/socket_sevice.dart';

class EarnMorePage extends StatefulWidget {
  const EarnMorePage({super.key});

  @override
  State<EarnMorePage> createState() => _EarnMorePageState();
}

class _EarnMorePageState extends State<EarnMorePage> {
  EarnController earnController = EarnController.instance;
  SocketService socket = SocketService.instance;
  AuthController authController = AuthController.instance;

  @override
  void initState() {
    super.initState();
    earnController.loadFromPrefs().then((_) {
      setState(() {});
      _maybeStartTimer();
    });
  }

  void _maybeStartTimer() {
    // if they haven’t hit the cap yet, start ticking each second
    if (_currentRawCoins < earnController.maxCoins) {
      earnController.timer = Timer.periodic(const Duration(seconds: 1), (_) {
        setState(() {
          // will recompute currentCoins on next build
        });
        if (_currentRawCoins >= earnController.maxCoins) {
          earnController.timer?.cancel();
        }
      });
    }
  }

  double get _currentRawCoins {
    final secs = DateTime.now().difference(earnController.resetTime).inSeconds;
    return earnController.ratePerSec * secs;
  }

  double get currentCoins => min(earnController.maxCoins, _currentRawCoins);

  double get progress => (earnController.maxCoins > 0)
      ? (currentCoins / earnController.maxCoins)
      : 0;

  Future<void> resetCounter() async {
    final now = DateTime.now();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('resetTime', now.millisecondsSinceEpoch);
    setState(() {
      earnController.resetTime = now;
    });
    earnController.timer?.cancel();
    _maybeStartTimer();
  }

  Future<void> updateRateAndMax(double newRate, double newMax) async {
    final prefs = await SharedPreferences.getInstance();
    earnController.ratePerSec = newRate;
    earnController.maxCoins = newMax;
    await prefs.setDouble('ratePerSec', earnController.ratePerSec);
    await prefs.setDouble('maxCoins', earnController.maxCoins);
    setState(() {});
    // (re)start timer if needed
    earnController.timer?.cancel();
    _maybeStartTimer();
  }

  @override
  void dispose() {
    earnController.timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    earnController.width.value = MediaQuery.of(context).size.width;
    final earned = currentCoins;
    final pct = progress;
    return AddToCartAnimation(
      cartKey: earnController.cartkey,
      createAddToCartAnimation: (addtoCart) {
        earnController.runAddtoCartAnimation = addtoCart;
      },
      height: heightSize(30),
      width: widthSize(30),
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Stack(
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.7,
                    width: constraints.maxWidth,
                    child: Opacity(
                      opacity: 0.8,
                      child: Image.asset(
                        "assets/images/Earn/earn_more.png",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  SafeArea(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: widthSize(10),
                            right: widthSize(10),
                            top: heightSize(20),
                            bottom: heightSize(30)),
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              earnMoreMainPageTopBar(),
                              SizedBox(height: heightSize(50)),
                              earnBalanceWidget(),
                              SizedBox(height: heightSize(10)),
                              SizedBox(
                                width: widthSize(244),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Hold for 4s",
                                      style: GoogleFonts.poppins(
                                        fontSize: fontSize(12),
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Obx(() {
                                      return Text(
                                        "Remain (${3 - earnController.holdCount.value})",
                                        style: GoogleFonts.poppins(
                                          fontSize: fontSize(12),
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      );
                                    })
                                  ],
                                ),
                              ),
                              SizedBox(height: heightSize(20)),

                              // SizedBox(
                              //   child: Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       SizedBox(
                              //         child: Column(
                              //           children: [
                              //             earnLuckySpin(constraints.maxWidth),
                              //             SizedBox(height: heightSize(20)),
                              //             GestureDetector(
                              //               onTap: () =>
                              //                   Get.to(() => DailyTaskScreen()),
                              //               child: SizedBox(
                              //                 height: heightSize(60),
                              //                 child: Column(
                              //                   crossAxisAlignment:
                              //                       CrossAxisAlignment.center,
                              //                   mainAxisAlignment:
                              //                       MainAxisAlignment
                              //                           .spaceBetween,
                              //                   children: [
                              //                     SizedBox(
                              //                         height: heightSize(48),
                              //                         width: widthSize(45),
                              //                         child: Image.asset(
                              //                           "assets/images/dailyimage.png",
                              //                           fit: BoxFit.contain,
                              //                         )),
                              //                     const CText(
                              //                       text: "Daily Task",
                              //                       size: 10,
                              //                       fontFamily:
                              //                           UsedFonts.archivo,
                              //                       fontWeight: FontWeight.w500,
                              //                       color: textColor,
                              //                     ),
                              //                   ],
                              //                 ),
                              //               ),
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //       earnSocialMediaWidget(
                              //           context, constraints.maxWidth)
                              // earnMoreExtraWidget(
                              //         const Color(0xFFEB7F15),
                              //         "Enjoy 25,000 points daily",
                              //         "Offer walls",
                              //         "Do more offer to earn cash",
                              //         "assets/images/Earn/earn_more2.png",
                              //         "Offer"),
                              //     ],
                              //   ),
                              // ),
                              EarnTapWidget(
                                  key: UniqueKey(),
                                  addtoCartClick: addtoCartClick,
                                  width: constraints.maxWidth),

                              SizedBox(height: heightSize(20)),
                              earnButtonContainer(
                                context,
                                constraints.maxWidth,
                                pct,
                                earned,
                                () {
                                  showEarnedBottomSheet(
                                      context: context,
                                      width: constraints.maxWidth,
                                      earned: earned,
                                      onpressed: () async {
                                        Get.back();
                                        resetCounter();

                                        var finalEarned = authController
                                                .userdata.value.mainBalance +
                                            earned.toInt();
                                        final model = {
                                          "mainBalance": finalEarned
                                        };
                                        await socket.updateUser(
                                            authController.userdata.value.email,
                                            model);
                                      });
                                },
                              ),
                              SizedBox(height: heightSize(30)),
                              earningPageRowWidgets(
                                  context, constraints.maxWidth),
                            ],
                          ),
                        ),
                      ),
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
      ),
    );
    ;
  }

  void addtoCartClick(GlobalKey widgetKey) async {
    if (earnController.runAddtoCartAnimation != null) {
      await earnController.runAddtoCartAnimation!(widgetKey);
      await earnController.cartkey.currentState!
          .runCartAnimation((++earnController.cartQuantity.value).toString());
    }
  }
}
