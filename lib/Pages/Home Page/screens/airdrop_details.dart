import "package:cached_network_image/cached_network_image.dart";
import "package:duwith_social/common/button-widget.dart";
import "package:duwith_social/models/airdrop_model.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";
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
                    padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
                    child: Column(
                      children: [
                        Container(
                          height: heightSize(60),
                          alignment: Alignment.center,
                          width: constraints.maxWidth,
                          decoration: BoxDecoration(
                            color: buttonColor2,
                            borderRadius: BorderRadius.all(
                                Radius.circular(widthSize(20))),
                          ),
                          child: CText(
                            text: airdropDetails.title,
                            size: 14.22,
                            color: const Color(0xFFECECEC),
                            fontFamily: UsedFonts.poppins,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: heightSize(20)),
                        Container(
                          height: heightSize(100),
                          padding:
                              EdgeInsets.symmetric(horizontal: widthSize(20)),
                          alignment: Alignment.center,
                          width: constraints.maxWidth,
                          decoration: BoxDecoration(
                            color: buttonColor2,
                            borderRadius: BorderRadius.all(
                                Radius.circular(widthSize(20))),
                          ),
                          child: CText(
                            text: airdropDetails.caption,
                            size: 14.22,
                            color: const Color(0xFFECECEC),
                            fontFamily: UsedFonts.poppins,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: heightSize(20)),
                        SizedBox(
                          height: heightSize(500),
                          child: Expanded(
                            child: ListView.builder(
                                itemCount: 6,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: CachedNetworkImage(
                                            imageUrl:
                                                airdropDetails.airdropLogo,
                                            placeholder: (context, url) =>
                                                const CircularProgressIndicator(),
                                            imageBuilder:
                                                (context, imageprovider) {
                                              return Container(
                                                height: heightSize(20),
                                                width: widthSize(20),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(8)),
                                                    image: DecorationImage(
                                                        image: imageprovider,
                                                        fit: BoxFit.fill)),
                                              );
                                            },
                                          ),
                                          title: const CText(
                                            text:
                                                "Hey get 100 points when you invite 30 persons",
                                            size: 18,
                                            color: textColor,
                                            fontFamily: UsedFonts.poppins,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: heightSize(15))
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ),
                        SizedBox(height: heightSize(50)),
                        buttonsWidget(context, heightSize(40), widthSize(100),
                            "Claim", mainColor, 18, () {
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
