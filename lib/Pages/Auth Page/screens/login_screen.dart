// ignore_for_file: must_be_immutable

import 'package:duwith_social/Pages/Auth%20Page/components/login_with.dart';
import 'package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart';
import 'package:duwith_social/Pages/Auth%20Page/screens/signup_screen.dart';
import 'package:duwith_social/Pages/Auth%20Page/services/socket_sevice.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/common/getxmessage.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:get/get.dart';

import '../../../common/custom-text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  AuthController authController = AuthController.instance;
  SocketService socket = SocketService.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      // bottomNavigationBar:
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: SafeArea(
              child: Obx(() {
                return LoadingOverlayPro(
                  isLoading: socket.isloading.value,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: heightSize(20),
                        top: constraints.maxHeight * 0.1,
                        left: widthSize(65),
                        right: widthSize(65)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CText(
                          text: "DUWITH SOCIAL",
                          size: 18,
                          fontFamily: UsedFonts.stalinistOne,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(height: heightSize(150)),
                        SizedBox(
                          height: heightSize(58),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Let's Get You Back In!",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: textColor,
                                  fontSize: fontSize(18),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: widthSize(200),
                                child: Text(
                                  "Log in to reconnect with your friends and discover new content.",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: fontSize(12),
                                    color: textColor3,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: heightSize(24)),
                        buttonsWidget2(
                            context,
                            heightSize(55),
                            constraints.maxWidth,
                            "Login",
                            Icons.email_outlined,
                            mainColor,
                            Colors.white, () async {
                          Get.to(() => LoginWithScreen());
                        }, false),
                        SizedBox(height: heightSize(16)),
                        GestureDetector(
                          onTap: () {
                            getSuccessSnackBarEdit(
                                "Notification", "commig soon");
                          },
                          child: Container(
                            height: heightSize(55),
                            width: widthSize(300),
                            decoration: BoxDecoration(
                              color: Color(0xFF212940),
                              borderRadius: BorderRadius.all(
                                Radius.circular(widthSize(25)),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/googleImage.png",
                                  height: heightSize(14),
                                  width: widthSize(14),
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(width: widthSize(5)),
                                Text(
                                  "Continue with Google",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: textColor,
                                    fontSize: fontSize(12),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: heightSize(20)),
                        buttonsWidget2(
                            context,
                            heightSize(55),
                            constraints.maxWidth,
                            "Sign up",
                            Icons.wallet_outlined,
                            Color(0xFF212940),
                            textColor,
                            () => Get.to(() => SignUpScreen()),
                            false),
                        SizedBox(height: heightSize(150)),
                        SizedBox(
                          width: widthSize(307),
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: fontSize(12),
                                  color: textColor3),
                              children: const [
                                TextSpan(
                                    text:
                                        'By continuing you’ve agreed with our'),
                                TextSpan(
                                  text:
                                      ' Terms of Use, Privacy Policy, Risk Disclosure',
                                  style: TextStyle(color: mainColor),
                                ),
                                TextSpan(text: ' and'),
                                TextSpan(
                                  text: ' Community Guideline.',
                                  style: TextStyle(
                                    color: mainColor,
                                  ),
                                ),
                                // TextSpan(text: '. You can also click on '),
                                // TextSpan(
                                //   text: 'this link',
                                //   style: TextStyle(
                                //       color: Colors.purple,
                                //       decoration: TextDecoration.underline),
                                //   recognizer: TapGestureRecognizer()
                                //     ..onTap = () {
                                //       _launchUrl('https://flutter.dev');
                                //     },
                                // ),
                                // TextSpan(text: ' to visit Flutter’s website.'),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        Center(
                          child: Text(
                            "Powered By DUWITH",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: textColor3,
                              fontSize: fontSize(13),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
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
