// ignore_for_file: invalid_use_of_protected_member

import 'package:duwith_social/Pages/Home%20Page/components/home_for_you.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

HomeController homeController = HomeController.instance;

newsList(BuildContext context, double width) {
  return Expanded(
      child: ListView.builder(
          itemCount: homeController.postDatas.value.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: heightSize(400),
              child: Column(
                children: [
                  newsDesign(
                      context,
                      width,
                      homeController.postDatas.value[index].name,
                      homeController.postDatas.value[index].image,
                      homeController.postDatas.value[index].content),
                  SizedBox(height: heightSize(7))
                ],
              ),
            );
          }));
}

newsDesign(BuildContext context, double width, String name, String image,
    String content) {
  RxBool isExpanded = false.obs;

  return Container(
    height: isExpanded.value ? heightSize(400) : heightSize(225),
    width: width,
    decoration: const BoxDecoration(color: Color(0xFF28282C)),
    padding: EdgeInsets.symmetric(
        horizontal: widthSize(20), vertical: heightSize(23)),
    child: Column(
      children: [
        postBarTitle(width, name, image, context),
        SizedBox(height: heightSize(10)),
        Container(
          height: heightSize(168),
          width: width,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Image.asset(
            "assets/images/social.png",
            fit: BoxFit.contain,
          ),
        ),
      ],
    ),
  );
}
