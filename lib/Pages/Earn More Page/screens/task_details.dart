// ignore_for_file: invalid_use_of_protected_member

import 'package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart';
import 'package:duwith_social/Pages/Auth%20Page/services/socket_sevice.dart';
import 'package:duwith_social/Pages/Earn%20More%20Page/components/social_bottom_sheet.dart';
import 'package:duwith_social/Pages/Earn%20More%20Page/controller/earn_controller.dart';
import 'package:duwith_social/common/getxmessage.dart';
import 'package:duwith_social/models/social_task_model.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';

import '../../../common/custom-text.dart';
import '../../../utils/color.dart';

class SocialTaskDetailsScreen extends StatelessWidget {
  final String taskName;
  final String taskImage;
  final SocialModel socialModelData;
  SocialTaskDetailsScreen(
      {super.key,
      required this.taskName,
      required this.taskImage,
      required this.socialModelData});

  EarnController earnController = EarnController.instance;
  AuthController authController = AuthController.instance;
  SocketService socketService = SocketService.instance;

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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CText(
                      text: "$taskName Task",
                      color: const Color(0xFFD6D6E4),
                      size: 18,
                      fontFamily: UsedFonts.stalinistOne,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: heightSize(20)),
                    Expanded(
                        child: ListView.builder(itemBuilder: (context, index) {
                      return socialWidget(
                          context,
                          constraints.maxWidth,
                          taskImage,
                          "$taskName ${earnController.socialTaskList.value.length}",
                          () async {
                        var data = {
                          "type": 1,
                          "socialId": socialModelData.id,
                          "userId": authController.userId.value
                        };
                        if (earnController.socialTaskList.value
                            .contains(authController.userdata.value.id)) {
                          getSuccessSnackBar("You have completed this task");
                        } else {}
                      });
                    }))
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
