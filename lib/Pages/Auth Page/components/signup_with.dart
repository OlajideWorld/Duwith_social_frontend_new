// ignore_for_file: must_be_immutable

import 'package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart';
import 'package:duwith_social/Pages/Auth%20Page/screens/verify_details.dart';
import 'package:duwith_social/Pages/Auth%20Page/services/socket_sevice.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/common/getxmessage.dart';
import 'package:duwith_social/common/text-field.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

import '../../../common/custom-text.dart';
import '../screens/login_screen.dart';

class SignUpWithScreen extends StatelessWidget {
  SignUpWithScreen({super.key});

  AuthController authController = AuthController.instance;
  SocketService socket = SocketService.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Obx(() {
              return SafeArea(
                child: LoadingOverlayPro(
                  isLoading: socket.isloading.value,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: widthSize(30), vertical: heightSize(20)),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: backbutton(onTap: () => Get.back()),
                        ),
                        SizedBox(height: heightSize(17)),
                        const CText(
                          text: "DUWITH SOCIAL",
                          size: 15,
                          fontFamily: UsedFonts.stalinistOne,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(height: heightSize(70)),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: widthSize(40)),
                          child: InputTextField(
                              prefixIcon: authController.hintIcon.value,
                              obscureText: false,
                              showPrefixIcon: true,
                              controller: authController.signupOption,
                              innerColor: buttonColor2,
                              hintText: authController.hintText.value,
                              textColor: textColor,
                              differentiate: 1),
                        ),
                        SizedBox(height: heightSize(32)),
                        SizedBox(
                          height: heightSize(22),
                          width: widthSize(260),
                          child: Row(
                            children: [
                              Icon(
                                Icons.check_circle_outline_outlined,
                                size: heightSize(20),
                                color: textColor,
                              ),
                              SizedBox(width: widthSize(5)),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CText(
                                    text:
                                        "By continuing you’ve agreed with our",
                                    color: textColor3,
                                    size: 11,
                                    fontFamily: UsedFonts.poppins,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  CText(
                                    text: "terms and conditions",
                                    size: 11,
                                    color: highlightColor,
                                    fontFamily: UsedFonts.poppins,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: heightSize(18)),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: widthSize(40)),
                          child: buttonsWidget(
                              context,
                              heightSize(50),
                              constraints.maxWidth,
                              "Continue",
                              mainColor,
                              12, () async {
                            final data = {
                              "email": authController.signupOption.text.trim()
                            };

                            final data2 = {
                              "phoneNumber":
                                  authController.signupOption.text.trim()
                            };

                            if (authController.signupOption.text.trim() == "") {
                              getErrorSnackBar(
                                  "Please enter the required data");
                            } else {
                              if (authController.optionUsed.value == 1) {
                                if (EmailValidator.validate(
                                    authController.signupOption.text.trim())) {
                                  socket.isloading.value = true;
                                  socket.createUser(data);
                                  socket.isloading.value = false;
                                  Get.to(() => VerifyCredentials());
                                }
                              } else if (authController.optionUsed.value == 3) {
                                socket.isloading.value = true;
                                socket.createUser(data2);
                                socket.isloading.value = false;
                                Get.to(() => VerifyCredentials());
                              }
                            }
                          }, false, Colors.white),
                        ),
                        SizedBox(height: heightSize(115)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CText(
                              text: "Already have an account?",
                              fontFamily: UsedFonts.poppins,
                              fontWeight: FontWeight.w400,
                              size: 12,
                              color: textColor,
                            ),
                            CText(
                              onClick: () => Get.to(() => LoginScreen()),
                              text: "Sign in",
                              fontFamily: UsedFonts.poppins,
                              fontWeight: FontWeight.w600,
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
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
