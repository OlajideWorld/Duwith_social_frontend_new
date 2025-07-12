import 'package:cached_network_image/cached_network_image.dart';
import 'package:duwith_social/models/news_models.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/custom-text.dart';

class MediaTempMediaDesign extends StatefulWidget {
  final NewsUpdate newsPost;
  final double width;
  const MediaTempMediaDesign(
      {super.key, required this.newsPost, required this.width});

  @override
  State<MediaTempMediaDesign> createState() => _MediaTempMediaDesignState();
}

class _MediaTempMediaDesignState extends State<MediaTempMediaDesign> {
  RxBool isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(250),
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: widget.newsPost.media.single.url,
            placeholder: (context, url) => const CircularProgressIndicator(),
            imageBuilder: (context, imageprovider) {
              return Container(
                height: heightSize(200),
                width: widget.width,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                        image: imageprovider, fit: BoxFit.fill)),
              );
            },
          ),
          SizedBox(height: heightSize(5)),
          Text(
            truncate(widget.newsPost.caption, length: 20),
            style: GoogleFonts.poppins(
              color: textColor3,
              fontSize: fontSize(15),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

showMediaImages({required NewsUpdate newsPost, required double width}) {
  return SizedBox(
    height: heightSize(250),
    width: widthSize(150),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: newsPost.media.single.url,
          placeholder: (context, url) => const CircularProgressIndicator(),
          imageBuilder: (context, imageprovider) {
            return Container(
              height: heightSize(180),
              width: width,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  image:
                      DecorationImage(image: imageprovider, fit: BoxFit.fill)),
            );
          },
        ),
        SizedBox(height: heightSize(10)),
        Text(
          truncate(newsPost.caption, length: 12),
          style: GoogleFonts.poppins(
            color: const Color(0xFFD7D7D7),
            fontSize: fontSize(15),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: heightSize(5)),
        Text(
          "Olajide Dev",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: textColor3,
            fontSize: fontSize(12),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}
