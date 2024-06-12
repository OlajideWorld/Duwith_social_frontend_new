import "package:cached_network_image/cached_network_image.dart";
import "package:duwith_social/common/button-widget.dart";
import "package:duwith_social/models/airdrop_model.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:get/get.dart";
import "package:url_launcher/url_launcher.dart";

import "../../../common/custom-text.dart";
import "../../../utils/color.dart";

class AirdropDetailsScreen extends StatelessWidget {
  final AirdropModel airdropDetails;
  const AirdropDetailsScreen({
    super.key,
    required this.airdropDetails,
  });

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
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: widthSize(20), vertical: heightSize(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        backbutton(onTap: () => Get.back()),
                        SizedBox(height: heightSize(20)),
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
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      image: DecorationImage(
                                          image: imageprovider,
                                          fit: BoxFit.fill)),
                                );
                              },
                            ),
                            SizedBox(width: widthSize(10)),
                            CText(
                              text: truncate(airdropDetails.title, length: 7),
                              size: 15,
                              color: textColor,
                              height: 0.8,
                              fontFamily: UsedFonts.stalinistOne,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        SizedBox(height: heightSize(20)),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: widthSize(10),
                              vertical: heightSize(10)),
                          decoration: BoxDecoration(
                            color: buttonColor2,
                            borderRadius: BorderRadius.all(
                                Radius.circular(widthSize(20))),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CText(
                                text: "Description",
                                size: 18,
                                color: const Color(0xFFECECEC),
                                fontFamily: UsedFonts.blackhan,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(height: heightSize(10)),
                              CText(
                                text: airdropDetails.title,
                                size: 15,
                                color: const Color(0xFFECECEC),
                                fontFamily: UsedFonts.archivo,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(height: heightSize(10)),
                              CText(
                                text: airdropDetails.caption,
                                size: 13,
                                color: const Color(0xFFECECEC),
                                fontFamily: UsedFonts.poppins,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: heightSize(20)),
                        SizedBox(
                          height: heightSize(350),
                          child: ListView.builder(
                              itemCount: airdropDetails.activities.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: heightSize(70),
                                        width: constraints.maxWidth,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: widthSize(10),
                                            vertical: heightSize(10)),
                                        decoration: BoxDecoration(
                                            color: navbarColor2,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    widthSize(10)))),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl: airdropDetails
                                                  .media.single.url,
                                              placeholder: (context, url) => Align(
                                                  alignment: Alignment.center,
                                                  child: SizedBox(
                                                      height: heightSize(50),
                                                      width: widthSize(50),
                                                      child:
                                                          const CircularProgressIndicator())),
                                              imageBuilder:
                                                  (context, imageprovider) {
                                                return Container(
                                                  height: heightSize(20),
                                                  width: widthSize(20),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  10)),
                                                      image: DecorationImage(
                                                          image: imageprovider,
                                                          fit: BoxFit.fill)),
                                                );
                                              },
                                            ),
                                            SizedBox(width: widthSize(9)),
                                            Expanded(
                                              child: CText(
                                                text: airdropDetails
                                                    .activities[index],
                                                textAlign: TextAlign.left,
                                                size: 15,
                                                color: navbarColor,
                                                fontFamily: UsedFonts.poppins,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: heightSize(15))
                                    ],
                                  ),
                                );
                              }),
                        ),
                        SizedBox(height: heightSize(10)),
                        Row(
                          children: [
                            const CText(
                              text: "Reward: ",
                              size: 18,
                              color: textColor,
                              fontFamily: UsedFonts.poppins,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(width: widthSize(10)),
                            Container(
                              height: heightSize(20),
                              width: widthSize(100),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(widthSize(15))),
                                  color: Color.fromARGB(255, 146, 182, 223)),
                              child: const CText(
                                text: "50 Points",
                                size: 12,
                                color: textColor,
                                fontFamily: UsedFonts.poppins,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: heightSize(30)),
                        buttonsWidget(context, heightSize(50),
                            constraints.maxWidth, "Claim", mainColor, 18, () {
                          final website = Uri.parse(airdropDetails.airdropLink);
                          // External App
                          launchUrl(website,
                              mode: LaunchMode.externalApplication);
                          // In App Webview
                          // launchUrl(website, mode: LaunchMode.inAppBrowserView);
                        }, false, textColor)
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
