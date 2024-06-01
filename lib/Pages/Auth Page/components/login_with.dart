// ignore_for_file: must_be_immutable

import 'package:duwith_social/Pages/Auth%20Page/components/login_select.dart';
import 'package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart';
import 'package:duwith_social/Pages/Auth%20Page/screens/signup_screen.dart';
import 'package:duwith_social/Pages/Auth%20Page/services/socket_sevice.dart';
import 'package:duwith_social/common/getxmessage.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

import '../../../common/button-widget.dart';
import '../../../common/custom-text.dart';
import '../../../common/text-field.dart';
import '../screens/verify_details.dart';

class LoginWithScreen extends StatelessWidget {
  LoginWithScreen({super.key});

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
            child: SafeArea(
              child: Obx(() {
                return LoadingOverlayPro(
                  isLoading: socket.isloading.value,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
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
                        SizedBox(height: heightSize(39)),
                        selectLoginOption(context, constraints.maxWidth),
                        SizedBox(height: heightSize(43)),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: widthSize(20)),
                          child: InputTextField(
                              prefixIcon: authController.loginprefixIcon.value,
                              obscureText: false,
                              textInputAction: true,
                              showPrefixIcon: true,
                              controller: authController.isEmail.value == true
                                  ? authController.email
                                  : authController.phoneNumber,
                              innerColor: buttonColor2,
                              hintText: authController.loginhint.value,
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
                              EdgeInsets.symmetric(horizontal: widthSize(20)),
                          child: buttonsWidget(
                              context,
                              heightSize(50),
                              constraints.maxWidth,
                              "Continue",
                              mainColor,
                              12, () async {
                            if (authController.email.text.trim() == "" &&
                                authController.phoneNumber.text.trim() == "") {
                              getErrorSnackBar(
                                  "Please you have to input your email or phone number");
                            } else {
                              if (authController.isEmail.value == true) {
                                if (EmailValidator.validate(
                                    authController.email.text.trim())) {
                                  socket.isloading.value = true;
                                  socket.getUserData(
                                      authController.email.text.trim());

                                  await Future.delayed(
                                      const Duration(seconds: 5), () {});

                                  if (authController.userdata.value.email ==
                                      "") {
                                    getErrorSnackBar("NO user found");
                                  }
                                } else {
                                  getErrorSnackBar("Invalid email entered");
                                }
                              } else {
                                socket.isloading.value = true;
                                socket.getUserDataNumber(
                                    authController.phoneNumber.text.trim());
                                if (authController.userdata.value.email == "") {
                                  getErrorSnackBar("NO user found");
                                } else {
                                  final map = {
                                    "email":
                                        authController.userdata.value.email,
                                    "username":
                                        authController.userdata.value.username,
                                    "otp": authController.userdata.value.otp
                                  };
                                  socket.sendEmailOtp(map);
                                }
                              }
                            }
                          }, false, Colors.white),
                        ),
                        SizedBox(height: heightSize(115)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CText(
                              text: "Don’t have an account?",
                              fontFamily: UsedFonts.poppins,
                              fontWeight: FontWeight.w400,
                              size: 12,
                              color: textColor,
                            ),
                            CText(
                              onClick: () => Get.to(() => SignUpScreen()),
                              text: "Sign up",
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
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
