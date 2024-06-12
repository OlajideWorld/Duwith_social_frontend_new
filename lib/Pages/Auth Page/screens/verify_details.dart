// ignore_for_file: must_be_immutable

import 'package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart';
import 'package:duwith_social/Pages/Auth%20Page/screens/verify_success.dart';
import 'package:duwith_social/common/getxmessage.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/get_storage.dart';
import 'package:duwith_social/utils/get_user_key.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../common/button-widget.dart';
import '../../../common/custom-text.dart';

class VerifyCredentials extends StatelessWidget {
  VerifyCredentials({super.key});

  TextEditingController otp = TextEditingController();

  AuthController authController = AuthController.instance;

  final focusNode = FocusNode();

  final defaultPinTheme = PinTheme(
    width: widthSize(42.75),
    height: heightSize(60),
    textStyle: TextStyle(
      fontSize: fontSize(28),
      fontFamily: UsedFonts.poppins,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      height: 1.07,
    ),
    decoration: BoxDecoration(
      // borderRadius: BorderRadius.circular(8),
      border: Border.all(color: buttonColor2),
    ),
  );

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
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: widthSize(30), vertical: heightSize(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: backbutton(onTap: () => Get.back()),
                    ),
                    SizedBox(height: heightSize(40)),
                    SizedBox(
                      height: heightSize(102),
                      width: widthSize(102),
                      child: Image.asset(
                        "assets/images/social-message.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: heightSize(29)),
                    const CText(
                      text: "Verify your account",
                      fontFamily: UsedFonts.poppins,
                      size: 17,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: heightSize(10)),
                    const CText(
                      text:
                          "Input the code sent to your email address for confirmation of your account",
                      fontFamily: UsedFonts.poppins,
                      textAlign: TextAlign.center,
                      color: textColor3,
                      size: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: heightSize(50)),
                    Center(
                      child: Pinput(
                        length: 6,
                        controller: otp,
                        // controller: _controller,
                        focusNode: focusNode,
                        androidSmsAutofillMethod:
                            AndroidSmsAutofillMethod.smsUserConsentApi,
                        listenForMultipleSmsOnAndroid: true,
                        defaultPinTheme: defaultPinTheme,
                        separatorBuilder: (index) =>
                            SizedBox(width: widthSize(10)),
                        validator: (value) {
                          // return value;
                          return null;
                        },
                        hapticFeedbackType: HapticFeedbackType.lightImpact,
                        onCompleted: (pin) {
                          debugPrint('onCompleted: $pin');
                        },
                        onChanged: (value) {
                          debugPrint('onChanged: $value');
                        },
                        // cursor: Column(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Container(
                        //       margin: EdgeInsets.only(bottom: heightSize(10)),
                        //       width: 10,
                        //       height: 10,
                        //       color: PinCodeSignInScreen.focusedBorderColor,
                        //     ),
                        //   ],
                        // ),
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            // borderRadius: BorderRadius.circular(8),
                            border: const Border(
                              bottom: BorderSide(width: 0.8, color: mainColor),
                            ),
                          ),
                        ),
                        submittedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            color: mainColor,
                            // borderRadius: BorderRadius.circular(19),
                            border: const Border(
                              bottom: BorderSide(width: 0.50, color: mainColor),
                            ),
                          ),
                        ),
                        errorPinTheme: defaultPinTheme.copyBorderWith(
                          border: Border.all(color: Colors.redAccent),
                        ),
                      ),
                    ),
                    SizedBox(height: heightSize(35)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: widthSize(40)),
                      child: buttonsWidget(
                          context,
                          heightSize(50),
                          constraints.maxWidth,
                          "Continue",
                          mainColor,
                          12, () async {
                        if (int.parse(otp.text.trim()) ==
                            int.parse(authController.userdata.value.otp)) {
                          await GetStorageClass().saveString(
                              userdataid, authController.userdata.value.id);
                          await GetStorageClass().saveString(userdataEmail,
                              authController.userdata.value.email);

                          authController.userId.value =
                              GetStorageClass().getString(userdataid)!;
                          Get.to(() => VerificationSuccess());
                        } else {
                          getErrorSnackBar("Invalid OTP");
                        }
                      }, false, Colors.white),
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
        },
      ),
    );
  }
}
