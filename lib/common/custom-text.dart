// ignore_for_file: file_names

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

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
}

class PostContent extends StatefulWidget {
  final RxBool isExpanded;
  final String text;
  final double size;
  final String fontFamily;
  final FontWeight fontWeight;
  final Color color;

  const PostContent({
    super.key,
    required this.text,
    required this.size,
    required this.fontFamily,
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

    return GestureDetector(
      onTap: () {
        if (showReadMore) {
          setState(() {
            widget.isExpanded.value = !widget.isExpanded.value;
          });
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            displayText,
            style: TextStyle(
              fontSize: widget.size,
              fontFamily: widget.fontFamily,
              fontWeight: widget.fontWeight,
              color: widget.color,
            ),
          ),
          if (showReadMore)
            Text(
              widget.isExpanded.value ? "Read less" : "Read more",
              style: TextStyle(
                fontSize: widget.size,
                fontFamily: widget.fontFamily,
                fontWeight: widget.fontWeight,
                color: Colors.blue,
              ),
            ),
        ],
      ),
    );
  }
}
