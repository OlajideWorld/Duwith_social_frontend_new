// ignore_for_file: invalid_use_of_protected_member, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:duwith_social/Pages/Home%20Page/screens/airdrop_details.dart';
import 'package:duwith_social/models/airdrop_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../common/custom-text.dart';

import '../../../utils/color.dart';
import '../../../utils/sizes.dart';
import '../../Auth Page/services/socket_sevice.dart';
import '../controllers/home_controller.dart';

class AirdropListWidget extends StatefulWidget {
  final double width;
  const AirdropListWidget({super.key, required this.width});

  @override
  State<AirdropListWidget> createState() => _AirdropListWidgetState();
}

class _AirdropListWidgetState extends State<AirdropListWidget> {
  HomeController homeController = HomeController.instance;

  // final ScrollController scrollController = ScrollController();

  // @override
  // void initState() {
  //   super.initState();
  //   scrollController.addListener(() {
  //     if (scrollController.position.extentAfter < 500 &&
  //         !homeController.postloading.value) {
  //       homeController.fetchAirdrops();
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   scrollController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
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
                // controller: scrollController,
                scrollDirection: Axis.vertical,
                itemCount: homeController.airdropList.value.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: heightSize(10)),
                    child: Column(
                      children: [
                        AirdropDesign(
                          width: widget.width,
                          airdropDetails:
                              homeController.airdropList.value[index],
                        ),
                        SizedBox(
                          height: heightSize(20),
                        )
                      ],
                    ),
                  );
                  // if (index < homeController.airdropList.value.length) {

                  // } else {
                  //   return Padding(
                  //     padding: EdgeInsets.symmetric(vertical: heightSize(32)),
                  //     child: homeController.hasmoreData.value == true
                  //         ? const Center(
                  //             child: CircularProgressIndicator(
                  //               color: mainColor,
                  //             ),
                  //           )
                  //         : const CText(
                  //             text: "NO more posts",
                  //             size: 12,
                  //             color: timeColor,
                  //             fontFamily: UsedFonts.poppins,
                  //             fontWeight: FontWeight.w500,
                  //           ),
                  //   );
                  // }
                }),
          );
  }
}

class AirdropDesign extends StatelessWidget {
  final double width;
  final AirdropModel airdropDetails;

  AirdropDesign({
    super.key,
    required this.width,
    required this.airdropDetails,
  });

  RxBool isExpanded = false.obs;

  SocketService socket = SocketService.instance;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () async {
          homeController.airdropDetails.value = airdropDetails;
          // Get.to(() => AirdropDetailsScreen());
          await socket.getCommentByAirdropId(airdropDetails.id);
          // debugPrint(airdropDetails.id);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
          child: Container(
              alignment: Alignment.center,
              height: airdropDetails.media.single.type == "image"
                  ? isExpanded.value
                      ? heightSize(180)
                      : heightSize(150)
                  : isExpanded.value
                      ? heightSize(120)
                      : heightSize(100),
              width: width,
              decoration: const BoxDecoration(color: Color(0xFF28282C)),
              padding: EdgeInsets.symmetric(
                  horizontal: widthSize(10), vertical: heightSize(10)),
              child: airdropDetails.media.single.type == "image"
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
                                      imageUrl: airdropDetails.media.single.url,
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
                                      text: truncate(airdropDetails.title,
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
                                        "${truncate(airdropDetails.title, length: 70)}......",
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
                        airdropDetails.media.single.type == "image"
                            ? Expanded(
                                child: CachedNetworkImage(
                                  imageUrl: airdropDetails.media.single.url,
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
                            text: airdropDetails.title,
                            size: 10,
                            color: const Color(0xFFD7D7D7),
                            fontWeight: FontWeight.w400),
                      ],
                    )),
        ),
      );
    });
  }
}
