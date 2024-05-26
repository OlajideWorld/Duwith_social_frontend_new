// ignore_for_file: must_be_immutable

import 'package:duwith_social/Pages/Auth%20Page/components/login_with.dart';
import 'package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart';
import 'package:duwith_social/Pages/Auth%20Page/screens/signup_screen.dart';
import 'package:duwith_social/Pages/Auth%20Page/services/socket_connection2.dart';
import 'package:duwith_social/Pages/Auth%20Page/services/socket_sevice.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:get/get.dart';

import '../../../common/custom-text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  AuthController authController = AuthController.instance;

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
                  padding: EdgeInsets.only(
                      bottom: heightSize(20),
                      top: constraints.maxHeight * 0.2,
                      left: widthSize(65),
                      right: widthSize(65)),
                  child: authController.isloading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: mainColor,
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CText(
                              text: "DUWITH SOCIAL",
                              size: 15,
                              fontFamily: UsedFonts.stalinistOne,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(height: heightSize(55)),
                            SizedBox(
                              height: heightSize(58),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const CText(
                                    text: "Let's Get You Back In!",
                                    fontFamily: UsedFonts.poppins,
                                    size: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(
                                    width: widthSize(200),
                                    child: const CText(
                                      text:
                                          "Log in to reconnect with your friends and discover new content.",
                                      fontFamily: UsedFonts.poppins,
                                      textAlign: TextAlign.center,
                                      size: 11,
                                      color: textColor3,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: heightSize(46)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                socialMedia(FontAwesomeIcons.google),
                                SizedBox(width: widthSize(9.5)),
                                socialMedia(FontAwesomeIcons.facebookF),
                              ],
                            ),
                            SizedBox(height: heightSize(46)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: widthSize(120),
                                  child: Divider(
                                    height: heightSize(3),
                                    thickness: 1,
                                    color: Color(0xFF3C3C3C),
                                  ),
                                ),
                                SizedBox(width: widthSize(10)),
                                const CText(
                                  text: "Or",
                                  fontFamily: UsedFonts.poppins,
                                  fontWeight: FontWeight.w400,
                                  color: textColor,
                                ),
                                SizedBox(width: widthSize(10)),
                                SizedBox(
                                  width: widthSize(120),
                                  child: Divider(
                                      height: heightSize(3),
                                      thickness: 1,
                                      color: Color(0xFF3C3C3C)),
                                ),
                              ],
                            ),
                            SizedBox(height: heightSize(24)),
                            buttonsWidget2(
                                context,
                                heightSize(45),
                                constraints.maxWidth,
                                "Sign in with Email and phone",
                                Icons.email_rounded,
                                mainColor,
                                Colors.white, () async {
                              Get.to(() => const LoginWithScreen());
                              // authController.isloading.value = true;

                              // final data = {"email": "wallaceian007@gmail.com"};
                              // await Future.delayed(
                              //     const Duration(seconds: 5), () {});
                              // SocketService().createUser(data);
                              // authController.isloading.value = false;
                            }, false),
                            SizedBox(height: heightSize(16)),
                            buttonsWidget2(
                                context,
                                heightSize(45),
                                constraints.maxWidth,
                                "Sign up with wallet",
                                Icons.wallet_outlined,
                                buttonColor2,
                                textColor,
                                () {},
                                false),
                            SizedBox(height: heightSize(20)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CText(
                                  text: "Don’t have an account?",
                                  fontFamily: UsedFonts.poppins,
                                  fontWeight: FontWeight.w600,
                                  size: 12,
                                  color: textColor,
                                ),
                                CText(
                                  onClick: () => Get.to(() => SignUpScreen()),
                                  text: "Sign up",
                                  fontFamily: UsedFonts.poppins,
                                  fontWeight: FontWeight.w400,
                                  size: 12,
                                  color: mainColor,
                                ),
                              ],
                            ),
                            const Spacer(),
                            const CText(
                              text: "Powered by DUWITH",
                              fontFamily: UsedFonts.poppins,
                              fontWeight: FontWeight.w400,
                              size: 11,
                              color: textColor3,
                            ),
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

  socialMedia(IconData icon) {
    return Container(
        height: heightSize(38),
        width: widthSize(38),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xFF3A3A3C),
          borderRadius: BorderRadius.all(Radius.circular(widthSize(20))),
        ),
        child: Icon(
          icon,
          size: heightSize(16),
          color: textColor,
        ));
  }
}
