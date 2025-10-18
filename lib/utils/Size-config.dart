// ignore_for_file: file_names

import 'dart:developer';
import 'package:flutter/material.dart';

class SizeConfig {
  static late double _screenWidth;
  static late double _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static late double textMultiplier;
  static late double imageSizeMultiplier;
  static late double heightMultiplier;
  static late double widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints) {
    _screenWidth = constraints.maxWidth;
    _screenHeight = constraints.maxHeight;

    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100;

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;

    log(_blockHeight.toString());
    log(_blockWidth.toString());
  }
}

class InverseDiagonalClipper extends CustomClipper<Path> {
  final double inset;

  const InverseDiagonalClipper({this.inset = 20});

  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, 0); // top-left
    path.lineTo(size.width, 0); // top-right (full width)
    path.lineTo(size.width - inset, size.height); // bottom-right inset to left
    path.lineTo(0, size.height); // bottom-left
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
