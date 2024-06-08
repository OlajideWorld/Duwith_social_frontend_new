// ignore_for_file: invalid_use_of_protected_member

import 'package:cached_network_image/cached_network_image.dart';
import 'package:duwith_social/Pages/Home%20Page/screens/airdrop_details.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../common/custom-text.dart';
import '../../../models/news_models.dart';

import '../../../utils/sizes.dart';
import '../controllers/home_controller.dart';

HomeController homeController = HomeController.instance;

airdropList(BuildContext context, double width) {
  return Expanded(
    child: ListView.builder(
        itemCount: homeController.airdropList.value.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: heightSize(10)),
            child: Column(
              children: [
                AirdropDesign(
                  width: width,
                  image: homeController.airdropList.value[index].media,
                  content: homeController.airdropList.value[index].caption,
                  likes: homeController.airdropList.value[index].likes.length,
                  dislike:
                      homeController.airdropList.value[index].dislikes.length,
                  comment:
                      homeController.airdropList.value[index].comments.length,
                ),
              ],
            ),
          );
        }),
  );
}

class AirdropDesign extends StatefulWidget {
  final double width;
  final List<Media> image;
  final String content;
  final int likes;
  final int dislike;
  final int comment;
  const AirdropDesign({
    super.key,
    required this.width,
    required this.image,
    required this.content,
    required this.likes,
    required this.dislike,
    required this.comment,
  });

  @override
  State<AirdropDesign> createState() => _AirdropDesignState();
}

class _AirdropDesignState extends State<AirdropDesign> {
  RxBool isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () => Get.to(() => AirdropDetailsScreen(
            title: "AIrdrop update",
            body: widget.content,
            url:
                "https://developers.applovin.com/en/flutter/overview/integration")),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
          child: Container(
              alignment: Alignment.center,
              height: widget.image[0].type == "image"
                  ? isExpanded.value
                      ? heightSize(180)
                      : heightSize(150)
                  : isExpanded.value
                      ? heightSize(120)
                      : heightSize(100),
              width: widget.width,
              decoration: const BoxDecoration(color: Color(0xFF28282C)),
              padding: EdgeInsets.symmetric(
                  horizontal: widthSize(10), vertical: heightSize(10)),
              child: widget.image[0].type == "image"
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: widthSize(177),
                          child: PostContent(
                              isExpanded: isExpanded,
                              text: widget.content,
                              size: 10,
                              color: const Color(0xFFD7D7D7),
                              fontFamily: UsedFonts.poppins,
                              fontWeight: FontWeight.w400),
                        ),
                        widget.image[0].type == "image"
                            ? Expanded(
                                child: CachedNetworkImage(
                                  imageUrl: widget.image[0].url,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  imageBuilder: (context, imageprovider) {
                                    return Container(
                                      height: heightSize(200),
                                      // width: widthSize(170),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          image: DecorationImage(
                                              image: imageprovider,
                                              fit: BoxFit.fill)),
                                    );
                                  },
                                ),
                              )
                            : const SizedBox(),
                      ],
                    )
                  : Column(
                      children: [
                        PostContent(
                            isExpanded: isExpanded,
                            text: widget.content,
                            size: 10,
                            color: const Color(0xFFD7D7D7),
                            fontFamily: UsedFonts.poppins,
                            fontWeight: FontWeight.w400),
                      ],
                    )),
        ),
      );
    });
  }
}
