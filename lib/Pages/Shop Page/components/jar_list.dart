// ignore_for_file: invalid_use_of_protected_member

import 'package:duwith_social/Pages/Shop%20Page/components/dog_list.dart';
import 'package:duwith_social/Pages/Shop%20Page/components/shop_components.dart';
import 'package:duwith_social/Pages/Shop%20Page/screens/jar_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../utils/sizes.dart';
import '../../Home Page/controllers/home_controller.dart';

HomeController homeController = HomeController.instance;

showJarList(BuildContext context) {
  return SizedBox(
    height: heightSize(1070),
    child: Column(
      children: [
        shoptypeAdvert(
            color1: const Color(0xFFE6A94C),
            color2: const Color(0xFFD7350B),
            textColorUsed: const Color(0xFFFBE9CD),
            type: "Jar",
            image: "assets/images/Shop/upgradejar.png",
            context: context),
        SizedBox(height: heightSize(13)),
        Expanded(
          child: MasonryGridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: homeController.dogsList.value.length,
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of items per row
              ),
              mainAxisSpacing: widthSize(13),
              crossAxisSpacing: heightSize(12),
              itemBuilder: (context, index) {
                return gridviewWidget(
                    homeController.jarList.value[index].image,
                    homeController.jarList.value[index].name,
                    homeController.jarList.value[index].amount,
                    context,
                    homeController.jarList.value[index].isBig, () {
                  Get.to(() => JarPreviewScreen());
                });
              }),
        ),
      ],
    ),
  );
}
