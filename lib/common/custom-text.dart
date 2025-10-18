// ignore_for_file: file_names

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/color.dart';
import '../utils/sizes.dart';

class CText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final double? wordSpacing;
  final VoidCallback? onClick;
  final String? fontFamily;
  final double? letterSpacing;
  final TextAlign? textAlign;
  final double? height;
  final bool? allowOverflow;
  const CText({
    Key? key,
    required this.text,
    this.size,
    this.fontWeight,
    this.color,
    this.wordSpacing,
    this.onClick,
    this.fontFamily,
    this.letterSpacing,
    this.textAlign,
    this.height,
    this.allowOverflow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: onClick == null
          ? Text(
              text,
              textAlign: textAlign ?? TextAlign.start,
              overflow: allowOverflow == false ? null : TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: fontSize(size ?? 14),
                fontWeight: fontWeight ?? FontWeight.w400,
                fontFamily: fontFamily ?? 'Poppins-Regular',
                color: color ?? Colors.white, //Colors.grey
                wordSpacing: wordSpacing,
                letterSpacing: letterSpacing ?? 0,
                height: height ?? 1,
              ),
            )
          : TextButton(
              onPressed: () => onClick?.call(),
              child: Text(
                text,
                textAlign: textAlign ?? TextAlign.start,
                overflow: allowOverflow == false ? null : TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: fontSize(size ?? 16),
                  fontWeight: fontWeight ?? FontWeight.w400,
                  fontFamily: fontFamily ?? 'Poppins-Regular',
                  color: color ?? Colors.white, //Colors.grey
                  wordSpacing: wordSpacing,
                  letterSpacing: letterSpacing ?? 0,
                  height: height ?? 1,
                ),
              ),
            ),
    );
  }
}

class UsedFonts {
  static const poppins = "Poppins";
  static const stalinistOne = "StalinistOne";
  static const rammetto = "RammettoOne";
  static const archivo = "ArchivoBlack";
  static const blackhan = "BlackHanSans";
}

class PostContent extends StatefulWidget {
  final RxBool isExpanded;
  final String text;
  final double size;

  final FontWeight fontWeight;
  final Color color;

  const PostContent({
    super.key,
    required this.text,
    required this.size,
    required this.fontWeight,
    this.color = Colors.white,
    required this.isExpanded,
  });

  @override
  _PostContentState createState() => _PostContentState();
}

class _PostContentState extends State<PostContent> {
  @override
  Widget build(BuildContext context) {
    String displayText = widget.text;
    bool showReadMore = widget.text.length > 100;

    if (!widget.isExpanded.value && showReadMore) {
      displayText = widget.text.substring(0, 100) + '... ';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          displayText,
          textAlign: TextAlign.start,
          style: GoogleFonts.openSans(
            fontSize: fontSize(16),
            fontWeight: FontWeight.w500,
            color: widget.color,
            // height: 1.8,
          ),
        ),
        if (showReadMore)
          GestureDetector(
            onTap: () {
              if (showReadMore) {
                setState(() {
                  widget.isExpanded.value = !widget.isExpanded.value;
                });
              }
            },
            child: Text(
              widget.isExpanded.value ? "Read less" : "Read more",
              style: GoogleFonts.poppins(
                fontSize: fontSize(widget.size),
                fontWeight: widget.fontWeight,
                color: Colors.blue,
              ),
            ),
          ),
      ],
    );
  }
}

class UserTextItem extends StatefulWidget {
  final String text;
  final RxBool isExpanded;
  final double width;
  const UserTextItem(
      {Key? key,
      required this.text,
      required this.isExpanded,
      required this.width})
      : super(key: key);

  @override
  State<UserTextItem> createState() => _UserTextItemState();
}

class _UserTextItemState extends State<UserTextItem> {
  static const _cutoff = 99;
  static const _cutoff2 = 360;
  static const _previewLines = 4;
  bool _needsReadMore = false;

  @override
  Widget build(BuildContext context) {
    final txt = widget.text;
    // Short case: show whole text in black box, large font
    if (txt.length <= _cutoff) {
      return Container(
        width: widget.width,
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          top: heightSize(80),
          left: widthSize(20),
          right: widthSize(20),
          bottom: heightSize(80),
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          txt,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: textColor,
            fontSize: fontSize(25),
            fontWeight: FontWeight.w600,
            height: 1.8,
          ),
        ),
      );
    } else if (txt.length <= _cutoff2) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            txt,
            style: GoogleFonts.openSans(
              color: textColor,
              fontSize: fontSize(16),
              fontWeight: FontWeight.w500,
              height: 1.8,
            ),
          ),
          const SizedBox(height: 4),
        ],
      );
    }

    // Long case: small font, truncated or full, no background
    final displayText =
        widget.isExpanded.value ? txt : '${txt.substring(0, _cutoff)}…';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          displayText,
          style: GoogleFonts.openSans(
            color: textColor,
            fontSize: fontSize(16),
            fontWeight: FontWeight.w500,
            height: 1.8,
          ),
          maxLines: widget.isExpanded.value ? null : _previewLines,
          overflow: widget.isExpanded.value
              ? TextOverflow.visible
              : TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () => setState(
              () => widget.isExpanded.value = !widget.isExpanded.value),
          child: Text(
            widget.isExpanded.value ? 'Read less' : 'Read more…',
            style: GoogleFonts.poppins(
              color: Colors.blueAccent,
              fontSize: fontSize(14),
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}
