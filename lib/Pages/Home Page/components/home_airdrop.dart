// ignore_for_file: invalid_use_of_protected_member

import 'package:cached_network_image/cached_network_image.dart';
import 'package:duwith_social/Pages/Home%20Page/screens/airdrop_details.dart';
import 'package:duwith_social/models/airdrop_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../common/custom-text.dart';

import '../../../utils/color.dart';
import '../../../utils/sizes.dart';
import '../../Auth Page/controller/auth_controller.dart';
import '../../Auth Page/services/socket_sevice.dart';
import '../controllers/home_controller.dart';

HomeController homeController = HomeController.instance;
SocketService socket = SocketService.instance;
AuthController authController = AuthController.instance;

airdropList(BuildContext context, double width) {
  return homeController.airdropList.value.isEmpty ||
          homeController.airdropList.value == null
      ? const Align(
          alignment: Alignment.center,
          child: Center(
            child: CText(
              text:
                  "Not able to fetch data, Check internet connection and try again",
              size: 18,
              color: textColor,
              fontFamily: UsedFonts.poppins,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      : Expanded(
          child: ListView.builder(
              itemCount: homeController.airdropList.value.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: heightSize(10)),
                  child: Column(
                    children: [
                      AirdropDesign(
                        width: width,
                        airdropDetails: homeController.airdropList.value[index],
                      ),
                    ],
                  ),
                );
              }),
        );
}

class AirdropDesign extends StatefulWidget {
  final double width;
  final AirdropModel airdropDetails;

  const AirdropDesign({
    super.key,
    required this.width,
    required this.airdropDetails,
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
        onTap: () async {
          Get.to(() => AirdropDetailsScreen(
                airdropDetails: widget.airdropDetails,
              ));

          await socket.getCommentByAirdropId(widget.airdropDetails.id);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
          child: Container(
              alignment: Alignment.center,
              height: widget.airdropDetails.media.single.type == "image"
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
              child: widget.airdropDetails.media.single.type == "image"
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: widthSize(177),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: widget
                                          .airdropDetails.media.single.url,
                                      placeholder: (context, url) => Align(
                                          alignment: Alignment.center,
                                          child: SizedBox(
                                              height: heightSize(30),
                                              width: widthSize(30),
                                              child:
                                                  const CircularProgressIndicator())),
                                      imageBuilder: (context, imageprovider) {
                                        return Container(
                                          height: heightSize(20),
                                          width: widthSize(20),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              image: DecorationImage(
                                                  image: imageprovider,
                                                  fit: BoxFit.fill)),
                                        );
                                      },
                                    ),
                                    SizedBox(width: widthSize(10)),
                                    CText(
                                      text: truncate(
                                          widget.airdropDetails.title,
                                          length: 7),
                                      size: 15,
                                      color: textColor,
                                      height: 0.8,
                                      fontFamily: UsedFonts.stalinistOne,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: widthSize(400),
                                  child: CText(
                                    text:
                                        "${truncate(widget.airdropDetails.title, length: 70)}......",
                                    size: 15,
                                    color: textColor,
                                    fontFamily: UsedFonts.poppins,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const CText(
                                  text: "23,400 Participants",
                                  size: 12,
                                  color: textColor3,
                                  fontFamily: UsedFonts.poppins,
                                  fontWeight: FontWeight.w500,
                                ),
                                Container(
                                  height: heightSize(20),
                                  width: widthSize(100),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(widthSize(15))),
                                      color: highlightColor),
                                  child: const CText(
                                    text: "Claim 50 Points",
                                    size: 12,
                                    color: textColor,
                                    fontFamily: UsedFonts.poppins,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )),
                        SizedBox(width: widthSize(10)),
                        widget.airdropDetails.media.single.type == "image"
                            ? Expanded(
                                child: CachedNetworkImage(
                                  imageUrl:
                                      widget.airdropDetails.media.single.url,
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
                            text: widget.airdropDetails.title,
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
