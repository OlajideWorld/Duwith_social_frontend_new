// ignore_for_file: invalid_use_of_protected_member, must_be_immutable

import 'package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart';
import 'package:duwith_social/Pages/Auth%20Page/services/socket_sevice.dart';
import 'package:duwith_social/Pages/Earn%20More%20Page/components/social_bottom_sheet.dart';
import 'package:duwith_social/Pages/Earn%20More%20Page/controller/earn_controller.dart';
import 'package:duwith_social/common/getxmessage.dart';
import 'package:duwith_social/models/social_task_model.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/custom-text.dart';
import '../../../utils/color.dart';

class SocialTaskDetailsScreen extends StatefulWidget {
  final String taskName;
  final String taskImage;
  const SocialTaskDetailsScreen({
    super.key,
    required this.taskName,
    required this.taskImage,
  });

  @override
  State<SocialTaskDetailsScreen> createState() =>
      _SocialTaskDetailsScreenState();
}

class _SocialTaskDetailsScreenState extends State<SocialTaskDetailsScreen> {
  EarnController earnController = EarnController.instance;

  AuthController authController = AuthController.instance;

  SocketService socketService = SocketService.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Obx(() {
            return SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: widthSize(30), vertical: heightSize(30)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CText(
                        text: "${widget.taskName} Task",
                        color: const Color(0xFFD6D6E4),
                        size: 18,
                        fontFamily: UsedFonts.stalinistOne,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: heightSize(20)),
                      Expanded(
                          child: ListView.builder(
                              itemCount:
                                  earnController.socialTaskList.value.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    socialWidgetListTask(
                                      context,
                                      constraints.maxWidth,
                                      widget.taskImage,
                                      "${widget.taskName} Task ${index + 1} ",
                                      () async {
                                        var data = {
                                          "type": earnController.type.value,
                                          "socialId": earnController
                                              .socialTaskList.value[index].id,
                                          "userId": authController.userId.value
                                        };
                                        if (earnController.socialTaskList
                                            .value[index].completedBy
                                            .contains(authController
                                                .userdata.value.id)) {
                                          getSuccessSnackBar(
                                              "You have completed this task");
                                        } else {
                                          await socketService
                                              .updateSocialTask(data);
                                          earnController.launchInBrowser(
                                              Uri.parse(earnController
                                                  .socialTaskList
                                                  .value[index]
                                                  .socialLink));
                                          await socket.getSocialTask(
                                              earnController.type.value);
                                          // setState(() {});
                                        }
                                      },
                                      earnController
                                          .socialTaskList.value[index],
                                    ),
                                    SizedBox(
                                      height: heightSize(10),
                                    )
                                  ],
                                );
                              }))
                    ],
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
