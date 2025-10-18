// ignore_for_file: must_be_immutable

import 'package:duwith_social/Pages/Earn%20More%20Page/components/daily_target_list.dart';
import 'package:duwith_social/Pages/Earn%20More%20Page/components/daily_target_widget.dart';
import 'package:duwith_social/Pages/Earn%20More%20Page/controller/earn_controller.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../common/custom-text.dart';

class DailyTaskScreen extends StatelessWidget {
  const DailyTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EarnController earnController = EarnController.instance;
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
                      top: heightSize(30),
                      left: widthSize(30),
                      right: widthSize(30)),
                  child: SizedBox(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          dailyTaskAppBar(),
                          SizedBox(height: heightSize(33)),
                          dailyTaskChooseType(),
                          SizedBox(height: heightSize(18)),
                          //
                         
                          //
                          //
                         
                        ],
                      ),
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
